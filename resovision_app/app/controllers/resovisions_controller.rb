
class ResovisionsController < ApplicationController

	before_action :authenticate, only: [:new, :create]

	def index
		@resovisions = Resovision.all
	end

	def new
		@resovision = Resovision.new
	end

	def create
		@resovision = Resovision.new(resovision_params)
    if @resovision.save
      redirect_to(resovision_path(@resovision))
    else
      redirect_to new_resovision_path
    end
	end

	def show
		@resovision = Resovision.find(params[:id])
		@positions =  Position.where(resovision_id: params[:id])
		@educations = Education.where(resovision_id: params[:id])
		# @videos= Videos.where(resovision_id: params[:id])
	end

	def edit
		@resovision = Resovision.find(params[:id])
		@positions =  Position.where(resovision_id: params[:id])
		@educations = Education.where(resovision_id: params[:id])
		# @videos= Videos.where(resovision_id: params[:id])
	end

	def update
		@resovision = Resovision.find(params[:id])
		@positions =  Position.where(resovision_id: params[:id])
		@educations = Education.where(resovision_id: params[:id])
		# @videos= Videos.where(resovision_id: params[:id])

		if @resovision.update(resovision_params)
			render json: @resovision
    else
      redirect_to edit_resovision_path(@resovision)
    end
	end

	def destroy
		@resovision = Resovision.find(params[:id])
    ## @resovision.empty?
		@resovision.destroy
    redirect_to user_path(@user)
	end

	private
  def resovision_params
    params.require(:resovision).permit(:linkedin_id, :last_name, :first_name,
																			:headline, :location, :industry,
																			:num_positions, :num_educations,
																			:pic_url, :user_id)
  end

end
