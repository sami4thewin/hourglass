class List < ApplicationRecord

  belongs_to :user
  has_many :list_tasks
  has_many :tasks, through: :list_tasks

  def tasks_attributes=(attr)
    binding.pry
    # self.tasks.build(attr)
  end

  def list_tasks_attributes=(attr)
    binding.pry
    # self.list_tasks[-1].expiration = attr[:expiration]
  end





end
