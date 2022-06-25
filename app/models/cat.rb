class Cat < ApplicationRecord
 belongs_to :customer
 has_one_attached :cat_image #画像
 has_many :comments, dependent: :destroy #コメント機能
 has_many :favorites, dependent: :destroy #いいね機能


 def get_cat_image
  unless cat_image.attached?
   file_path = Rails.root.join('app/assets/images/no_image.jpg')
   cat_image.attach(io:File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
   cat_image.variant(resize_to_limit: [100,100]).processed
 end

 def favorited_by?(customer)
  favorites.exists?(customer_id: customer.id)
 end



end