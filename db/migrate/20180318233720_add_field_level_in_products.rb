class AddFieldLevelInProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :level, :string
  end
end
