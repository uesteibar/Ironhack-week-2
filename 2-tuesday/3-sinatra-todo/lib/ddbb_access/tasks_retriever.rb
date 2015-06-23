
class TasksRetriever
  def by_id(id)
    Task.find_by_id(id)
  end

  def all
    Task.all
  end
end
