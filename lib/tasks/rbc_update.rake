desc 'update usd info'
task update_value_info: :environment do
  include ExchangeRateHelper
  data = URI.parse('https://cash.rbc.ru/cash/json/converter_currency_rate/?currency_from=USD&currency_to=RUR&source=cbrf&sum=1').read
  response = JSON.parse data
  update_exchange_helper_method(response)
end
