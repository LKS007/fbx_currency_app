class CreateCurrenciesRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies_relations do |t|
      t.string :currency_code, null: false
      t.string :currency_name
    end
  end
end
