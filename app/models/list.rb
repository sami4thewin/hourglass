class List < ApplicationRecord

  belongs_to :user
  has_many :list_tasks
  has_many :tasks, through: :list_tasks
  validates :title, presence: true

  def tasks_attributes=(attr)
    # binding.pry
    if !attr[:list][:tasks_attributes]["0"].nil?
      t = Task.find_or_create_by(description: attr[:list][:tasks_attributes]["0"][:description])
      lt = ListTask.create(list_id: self.id, task_id: t.id, expiration: attr[:list][:list_task][:expiration])
    end
    if !attr[:list][:tasks_attributes]["1"].nil?
      z = Task.find_or_create_by(description: attr[:list][:tasks_attributes]["1"][:description])
      lz = ListTask.create(list_id: self.id, task_id: z.id, expiration: attr[:list][:list_task][:expiration])
    end
    if !attr[:list][:tasks_attributes]["2"].nil?
      y = Task.find_or_create_by(description: attr[:list][:tasks_attributes]["2"][:description])
      ly = ListTask.create(list_id: self.id, task_id: y.id, expiration: attr[:list][:list_task][:expiration])
    end
    # self.tasks.build(attr)
  end

  # def list_tasks_attributes=(attr)
  #   binding.pry
  #   # self.list_tasks[-1].expiration = attr[:expiration]
  # end





end
