class RequestorsController < ApplicationController
  def index
    @requestors = Requestor.all
  end

  def show
    @requestor = Requestor.find(params[:id])
  end

  def new
    @requestor = Requestor.new
  end

  def create
    @requestor = Requestor.find_or_initialize_by(email: params[:requestor][:email])
    @requestor.assign_attributes(requestor_params)

    if @requestor.save
      redirect_to @requestor
    else
      render :new
    end
  end

  def edit
    @requestor = Requestor.find(params[:id])
  end

  def update
    @requestor = Requestor.find(params[:id])

    if @requestor.update(requestor_params)
      redirect_to @requestor
    else
      render :edit
    end
  end

  def destroy
    @requestor = Requestor.find(params[:id])
    @requestor.destroy

    redirect_to root_path
  end

  private
  def requestor_params
    params.require(:requestor).permit(:name, :email, :phone_number, :biography)
  end
end
