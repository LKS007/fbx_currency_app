class CurrenciesRelation < ApplicationRecord
  has_one :from_exchanges, :class_name => 'ExchangeRate', :foreign_key => 'currency_from_id'
  has_one :to_exchanges, :class_name => 'ExchangeRate', :foreign_key => 'currency_to_id'  
end
