# rubygems
require 'rubygems'

#std libs
require 'digest'
require 'base64'

# internal
require "jekyll-aws-s3/version"

require "jekyll-aws-s3/s3connection"
require "jekyll-aws-s3/site"
require "jekyll-aws-s3/bucket"

require "jekyll"

module Jekylls3
  class << self

  end

  class BucketError < StandardError 
    
  end

end


# patch this to supress the output from Jekyll, is there a better way?
# kernel supress warnings?
module Jekyll
  def self.logger
    @logger ||= Stevenson.new(2)
  end
end



