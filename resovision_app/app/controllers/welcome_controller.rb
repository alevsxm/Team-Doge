class WelcomeController < ApplicationController

  API_KEY = ENV['LINKEDIN_API_KEY'] #Your app's API key
  API_SECRET = ENV['LINKEDIN_SECRET_KEY'] #Your app's API secret
  REDIRECT_URI = 'http://localhost:3000/accept' #Redirect users after authentication to this path, ensure that you have set up your routes to handle the callbacks
  STATE = SecureRandom.hex(15) #A unique long string that is not easy to guess

  #Instantiate your OAuth2 client object
  def client
    OAuth2::Client.new(
       API_KEY,
       API_SECRET,
       :authorize_url => "/uas/oauth2/authorization?response_type=code", #LinkedIn's authorization path
       :token_url => "/uas/oauth2/accessToken", #LinkedIn's access token path
       :site => "https://www.linkedin.com"
     )
  end

  def index
    authorize
  end

  def authorize
    #Redirect your user in order to authenticate
    redirect_to client.auth_code.authorize_url(:scope => 'r_fullprofile r_basicprofile',
                                               :state => STATE,
                                               :redirect_uri => REDIRECT_URI)
  end

  # This method will handle the callback once the user authorizes your application
  def accept
      #Fetch the 'code' query parameter from the callback
          code = params[:code]
          state = params[:state]

          if !state.eql?(STATE)
             #Reject the request as it may be a result of CSRF
          else
            #Get token object, passing in the authorization code from the previous step
            token = client.auth_code.get_token(code, :redirect_uri => REDIRECT_URI)

            #Use token object to create access token for user
            #(this is required so that you provide the correct param name for the access token)
            access_token = OAuth2::AccessToken.new(client, token.token, {
              :mode => :query,
              :param_name => "oauth2_access_token",
              })

            fields = ['first-name', 'last-name', 'headline', 'location', 'industry',
                      'positions', 'educations', 'summary', 'picture-url', 'id'].join(',')

            #Use the access token to make an authenticated API call
            response = access_token.get("https://api.linkedin.com/v1/people/~:(#{fields})?format=json")

            #Print body of response to command line window
            puts response.body

            #set response.body to Hash variable
            response_hash = JSON.parse(response.body)

            @user = create_user(response_hash)
            @resovision = create_resovision(response_hash)
            @positions = create_positions(response_hash)
            @educations = create_educations(response_hash)
            @resovision.positions.push(@positions)
            @resovision.educations.push(@educations)
            @user.resovision = @resovision

            # Handle HTTP responses
            case response
              when Net::HTTPUnauthorized
                # Handle 401 Unauthorized response
              when Net::HTTPForbidden
                # Handle 403 Forbidden response
            end
        end
        redirect_to user_path(@user)
    end

    def create_user(response_hash)
      linkedin_member_id = response_hash["id"]
      User.create!(linkedin_member_id: linkedin_member_id)
    end

    def create_resovision(response_hash)
      first_name = response_hash["firstName"]
      last_name = response_hash["lastName"]
      headline = response_hash["headline"]
      location = response_hash["location"]["name"]
      industry = response_hash["industry"]
      num_positions = response_hash["positions"]["_total"]
      num_educations = response_hash["educations"]["_total"]
      summary = response_hash["summary"]
      pic_url = response_hash["pictureUrl"]

      Resovision.create!(first_name: first_name,
                         last_name: last_name,
                         location: location,
                         pic_url: pic_url,
                         industry: industry,
                         num_positions: num_positions,
                         num_educations: num_educations,
                         summary: summary,
                         headline: headline)
    end

    def create_positions(response_hash)
      resovision_positions_array = [] #array of positions to eventually push into resovision
      position_response_array = response_hash["positions"]["values"]
      position_response_array.each do |position|
        resovision_positions_array.push(Position.create!(title: position["title"],
                         summary: position["summary"],
                         start_year: position["startDate"]["year"],
                         start_month: position["startDate"]["month"],
                         end_year: position["endDate"].nil? ? "Is current position" : position["endDate"]["year"],
                         end_month: position["endMonth"].nil? ? "Is current position" : position["endMonth"]["year"],
                         is_current: position["isCurrent"],
                         company_name: position["company"]["name"]
                         ))
      end
      resovision_positions_array
    end

    def create_educations(response_hash)

      resovision_education_array = [] #array of educations to eventually push into resovision
      education_response_array = response_hash["educations"]["values"] #array of edcuations from API call
      education_response_array.each do |education|
        resovision_education_array.push(Education.create!(school_name: education["schoolName"],
                                        degree: education["degree"],
                                        field_of_study: education["fieldOfStudy"],
                                        start_year: education["startDate"]["year"],
                                        end_year: education["endDate"].nil? ? "Currently in school" : education["endDate"]["year"]))
      end
      resovision_education_array
    end

    def home
    end

    private
    def user_params
      params.require(:user).permit(:linkedin_member_id)
    end

end
