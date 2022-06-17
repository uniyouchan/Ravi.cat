class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|
      t.timestamps
      t.integer :cat_image   #猫の画像
      t.string :name         #猫の名前
      t.string :pattern      #猫の柄
      t.text :introduction   #猫の詳細
      t.integer :age         #猫の年齢
      t.string :gender       #猫の性別
      t.string :exam         #病院での検査
      t.string :area         #譲渡地域
      t.integer :cost        #譲渡費用
      t.string :neuter       #去勢or避妊手術
      t.string :vaccination  #ワクチンの接種回数
      t.string :from         #保護猫or元飼い猫
      t.boolean :is_active   #受付中、交渉中、譲渡済みの表記
    end
  end
end
