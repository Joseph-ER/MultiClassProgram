class TodoList
  def initialize
    @list = []
  end

  def add(todo) # todo is an instance of Todo
    @list.push(todo)
  end

  def incomplete
    @list.each do |task|
      if task.done? == false
        return task.task
      end
    end
  end

  def complete
    @list.each do |task|
      if task.done? == true
        return task.task
      end
    end
  end

  def give_up!
    # Marks all todos as complete
    @list.each do |task| 
      task.mark_done! 
    end
  end
end
