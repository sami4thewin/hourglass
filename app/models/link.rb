class Link < ApplicationRecord

  has_many :user_links
  has_many :users, through: :user_links


end
