class SpaceRequestsController < ApplicationController
  def index
    @space_requests = SpaceRequest.all
  end

  def show
    @space_request = SpaceRequest.find(params[:id])
  end

  def new
    @space_request = SpaceRequest.new
  end

  def create
    @space_request = SpaceRequest.new(space_request_params)

    if @space_request.save
      redirect_to root_path
    else
      #todo ...
    end
  end

  def edit
    @space_request = SpaceRequest.find(params[:id])
  end

  def update
    @space_request = SpaceRequest.find(params[:id])

    if @space_request.update(space_request_params)
      redirect_to root_path
    else
      #todo ...
    end
  end

  def destroy
    @space_request = SpaceRequest.find(params[:id])
    @space_request.destroy

    redirect_to root_path
  end

  private
  def space_request_params
    params.require(:space_requests).permit(:status, :renewed_at, :requestor_id)
  end
end
