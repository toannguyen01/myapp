class RemoveFieldShortDescriptionInProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :short_description
  end
end
