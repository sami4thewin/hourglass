class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  has_many :lists
  has_many :tasks, through: :lists

  has_many :user_links
  has_many :links, through: :user_links

  has_many :user_videos
  has_many :videos, through: :user_videos

  def self.top
    # self.maximum(:completed)
    self.group(:completed).limit(3)
  end


end
