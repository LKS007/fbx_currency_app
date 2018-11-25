class AdminsController < ApplicationController
  
  before_action :require_user, only: [:index]

  def index
    @rate = ExchangeRate.find_by(is_forcing: false)
    @currency_history = ExchangeRate.where(is_forcing: true).order("id DESC")
    @currency = ExchangeRate.where(["is_forcing = ? and date_to > ?", true, DateTime.now]).order("id DESC").first
    #@currency = ExchangeRate.find_by(is_forcing: true)
    @currency ||= ExchangeRate.new
  end

  def create
    @currency = ExchangeRate.new(exchange_param)
    @currency_history = ExchangeRate.where(is_forcing: true).order("id DESC")
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
