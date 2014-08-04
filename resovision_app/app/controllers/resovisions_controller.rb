require 'pry-rails'
require 'linkedin'
class ResovisionsController < ApplicationController
	#index
	def index 
		@resovisions.all 	
	end 
	#edit
	def new 
		client = LinkedIn::Client.new( '75yxb7noe10oi2', '4soyrz71IfdV9WQZ' )
		request_token = client.request_token
		rtoken = request_token.token
		rsecret = request_token.secret
		@url =request_token.authorize_url
		client.authorize_from_access(rtoken, rsecret)
		 
	end
	binding.pry
	def edit
		@resovision = Resovision.find('linkedin_id')
		@educations= Educations.where(id: 'resovision_id')
		@positions=  Positions.where(id: 'resovision_id')
		@videos= Videos.where(id: 'resovision_id')
	end
	#show
	def show
		@resovision = Resovision.find('linkedin_id')
		@educations= Educations.where(id: 'resovision_id')
		@positions=  Positions.where(id: 'resovision_id')
		@videos= Videos.where(id: 'resovision_id')
	end 
end
