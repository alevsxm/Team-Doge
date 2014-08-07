class PositionsController < ApplicationController

  def update
    @position = Position.find(params[:id])
    authorize! :update, @position
    if @position.update(position_params)
      render json: @position
    else
      redirect_to edit_position_path(@position)
    end
  end

  def position_params
    params.require(:position).permit(:title, :start_year, :company_name,
                                    :start_month, :end_year, :end_month, :summary)
  end

end
