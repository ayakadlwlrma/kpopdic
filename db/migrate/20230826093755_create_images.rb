class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.references :post, null: false, foreign_key: true
      t.string :photo

      t.timestamps
    end
  end
end
