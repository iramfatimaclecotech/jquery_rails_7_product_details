class CreateDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :details do |t|
      t.string :description
      t.string :size
      t.string :color

      t.timestamps
    end
  end
end
