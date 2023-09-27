class AddMemberimgToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :memberimg, :string
  end
end
