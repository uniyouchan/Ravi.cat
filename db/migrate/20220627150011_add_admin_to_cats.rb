class AddAdminToCats < ActiveRecord::Migration[6.1]
  def change
    add_column :cats, :admin, :boolean, default: false
  end
end
