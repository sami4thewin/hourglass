class Link < ApplicationRecord

  has_many :user_links
  has_many :users, through: :user_links
  validates :title, presence: true
  validates :description, presence: true
  validates :link, presence: true

  def self.top
    a = nil
    Link.all.each do |l|
      # binding.pry
      if a == nil
        a = l
      elsif l.user_links.count > a.user_links.count
        a = l
      end
    end
    a
  end


end
