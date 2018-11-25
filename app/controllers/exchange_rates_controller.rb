require "open-uri"

class ExchangeRatesController < ApplicationController
  include ExchangeRateHelper

  before_action :require_user, only: [:destroy]

  def update
    data = URI.parse('https://cash.rbc.ru/cash/json/converter_currency_rate/?currency_from=USD&currency_to=RUR&source=cbrf&sum=1').read
    response = JSON.parse data

    update_exchange_helper_method(response)
    redirect_to '/admin'
  end

  def destroy
    ex_rate = ExchangeRate.find(params[:id])
    ex_rate.destroy
    redirect_to '/admin', notice: "You rate has been deleted"
  end
end
