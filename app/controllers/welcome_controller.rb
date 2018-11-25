class WelcomeController < ApplicationController
  include ExchangeRateHelper
  def index
    #@currency = ExchangeRate.find_by(is_main_exchange: true)
    @currency = get_current_exchange_rate
  end

  def updated_index_with_ajx
    if request.xhr?
      @currency = get_current_exchange_rate
      render partial: "welcome/helpers/currency_content", layout: false
    else
      redirect_to "/"
    end
  end
end
