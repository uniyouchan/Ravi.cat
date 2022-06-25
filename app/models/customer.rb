class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cats, dependent: :destroy #猫の画像
  has_many :comments, dependent: :destroy #コメント
  has_many :favorites, dependent: :destroy #いいね機能

end
