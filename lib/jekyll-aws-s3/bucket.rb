module Jekylls3  

  class Bucket

    attr_accessor :bucket_name

    def initialize(config)
      @bucket_name = config["bucket_name"]
      @S3 = Jekylls3::S3Connection.new(config).S3
      raise BucketError, "Bucket #{@bucket_name} not found" unless site_bucket_exists?
    end

    def upload_directory(dir)
      files = Dir[ File.join(dir, '**', '*') ].reject { |p| File.directory? p }
      file_paths = [];
      files.each do |file|
        file.slice!(dir+"/")
        upload_file(file,File.join(dir,file))
      end
    end

    def upload_file(file_name,file_path)
       # check for age and etag - maybe we dont have to upload that file
       digest = digest(file_path)
       # if the object doesn't exist or the etag doesn't match upload
       obj = site_bucket.objects[file_name]
       if (!obj.exists? || digest_not_match(obj,file_path))
        puts "Uploading: " + file_name
        obj.write(:file=> file_path, :content_md5 => digest.base64digest, :single_request => true)
       end
    end
    
    ##
    # list the files in a chosen bucket return an array
    #
    #
    def list_uploaded_files
       file_names = []
       site_bucket.objects.each do |object|
         file_names << object.key
        end
       return file_names
    end

    def empty_bucket
      # remove all the files in the bucket
    end

    def delete_bucket
      # remove the site bucket
    end

    def copy_bucket

    end

    def website_config
      site_bucket.configure_website
    end

    def acl_config
      #TODO
    end

    # all the buckets
    def all_buckets
     @S3.buckets
    end

    def site_bucket
     all_buckets[@bucket_name]
    end

    def create_bucket
      @S3.create(@bucket_name)
    end

    ##
    # iterates over all the buckets
    #
    #
    def list_buckets
     all_buckets.each do |bucket|
      puts bucket.name
     end
    end

    ##
    # find if buckets exists
    #
    #
    def site_bucket_exists?
      #all_buckets.collect(&:name).include?(@bucket_name)
      bucket = @S3.buckets[@bucket_name]
      bucket.exists?
    end

private

    def digest(file_path)
      Digest::MD5.file(file_path)
    end

    def digest_not_match(obj,file_path)
      obj.etag.gsub('"', '') != digest(file_path).to_s
    end

  end
end
