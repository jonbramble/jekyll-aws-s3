# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekylls3/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-aws-s3"
  spec.version       = Jekylls3::VERSION
  spec.authors       = ["Jonathan Bramble"]
  spec.email         = ["jbramble82@hotmail.com"]
  spec.summary       = %q{An uploader and a config manager for Jekyll sites on AWS S3}
  spec.description   = %q{My first Gem. An uploader and a config manager for Jekyll sites on AWS S3}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 0"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_runtime_dependency "aws-sdk", "~> 1.32"
  spec.add_runtime_dependency "jekyll", "~> 1.4"
  spec.add_runtime_dependency "thor", "~> 0.18"
end
