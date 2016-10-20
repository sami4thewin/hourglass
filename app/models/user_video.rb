class UserVideo < ApplicationRecord

  belongs_to :user
  belongs_to :video

  validates :expiration, :inclusion => {:in => [1,2,3], :message => "Select between 1-3"}

  def expiration_date
    case self.expiration
    when 1
      self.created_at + 1.week
    when 2
      self.created_at + 2.weeks
    when 3
      self.created_at + 3.weeks
    end
    # self.created_at - 5.weeks
  end

  def expired?
    Time.now > self.expiration_date
  end

  def self.destroy_expired
    self.all.each do |ul|
      if ul.expired?
        ul.destroy
      end
    end
  end

end
