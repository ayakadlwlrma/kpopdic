class AddGenToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :gen, :string
  end
end
