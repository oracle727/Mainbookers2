class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         attachment :profile_image
         has_many :book_comments, dependent: :destroy
         has_many :books, dependent: :destroy
         has_many :favorites, dependent: :destroy

         has_many :relationships, foreign_key: :follows_id
         has_many :follows, through: :relationships, source: :followers
         has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :followers_id, dependent: :destroy
         has_many :followers, through: :reverse_of_relationships, source: :follows, dependent: :destroy

         def is_followed_by?(user)
           reverse_of_relationships.find_by(follows_id: user.id).present?
         end

         def self.looks(search, word)
          if search == "perfect_match"
              @user = User.where("name LIKE?", "#{word}")
          elsif search == "forward_match"
              @user = User.where("name LIKE?", "%#{word}%")

          elsif search == "backward_match"
              @user = User.where("name LIKE?", "%#{word}%")

          elsif search == "partial_match"
              @user = User.where("name LIKE?", "%#{word}%")

          else
              @user = User.all
          end
         end

  validates :name, uniqueness: true, length: {minimum: 2, maximum: 20}
  validates :introduction,  length: {maximum: 50}
end