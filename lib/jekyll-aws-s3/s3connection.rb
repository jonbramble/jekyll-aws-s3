require 'aws-sdk'

module Jekylls3
	##
	# Wrapper around S3 connection
	#
	#
  class S3Connection

   attr_reader :S3

   def initialize(config)
     aws_conf = { access_key_id: config["access_key_id"], 
                  secret_access_key: config["secret_access_key"],
                  region: config["region"] }
     begin
      @S3 = AWS::S3.new(aws_conf)
    rescue Exception => e
      raise e
    end
   end

  end
end