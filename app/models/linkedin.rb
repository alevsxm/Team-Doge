class Linkedin < ActiveRecord::Base

  API_KEY = ENV['LINKEDIN_API_KEY'] #Your app's API key
  API_SECRET = ENV['LINKEDIN_SECRET_KEY'] #Your app's API secret
  REDIRECT_URI = 'http://resovisions.herokuapp.com/accept' #Redirect users after authentication to this path, ensure that you have set up your routes to handle the callbacks
  STATE = SecureRandom.hex(15) #A unique long string that is not easy to guess

  #Instantiate your OAuth2 client object
  def self.client
    OAuth2::Client.new(
       API_KEY,
       API_SECRET,
       :authorize_url => "/uas/oauth2/authorization?response_type=code", #LinkedIn's authorization path
       :token_url => "/uas/oauth2/accessToken", #LinkedIn's access token path
       :site => "resovisions.herokuapp.com"
     )
  end


  # def self.authorize
  #   #Redirect your user in order to authenticate
  # end

  def self.create_all(response_hash)
    user = User.create_user(response_hash)
    resovision = Resovision.create_resovision(response_hash)
    positions = Position.create_positions(response_hash)
    educations = Education.create_educations(response_hash)
    resovision.positions.push(positions)
    resovision.educations.push(educations)
    user.resovision = resovision
    user
  end

end
