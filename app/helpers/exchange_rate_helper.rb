module ExchangeRateHelper
  def update_exchange_helper_method(response)
    if response['status'] == 200
      usd_val = CurrenciesRelation.find_by(currency_code: 'USD')
      rub_val = CurrenciesRelation.find_by(currency_code: 'RUR')

      ex_rate = ExchangeRate.find_by(is_forcing: false, currency_from_id: usd_val.id,
                                     currency_to_id: rub_val.id)
      
      unless response['data']['sum_result'].nil?
        ex_rate.rate = response['data']['sum_result']
        ex_rate.save
      end

    end
  end

  def get_current_exchange_rate
    @currency = ExchangeRate.where(["is_forcing = ? and date_to > ?", true, DateTime.current]).order("id DESC").first
    @currency ||= ExchangeRate.find_by(is_forcing: false)
  end
end
