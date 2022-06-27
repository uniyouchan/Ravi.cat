class AddAdminToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :admin, :boolean, default: false
  end
end
