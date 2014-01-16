require "spec_helper"


describe Jekylls3::Site do
  it "should be true" do
    #MyModel.new.the_truth.should be_true
  end
end

#$LOAD_PATH << File.expand_path( File.dirname(__FILE__) + '/../lib' )
#require 'jekylls3'
#require 'jekylls3/cli'


#test_file = File.expand_path( File.dirname(__FILE__) + '/testsite/_config.yml' )
#args = ['load', '--config_file=/test/testsite/_config.yml']
#args = ['load']
#opts = Jekylls3::CLI.start(args)
#puts opts

#config = YAML::load_file(File.join(__dir__, 'config.yml'))
#site = Jekylls3::S3Site.new(config)

#site.upload_directory("directory")
#site.upload_file("file")

# con = Jekylls3::S3Connection.new(config["s3_keys"])
# p con.bucket_exists?("jekyll-s3-proto")
# con.list_buckets
# bucket_name = "jekyll-s3-proto"
# con.list_files(bucket_name)




