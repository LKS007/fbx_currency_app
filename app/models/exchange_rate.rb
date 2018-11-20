class ExchangeRate < ApplicationRecord
  belongs_to :currency_from, :class_name => 'CurrenciesRelation'
  belongs_to :currency_to, :class_name => 'CurrenciesRelation'

  validates :rate, presence: true, numericality: {greater_than_or_equal_to: 0.00}

end
