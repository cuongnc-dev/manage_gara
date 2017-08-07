class LocalesController < ApplicationController
  before_action :load_locale, only: [:edit, :update, :destroy]

  def index
    @locales = Locale.all.order_by_name
  end

  def new
    @locale = Locale.new
  end

  def create
    locale = Locale.new locale_params
    if locale.save
      flash[:success] = t "create_success"
      redirect_to locales_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @locale.update_attributes locale_params
      flash[:success] = t "update_success"
      redirect_to locales_path
    else
      render :edit
    end
  end

  def destroy
    if @locale.destroy
      flash[:success] = t "delete_success"
    else
      flash[:danger] = t "delete_fail"
    end
    redirect_to locales_path
  end

  private

  def locale_params
    params.require(:locale).permit :name
  end

  def load_locale
    @locale = Locale.find_by id: params[:id]
    return if @locale
    flash[:danger] = t "locales.not_found"
    redirect_to locales_path
  end
end
