class ExchangeRate < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  attr_accessor :time_to

  belongs_to :currency_from, :class_name => 'CurrenciesRelation'
  belongs_to :currency_to, :class_name => 'CurrenciesRelation'

  validates :rate, presence: true, numericality: {greater_than_or_equal_to: 0.00}

  before_save :update_time_to
  after_find :change_rate_value
  after_commit :check_if_main_value_need_update

  private

  def update_time_to
    if !date_to.nil? && !time_to.nil?
      time_array = time_to.split(":")
      hours = time_array.shift
      minutes = time_array.shift
      new_date = date_to.change(hour: hours, min: minutes)
      self.date_to = new_date
    else
      self.updated_at = Time.current
    end
  end

  def check_if_main_value_need_update
    ActionCable.server.broadcast(
      "currencies",
      update_value: true
    )
  end

  def change_rate_value
    self.rate = number_to_currency(rate, unit: "")
  end

end
