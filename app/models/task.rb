class Task < ApplicationRecord

  has_many :list_tasks
  has_many :lists, through: :list_tasks

end
