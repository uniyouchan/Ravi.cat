class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.integer :customer_id
      t.text :cat_comment
      t.integer :cat_id
      t.timestamps
    end
  end
end
