class ListTask < ApplicationRecord

  belongs_to :list
  belongs_to :task

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
    self.all.each do |lt|
      if lt.expired?
        lt.destroy
      end
    end
  end

  def time_left
    t = self.expiration_date - Time.now
    mm, ss = t.divmod(60)
    hh, mm = mm.divmod(60)
    dd, hh = hh.divmod(24)
    "So you have %d days, %d hours, %d minutes, and %d seconds left to finish this task." % [dd, hh, mm, ss]
  end


end
