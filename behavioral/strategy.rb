# role > Strategy (interface) - Not necessary as per duck typing
class Formatter
  
  def output_report(title, text)
    raise NotImplementedError
  end
end

# role > concrete Strategy
class HTMLFormatter < Formatter
  
  def output_report(title, text)
    puts "<html>"
    puts "  <head>"
    puts "    <title>#{title}</title>"
    puts "  </head>"
    puts "  <body>"
    
    text.split("\n").each do |line|
      puts "    <p>#{line}</p>"
    end
    
    puts "  </body>"
    puts "</html>"
  end
end

# role > concrete Strategy
class PlainTextFormatter < Formatter
  
  def output_report(title, text)
  	puts "======== #{title} ========"
  	text.split("\n").each do |line|
      puts line
  	end
  end
end

# role > Context
class Report
  attr_reader   :title, :text
  attr_accessor :formatter

  def initialize(options, formatter)
    @title = options[:title] || "No title"
    @text  = options[:text]  || "Empty report"
    @formatter = formatter
  end	

  def output_report
    @formatter.output_report(@title, @text)
  end	
end


# main
report_text = <<EOS
This is just a dummy report.
There is actually nothing to report! :/

Bye!
EOS

report = Report.new({ title: "FP report", text: report_text }, HTMLFormatter.new)
report.output_report

puts "Let's change the formatter..."
report.formatter = PlainTextFormatter.new
report.output_report