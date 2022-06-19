class Cat < ApplicationRecord
 has_one_attached :image
 belongs_to :customer

 def get_image
  unless image.attached?
   file_path = Rails.root.join('app/assets/images/no_image.jpg')
   cat_image.attach(io:File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
   image
 end

end