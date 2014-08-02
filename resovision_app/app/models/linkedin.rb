class Linkedin < ActiveRecord::Base

  def self.get_info(user_id)

  api_key = ENV['LINKEDIN_API_KEY']
  api_secret = ENV['LINKEDIN_SECRET_KEY']

  configuration = { :site => 'https://api.linkedin.com',
                            :authorize_path => '/uas/oauth/authenticate',
                            :request_token_path => '/uas/oauth/requestToken',
                            :access_token_path => '/uas/oauth/accessToken' }

  consumer = OAuth::Consumer.new(api_key, api_secret, configuration)

  request_token = consumer.get_request_token

  puts "Please visit this URL: " + request_token.authorize_url + " in your browser and then input the numerical code you are provided here: "

  # Set verifier code
  verifier = $stdin.gets.strip

  # Pass in verifier code in order to upgrade for access token
  @access_token = request_token.get_access_token(:oauth_verifier => verifier)

  fields = ['first-name', 'last-name', 'headline', 'location', 'industry',
            'positions', 'educations', 'skills', 'picture-url'].join(',')

  # API call to retrieve profile using access token
  # Currently making call based on user id
  # If you want to make call based on current login use ~ in place of id=#{user_id}
  response = @access_token.get("http://api.linkedin.com/v1/people/id=#{user_id}:(#{fields})?format=json")

  response_hash = JSON.parse(response.body)

  end

end
