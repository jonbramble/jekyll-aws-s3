module Jekylls3

  # the site is configured through the _config.yml file. 
  # the site has a bucket and an asset bucket which could be the same

  class Site

    def initialize
      @config = site_configuration  #load configuration
      bucket_name = @config["bucket_name"]
      asset_bucket_name = @config["asset_bucket_name"]
      @bucket = Jekylls3::Bucket.new(bucket_name, @config) #create a local bucket object
      @asset_bucket = Jekylls3::Bucket.new(asset_bucket_name, @config)
    end

    def bucket_name
      @bucket.bucket_name
    end

    def asset_bucket_name
      @asset_bucket.bucket_name
    end

    def upload_directory(override_directory)
      dir = override_directory
      dir ||= @config["destination"]
      #must exclude the asset directory here if using two buckets
      @bucket.upload_directory(directory)
    end

    def upload_asset_directory(override_directory)
      dir = override_directory
      dir ||= @config["destination"]
      asset_directory = File.join(dir,"assets")
      @asset_bucket.upload_directory(asset_directory)
    end

    def list_uploaded_files
      @bucket.list_uploaded_files
    end

    def list_uploaded_asset_files
      @asset_bucket.list_uploaded_files
    end

    def test
      @bucket.website_config.options
    end

private

    def site_configuration
      # Use jekyll code to load configuration file
      conf = Jekyll.configuration({})
      return conf
      # check that the configuration contains the extra information for the upload
    end

  end
end
