class ResovisionsController < ApplicationController
	#index
	def index 
		@resovisions.all 	
	end 
	#edit
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
