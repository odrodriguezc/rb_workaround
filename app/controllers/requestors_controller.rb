class RequestorsController < ApplicationController
  include ConstModule

  def new
    @requestor = Requestor.new
  end

  def create
    # Find requestor by email - if not exist create with request params
    @requestor = Requestor.find_or_initialize_by(email: params[:requestor][:email])
    @requestor.assign_attributes(requestor_params)

    if @requestor.save
      flash[:notice] = REGISTRATION_SUCCESS_MESSAGE
      redirect_to root_path
    else
      flash[:error] = GENERAL_FAIL_MESSAGE
      render :new
    end
  end

  private
  def requestor_params
    params.require(:requestor).permit(:name, :email, :phone_number, :biography)
  end
end
