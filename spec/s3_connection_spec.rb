require "spec_helper"


describe Jekylls3::S3Connection do
  it "should be true" do
    con = Jekylls3::S3Connection.new(s3_test_config["s3_keys"])
    con.should be_an_instance_of(Jekylls3::S3Connection)
    con.s3.should be_an_instance_of(AWS::S3)
  end

  it "should be false" do
    con = Jekylls3::S3Connection.new(s3_test_config_no_keys["s3_keys"])
    con.should be_an_instance_of(Jekylls3::S3Connection)
    con.s3.should be_an_instance_of(AWS::S3)
  end

  it "list buckets" do
    con = Jekylls3::S3Connection.new(s3_test_config["s3_keys"])
    con.should be_an_instance_of(Jekylls3::S3Connection)
    puts con.list_buckets.inspect
    #con.list_buckets.should be_kind_of(Array)
    #con.list_buckets.should include("jekyll-s3-proto")
  end

  #it "list buckets" do
  #  con = Jekylls3::S3Connection.new(s3_test_config["s3_keys"])
  #  con.should be_an_instance_of(Jekylls3::S3Connection)
  #  con.list_buckets.should include("jekyll-s3-proto")
  #end
end