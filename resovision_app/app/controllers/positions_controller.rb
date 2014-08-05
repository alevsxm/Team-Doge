class PositionsController < ApplicationController

  def update
    @position = Position.find(params[:id])
    if @position.update(position_params)
      render json: @position
    else
      redirect_to edit_position_path(@position)
    end
  end

end
