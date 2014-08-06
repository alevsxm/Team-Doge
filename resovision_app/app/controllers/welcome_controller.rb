class WelcomeController < ApplicationController

  def index
    redirect_to Linkedin.client.auth_code.authorize_url(:scope => 'r_fullprofile r_basicprofile',
                                               :state => Linkedin::STATE,
                                               :redirect_uri => Linkedin::REDIRECT_URI)
  end


  # This method will handle the callback once the user authorizes your application
  def accept
      #Fetch the 'code' query parameter from the callback
          code = params[:code]
          state = params[:state]

          if !state.eql?(Linkedin::STATE)
             #Reject the request as it may be a result of CSRF
          else
            #Get token object, passing in the authorization code from the previous step
            token = Linkedin.client.auth_code.get_token(code, :redirect_uri => Linkedin::REDIRECT_URI)

            #Use token object to create access token for user
            #(this is required so that you provide the correct param name for the access token)
            access_token = OAuth2::AccessToken.new(Linkedin.client, token.token, {
              :mode => :query,
              :param_name => "oauth2_access_token",
              })

            fields = ['first-name', 'last-name', 'headline', 'location', 'industry',
                      'positions', 'educations', 'summary', 'picture-url', 'id'].join(',')

            #Use the access token to make an authenticated API call
            response = access_token.get("https://api.linkedin.com/v1/people/~:(#{fields})?format=json")

            #set response.body to Hash variable
            response_hash = JSON.parse(response.body)

            # creates all objects assoc with user and returns user
            current_user = Linkedin.create_all(response_hash)

            # Handle HTTP responses
            case response
              when Net::HTTPUnauthorized
                # Handle 401 Unauthorized response
              when Net::HTTPForbidden
                # Handle 403 Forbidden response
            end
        end
        redirect_to user_path(current_user)
  end

  def home
  end

  # private
  # def user_params
  #   params.require(:user).permit(:linkedin_member_id)
  # end

end
