# role > Command
class Command
  attr_reader :description

  def initialize(description)
  	@description = description
  end

  def execute
  	raise NotImplementedError
  end
end

# role > Concrete Command
class CreateFile < Command
  def initialize(path, content)
  	super("Create file: #{path}")
  	@path = path
  	@content = content
  end

  def execute
    File.open(@path, 'w'){ |f| f.write(@content) }
  end

  def unexecute
  	File.delete(@path)
  end
end

# role > Concrete Command
class DeleteFile < Command
  def initialize(path)
  	super("Delete file: #{path}")
  	@path = path
  end

  def execute
  	if File.exists?(@path)
  	  @content = File.open(@path)
  	end
  	  
  	f = File.delete(@path)
  end

  def unexecute
  	if @content
  	  File.open(@path,'w'){ |f| f.write(@content) }
  	end
  end
end

# role > Composite Command
class CompositeCommand < Command
  def initialize
    @commands = []
  end	

  def add_command(cmd)
  	@commands << cmd
  end

  def execute
  	@commands.each{ |cmd| cmd.execute }
  end

  def unexecute
  	@commands.reverse.each{ |cmd| cmd.unexecute }
  end

  def description
  	description = ''
  	@commands.each{ |cmd| description += cmd.description + "\n" }
  	description
  end
end

# Creating a installer to queue up the commands 
installer = CompositeCommand.new
installer.add_command CreateFile.new('file1.txt', 'Content file 1')
installer.add_command CreateFile.new('file2.txt', 'Content file 2')
installer.add_command CreateFile.new('file3.txt', 'Content file 3')


puts installer.description
puts 'Installing...'
installer.execute

puts 'Uninstalling...'
installer.unexecute