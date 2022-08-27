class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|
      t.timestamps
      t.integer :cat_image                #猫の画像
      t.string :name, null: false         #猫の名前
      t.string :pattern, null: false      #猫の柄
      t.text :introduction, null: false   #猫の詳細
      t.string :age, null: false          #猫の年齢
      t.string :gender, null: false       #猫の性別
      t.string :exam, null: false         #病院での検査
      t.string :area, null: false         #譲渡地域
      t.integer :cost, null: false        #譲渡費用
      t.string :neuter, null: false       #去勢or避妊手術
      t.string :vaccination, null: false  #ワクチンの接種回数
      t.string :from, null: false         #保護猫or元飼い猫
      t.integer :customer_id, null: false #投稿ユーザーのIDを認識する
    end
  end
end
