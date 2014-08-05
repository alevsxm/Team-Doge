
require 'pry'
require 'oauth'
require 'json'

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
            'positions', 'educations', 'id', 'picture-url'].join(',')

  # API call to retrieve profile using access token
  # Currently making call based on user id
  # If you want to make call based on current login use ~ in place of id=#{user_id}
  ### Alex's info:
  # user_id: jr8obGuqo-
  # id=#{jr8obGuqo-}    in place of the ~
  response = @access_token.get("http://api.linkedin.com/v1/people/~:(#{fields})?format=json")

  response_hash = JSON.parse(response.body)

  binding.pry

  #################
  ##### users #####
  #################

  # linkedin_email =
  # linkedin_pw =

  #################
  ## resovisions ##
  #################

  # linkedin_id = response_hash["id"]
  # first_name = response_hash["firstName"]
  # last_name = response_hash["lastName"]
  # headline = response_hash["headline"]
  # location = response_hash["location"]["name"]
  # industry = response_hash["industry"]
  # num_positions = response_hash["positions"]["_total"]
  # num_educations = response_hash["educations"]["_total"]
  # pic_url = response_hash["pictureUrl"]

  #################
  ### positions ###
  #################

  ## positions_array = response_hash["positions"]["values"]

  # title = response_hash["positions"]["values"][0]["title"]
  # summary = response_hash["positions"]["values"][0]["summary"]
  # start_year = response_hash["positions"]["values"][0]["startDate"]["year"]
  # start_month = response_hash["positions"]["values"][0]["startDate"]["month"]
  # is_current = response_hash["positions"]["values"][0]["isCurrent"]
  # company_name = response_hash["positions"]["values"][0]["company"]["name"]

  #################
  ## educations ##
  #################

  # school_name = response_hash["educations"]["values"][0]["schoolName"]
  # degree = response_hash["educations"]["values"][0]["degree"]
  # field_of_study = response_hash["educations"]["values"][0]["fieldOfStudy"]
  # start_year = response_hash["educations"]["values"][0]["startDate"]["year"]
  # end_year = response_hash["educations"]["values"][0]["endDate"]["year"]











  ##
