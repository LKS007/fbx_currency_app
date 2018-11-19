class ExchangeRate < ApplicationRecord
  belongs_to :currency_from, :class_name => 'CurrenciesRelation'
  belongs_to :currency_to, :class_name => 'CurrenciesRelation' 
end
