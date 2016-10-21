class ListTask < ApplicationRecord

  belongs_to :list
  belongs_to :task

  validates :expiration, :inclusion => {:in => [1,2,3], :message => "Select between 1-3"}

end
