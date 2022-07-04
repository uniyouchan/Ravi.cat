class Cat < ApplicationRecord
 belongs_to :customer
 has_one_attached :cat_image #画像
 has_many :comments, dependent: :destroy #コメント機能
 has_many :favorites, dependent: :destroy #いいね機能
 has_many :cat_tags, dependent: :destroy

 validates :name, presence: true
 validates :pattern, presence: true
 validates :introduction, presence: true
 validates :age, presence: true
 validates :gender, presence: true
 validates :exam, presence: true
 validates :area, presence: true
 validates :cost, presence: true
 validates :neuter, presence: true
 validates :vaccination, presence: true
 validates :from, presence: true


 def get_cat_image
  unless cat_image.attached?
   file_path = Rails.root.join('app/assets/images/no_image.jpg')
   cat_image.attach(io:File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
   cat_image.variant(resize_to_limit: [100,100]).processed
 end

 def self.looks(search, word)
  if search == "perfect_match"
   @cat = Cat.where("name LIKE?","#{word}")
  elsif search == "partial_match"
   @cat = Cat.where("name LIKE?","%#{word}%")
  else
   @cat = Cat.all
  end
 end

 def favorited_by?(customer)
  favorites.exists?(customer_id: customer.id)
 end



end