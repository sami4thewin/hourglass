class List < ApplicationRecord

  belongs_to :user
  has_many :list_tasks
  has_many :tasks, through: :list_tasks

end
