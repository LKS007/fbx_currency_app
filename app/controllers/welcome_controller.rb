class WelcomeController < ApplicationController
  def index
    @currency = ExchangeRate.find_by(is_main_exchange: true)
  end
end
