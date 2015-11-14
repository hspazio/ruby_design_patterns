class Task
  attr_accessor :name, :parent, :time

  def initialize(name)
    @name = name
    @parent = nil
    @time = 0.0
  end
end

class CompositeTask < Task	
  def initialize(name)
    super(name)
    @sub_tasks = []
  end	

  def add_sub_task(task)
    @sub_tasks << task
    task.parent = self
  end	

  def remove_sub_task(task)
    @sub_tasks.delete(task)
    task.parent = nil
  end

  def sub_tasks
  	@sub_tasks
  end

  def time
    time = 0.0
    @sub_tasks.each{ |task| time += task.time }
    time
  end	
end

t1 = Task.new('clean bedroom')
t1.time = 5.0

t2 = Task.new('clean toilet')
t2.time = 6.5

t3 = Task.new('clean kitchen')
t3.time = 4.5

c1 = CompositeTask.new('clean inside house')
c1.add_sub_task(t1)
c1.add_sub_task(t2)
c1.add_sub_task(t3)

t4 = Task.new('trim garden')
t4.time = 10

t5 = Task.new('clean carpark')
t5.time = 4.5

c2 = CompositeTask.new('clean outside house')
c2.add_sub_task(t4)
c2.add_sub_task(t5)

c3 = CompositeTask.new('clean house')
c3.add_sub_task(c1)
c3.add_sub_task(c2)

puts "To clean the house we need #{c3.time} minutes"
puts "Tasks required: #{c3.sub_tasks.collect{ |t| t.name }.join(', ')}"