class RequestorsController < ApplicationController
  def index
    @requestors = Requestor.all
  end

  def new
    @requestor = Requestor.new
  end

  def create
    # Find requestor by email - if not exist create with request params
    @requestor = Requestor.find_or_initialize_by(email: params[:requestor][:email])
    @requestor.assign_attributes(requestor_params)

    if @requestor.save
      redirect_to root_path #todo add flash message
    else
      render :new
    end
  end


  private
  def requestor_params
    params.require(:requestor).permit(:name, :email, :phone_number, :biography)
  end
end
