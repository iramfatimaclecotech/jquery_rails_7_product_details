class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :writer
      t.datetime :publish_year


      t.timestamps
    end
  end
end
