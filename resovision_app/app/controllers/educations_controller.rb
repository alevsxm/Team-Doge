class EducationsController < ApplicationController

  def update
    @education = Education.find(params[:id])
    if @education.update(education_params)
      render json: @education
    else
      redirect_to edit_education_path(@education)
    end
  end

end
