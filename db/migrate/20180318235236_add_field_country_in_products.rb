class AddFieldCountryInProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :country, :string
  end
end
