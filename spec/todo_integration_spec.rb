require 'todo'
require 'todo_list'

describe "integrated task " do
 context "add method do"
   it "adds task to the list" do
     content = "feed rats"
     todo = Todo.new(content)
     todo_list = TodoList.new
     todo_list.add(todo)
     expect(todo_list.incomplete).to eq content
   end
  end

  context "incomplete" do
   it "incomplete method, returns incompleted tasks" do
    content1 = "clean kitchen"
    content2 = "dust computer"
    todo = Todo.new(content1)
    todo_list = TodoList.new
    todo_list.add(todo)
    todo2 = Todo.new(content2)
    todo2.mark_done!
    todo_list.add(todo2)
    expect(todo_list.incomplete).to eq content1
    end
  end

  context "complete" do
    it "complete method " do
      content = "tidy room"
      todo = Todo.new(content)
      todo_list = TodoList.new
      todo.mark_done!
      todo_list.add(todo)
      expect(todo_list.complete).to eq content
    end
  end

  context "give_up! method " do
    it "tests method " do
      content = "make dinner"
      todo = Todo.new(content)
      todo_list = TodoList.new
      todo_list.add(todo)
      todo_list.give_up!
      expect(todo.done?) == true
    end
  end