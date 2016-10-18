class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lists
  has_many :tasks, through: :lists

  has_many :user_links
  has_many :links, through: :user_links

  has_many :user_videos
  has_many :videos, through: :user_videos


end
