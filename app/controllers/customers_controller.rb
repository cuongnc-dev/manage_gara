class CustomersController < ApplicationController
  before_action :load_customer, only: [:edit, :update, :destroy]
  before_action :load_locales, only: [:new, :edit]

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    customer = Customer.new customer_params
    if customer.save
      flash[:success] = t "create_success"
      redirect_to customers_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @customer.update_attributes customer_params
      flash[:success] = t "update_success"
      redirect_to customers_path
    else
      render :edit
    end
  end

  def destroy
    if @customer.destroy
      flash[:success] = t "delete_success"
    else
      flash[:danger] = t "delete_fail"
    end
    redirect_to customers_path
  end

  private

  def customer_params
    params.require(:customer).permit :name, :phone, :address, :locale_id
  end

  def load_customer
    @customer = Customer.find_by id: params[:id]
    return if @customer
    flash[:danger] = t "customers.not_found"
    redirect_to customers_path
  end

  def load_locales
    @locales = Locale.all
  end
end
