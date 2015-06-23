
class TasksRetriever
  def by_id(id)
    Task.find_by_id(id)
  end

  def all
    tasks = []
    urgent_tasks = []
    Task.all.each do |task|
      if task.name.downcase.include?("urgent")
        urgent_tasks << task
      else
        tasks << task
      end
    end
    urgent_tasks.concat(tasks)
  end
end
