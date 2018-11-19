class AddExchangeRateTable < ActiveRecord::Migration[5.2]
  def change
    create_table :exchange_rates do |t|
      t.references :currency_from
      t.references :currency_to
      t.boolean :is_forcing, default: false
      t.decimal :rate, precision: 8, scale: 2
      t.boolean :is_main_exchange, default: false
      t.datetime :date_to, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
