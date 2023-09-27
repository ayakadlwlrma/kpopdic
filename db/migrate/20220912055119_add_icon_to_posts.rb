class AddIconToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :icon, :string
    
  end
end
