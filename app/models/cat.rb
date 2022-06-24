class Cat < ApplicationRecord
 has_one_attached :cat_image
 belongs_to :customer
 has_many :comments, dependent: :destroy

 def get_cat_image
  unless cat_image.attached?
   file_path = Rails.root.join('app/assets/images/no_image.jpg')
   cat_image.attach(io:File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
   cat_image.variant(resize_to_limit: [100,100]).processed
 end

end