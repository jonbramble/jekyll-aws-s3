$:.unshift File.expand_path('../../lib', __FILE__)

require 'jekylls3'
require 'jekylls3/cli'

def testsite
  "testsite"
end

def s3_test_config
  YAML.load_file('spec/s3config.yml')
end

def s3_test_config_no_keys
  YAML.load_file('spec/s3config_nokeys.yml')
end

RSpec.configure do |config|

   def capture(stream)
    begin
      stream = stream.to_s
      eval "$#{stream} = StringIO.new"
      yield
      result = eval("$#{stream}").string
    ensure
      eval("$#{stream} = #{stream.upcase}")
    end

    result
  end

end




