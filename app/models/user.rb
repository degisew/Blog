class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: 'author_id'
  has_many :likes
  has_many :comments
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  # Roles = [:admin, :default]

  def is?(requested_role)
    role == requested_role.to_s
  end
end
