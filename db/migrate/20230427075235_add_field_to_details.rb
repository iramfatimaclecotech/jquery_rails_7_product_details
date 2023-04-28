class AddFieldToDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :details, :product_id, :integer
  end
end
