class Video < ApplicationRecord

  has_many :user_videos
  has_many :users, through: :user_videos
  validates :description, presence: true
  validates :link, presence: true

  def self.top
    a = nil
    Video.all.each do |l|
      # binding.pry
      if a == nil
        a = l
      elsif l.user_videos.count > a.user_videos.count
        a = l
      end
    end
    a
  end


end
