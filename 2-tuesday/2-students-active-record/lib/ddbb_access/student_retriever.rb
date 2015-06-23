
require "./lib/model/student"

class StudentRetriever
  def all
    Student.all
  end

  def by_id(id)
    Student.find_by_id(id)
  end
end
