class List < ApplicationRecord

  belongs_to :user
  has_many :list_tasks
  has_many :tasks, through: :list_tasks
  validates :title, presence: true

  def tasks_attributes=(attr)
    # binding.pry
    attr[:list][:tasks_attributes].each do |k, v|
      if !v.values.nil? && v.values != ""
        t = Task.find_or_create_by(description: v.values[0])
        z = ListTask.create(list_id: self.id, task_id: t.id, expiration: attr[:list][:list_task][:expiration].to_i)
      end
    end
    # attr
    # if !attr[:list][:tasks_attributes]["0"].nil?
    #   t = Task.find_or_create_by(description: attr[:list][:tasks_attributes]["0"][:description])
    #   lt = ListTask.create(list_id: self.id, task_id: t.id, expiration: attr[:list][:list_task][:expiration].to_i)
    # end
    # if !attr[:list][:tasks_attributes]["1"].nil?
    #   z = Task.find_or_create_by(description: attr[:list][:tasks_attributes]["1"][:description])
    #   lz = ListTask.create(list_id: self.id, task_id: z.id, expiration: attr[:list][:list_task][:expiration].to_i)
    # end
    # if !attr[:list][:tasks_attributes]["2"].nil?
    #   y = Task.find_or_create_by(description: attr[:list][:tasks_attributes]["2"][:description])
    #   ly = ListTask.create(list_id: self.id, task_id: y.id, expiration: attr[:list][:list_task][:expiration].to_i)
    # end
    # self.tasks.build(attr)
  end

  # def list_tasks_attributes=(attr)
  #   binding.pry
  #   # self.list_tasks[-1].expiration = attr[:expiration]
  # end
end


  # def tasks_attributes=(attr)
  #
  # end




# class List < ApplicationRecord
#
#   belongs_to :user
#   has_many :list_tasks
#   has_many :tasks, through: :list_tasks
#   validates :title, presence: true
#
#   def tasks_attributes=(attributes)
#     binding.pry
#     # build_task_and_list_task(attr[:list][:tasks_attributes]["0"]) if
#     # build_task_and_list_task(attr[:list][:tasks_attributes]["1"])
#     # build_task_and_list_task(attr[:list][:tasks_attributes]["2"])
#
#     # attributes.each do |attr|
#     #   build_task_and_list_task(attr) if !attr.nil?
#     # end
#     if !attr[:list][:tasks_attributes]["0"].nil?
#       t = Task.find_or_create_by(description: attr[:list][:tasks_attributes]["0"][:description])
#       lt = ListTask.create(list_id: self.id, task_id: t.id, expiration: attr[:list][:list_task][:expiration].to_i)
#     end
#     if !attr[:list][:tasks_attributes]["1"].nil?
#       z = Task.find_or_create_by(description: attr[:list][:tasks_attributes]["1"][:description])
#       lz = ListTask.create(list_id: self.id, task_id: z.id, expiration: attr[:list][:list_task][:expiration].to_i)
#     end
#     if !attr[:list][:tasks_attributes]["2"].nil?
#       y = Task.find_or_create_by(description: attr[:list][:tasks_attributes]["2"][:description])
#       ly = ListTask.create(list_id: self.id, task_id: y.id, expiration: attr[:list][:list_task][:expiration].to_i)
#     end
#     # self.tasks.build(attr)
#
#     # def build_task_and_list_task(attr)
#     #   y = Task.find_or_create_by(description: attr[:list][:tasks_attributes][:description])
#     #   ly = ListTask.create(list_id: self.id, task_id: y.id, expiration: attr[:list][:list_task][:expiration].to_i)
#     # end
#   end
#
#   # def list_tasks_attributes=(attr)
#   #   binding.pry
#   #   # self.list_tasks[-1].expiration = attr[:expiration]
#   # end
#
# end
