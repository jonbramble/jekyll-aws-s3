module Jekylls3

  # the site is configured through the _config.yml file. 
  # the site only has one bucket

  class Site

    def initialize
      @config = site_configuration  #load configuration
      @bucket = Jekylls3::Bucket.new(@config) #create a local bucket object
    end

    def bucket_name
      @bucket.bucket_name
    end

    def upload_directory(dir_name)
      directory = @config["destination"]
      @bucket.upload_directory(directory)
    end

    # convenient method for odd files
    def upload_file(file_name)
      #@bucket.upload_file
    end

    def list_uploaded_files
      @bucket.list_uploaded_files
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
