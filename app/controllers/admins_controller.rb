class AdminsController < ApplicationController
  
  before_action :require_user, only: [:index, :show]

  def index
    @rate = ExchangeRate.find_by(is_forcing: false)
  end

  
end
