class EducationsController < ApplicationController

  def update
    @education = Education.find(params[:id])
    authorize! :update, @position
    if @education.update(education_params)
      render json: @education
    else
      redirect_to edit_education_path(@education)
    end
  end

  def education_params
    params.require(:education).permit(:school_name, :degree, :field_of_study,
                                      :start_year, :end_year)
  end

end
