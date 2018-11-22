class AdminsController < ApplicationController
  
  before_action :require_user, only: [:index, :show]

  def index
    @rate = ExchangeRate.find_by(is_forcing: false)
    @currency = ExchangeRate.find_by(is_forcing: true)
    @currency ||= ExchangeRate.new
  end

  def create
    @currency = ExchangeRate.new(exchange_param)
    if @currency.valid?
      @currency.save
      redirect_to "/admin"
    else
      render "index"
    end
  end

  def update
    @currency = ExchangeRate.find(params[:exchange_rate][:id])
    if @currency.update_attributes(exchange_param)
      p "Nice"
      redirect_to "/admin"
    else
      render "index"
    end
  end

  private

  def exchange_param
    params.require(:exchange_rate).permit!
  end

  
end
