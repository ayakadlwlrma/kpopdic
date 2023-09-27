class ChangeDatatypeDateOfPosts < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :age, :date
  end
end
