module Creational
  module TemplateMethod
    
    class Report 

      attr_accessor :title, :text
      	
      def initialize(tile, text)
        @title = title
        @text = text
      end	

      # role > Template Method
      def output_report
        head
        body_start
        body
        body_end
      end

      # template methods to be overridden in the concrete template 
      def head; raise NotImplementedError end
      def body_start; raise NotImplementedError end
      def body; raise NotImplementedError end
      def body_end; raise NotImplementedError end
    end

    class HtmlReport < Report
      def head
        puts "<h1>#{@title}</h1>"
      end  

      def body_start
        puts "<hr/>"
      end

      def body
        puts "<p>#{@text}</p>"
      end

      def body_end
        puts "<footer>Report autogenerated</footer>"
      end
    end

    class PlainTextReport < Report
      def head
        puts "****** #{@title} ******"
      end  

      def body_start
        puts "-------------------"
      end

      def body
        puts @text
      end

      def body_end
        puts "-------------------\nReport autogenerated"
      end
    end
 
    # role > Client
    class Application
      def self.run
        title = 'My custom report'
        text  = 'lorem ipsum...' 

      	h_report = HtmlReport.new(title, text)
        h_report.output_report

        t_report = PlainTextReport.new(title, text)
        t_report.output_report
      end
    end
  end # TemplateMethod
end # Creational