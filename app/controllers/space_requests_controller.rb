class SpaceRequestsController < ApplicationController
  include ConstModule

  def confirm
    @space_request = SpaceRequest.find_by(id: params[:id])

    if @space_request
      @space_request.confirmed!
      flash[:notice] = CONFIRMATION_SUCCES_MESSAGE
    else
      flash[:error] = GENERAL_FAIL_MESSAGE
    end

    redirect_to root_path
  end

  def re_confirm
    @space_request = SpaceRequest.find_by(id: params[:id])

    if @space_request
      @space_request.update(countdown_start_at: DateTime.now)
      @space_request.confirmed!
      flash[:notice] = CONFIRMATION_SUCCES_MESSAGE
    else
      flash[:error] = GENERAL_FAIL_MESSAGE
    end

    redirect_to root_path
  end
end
