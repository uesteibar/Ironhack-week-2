require "pry"
class TasksRetriever
  def by_id(id)
    Task.find_by_id(id)
  end

  def all
    order_by_urgent(Task.all)
  end

  def by_user(user_id)
    order_by_urgent(User.find(user_id).tasks)
  end

  def order_by_urgent(tasks)
    regular_tasks = []
    urgent_tasks = []
    tasks.each do |task|
      if task.name.downcase.include?("urgent")
        urgent_tasks << task
      else
        regular_tasks << task
      end
    end
    urgent_tasks.concat(regular_tasks)
  end
end
