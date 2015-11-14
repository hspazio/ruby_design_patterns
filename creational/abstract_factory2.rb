module Creational
  module AbstractFactory
  
  	# Role > Abstract Factory
    class SubmissionFactory
      def create_submission
      	# main logic
      end
    end

    # role > Concrete Factory
    class StandardSubmissionFactory < SubmissionFactory
      def create_submission
      	StandardSubmission.new
      end

      def fields_map
      end
    end

    # role > Concrete Factory
    class IsvSubmissionFactory < SubmissionFactory
      def create_submission
      	IsvSubmission.new
      end

      def fields_map
      end
    end	

    # role > Abstract Product
    class Submission
    end

    # role > Concrete Product
    class StandardSubmission < Submission
    end

    # role > Concrete Product
    class IsvSubmission < Submission
    end

    # role > Client
    class Application
      def run
      	submission_factory = case subject
						     when '1' then StandardSubmissionFactory
						     when '2' then IsvSubmissionFactory
						     end
      
        submission_factory.create_submission
      end
    end
  end
end