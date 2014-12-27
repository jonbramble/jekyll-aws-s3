#require 'jekyll-aws-s3'
require 'thor'

module Jekylls3
  module CLI

  class Bucket < Thor

    desc "create", "create a bucket"
    #method_option :bucket_name, type: :string
    #only creates buckets named in _configuration file
    def create
      site = Jekylls3::Site.new
    end

    desc "configuration", "displays configuration information"
    def configuration
     site = Jekylls3::Site.new
     puts "  Bucket name:\t"+ site.bucket_name
     puts 
     puts "  Website Configuration"
     puts site.test.to_yaml
    end

  end

 class Site < Thor

   register Bucket, :bucket, "bucket", "Bucket Tasks"

   map "ls" => :list   

   desc "check", "check a site configuration"
   def check
     Jekylls3::Site.new
     # print some checking information
   end

   desc "upload", "upload a file or jekyll website to S3"
   method_option :file, type: :string
   # these options should be used to override the defaults
   method_option :site_directory, type: :string, :default => '_site'
   def upload
     site = Jekylls3::Site.new
     if options[:file]
       site.upload_file(options[:file])
     else
       site.upload_directory(options[:site_directory])
    end
   end

   desc "list", "lists uploaded files"
   def list
     site = Jekylls3::Site.new
     files_name = site.list_uploaded_files
     files_name.each do |file_name|
      puts file_name
    end
   end

 end

end

end
