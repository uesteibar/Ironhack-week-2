
class TasksRetriever
  def get_by_user(user_id)
    Task.search_by_user_id(user_id)
  end

  def all
    Task.all
  end
end
