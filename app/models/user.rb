class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :vocabularies, :dependent => :delete_all
  has_many :articles,     :dependent => :delete_all
  has_many :article_comments
  has_many :followings, foreign_key: :following_user_id, class_name: "Follow"
  has_many :followers, foreign_key: :follower_user_id, class_name: "Follow"
  has_many :dailies, class_name: "Daily"
  mount_uploader :profile_picture, ImageUploader
end
