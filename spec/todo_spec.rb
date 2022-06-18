require 'todo'

describe "todo" do
  it "returns todo text" do
    content = "feed rats"
    todo = Todo.new(content)
    todo.task
    expect(todo.task).to eq content
  end

  it "mark_done! " do
    content = "make cake"
    todo = Todo.new(content)
    todo.mark_done!
    expect(todo.done?).to eq true
  end

  it "empty done? " do
    content = "make cake"
    todo = Todo.new(content)
    expect(todo.done?).to eq false
  end
end