class SpaceRequestsController < ApplicationController
  def confirm
    @space_request = SpaceRequest.find_by(id: params[:id])

    if @space_request
      @space_request.confirmed!
      flash[:notice] = 'Success!'
    else
      flash[:error] = 'Fail!'
    end

    redirect_to root_path
  end

  def re_confirm
    @space_request = SpaceRequest.find_by(id: params[:id])

    if @space_request
      @space_request.update(countdown_start_at: DateTime.now)
      @space_request.confirmed!
      flash[:notice] = 'Success!'
    else
      flash[:error] = 'Fail!'
    end

    redirect_to root_path
  end
end
