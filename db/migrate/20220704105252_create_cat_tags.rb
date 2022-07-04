class CreateCatTags < ActiveRecord::Migration[6.1]
  def change
    create_table :cat_tags do |t|
      t.string :name
      t.integer :cat_id

      t.timestamps
    end
  end
end
