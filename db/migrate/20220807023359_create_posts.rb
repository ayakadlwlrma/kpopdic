class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :member
      t.date :age
      t.string :team
      t.text :origin
      t.string :movie
      t.string :genre

      t.timestamps
    end
  end
end
