require 'spec_helper'

describe Jekylls3::CLI do

    it "returns a usage message" do
      args = ['echo', 'my args']
      opts = capture(:stdout) {Jekylls3::CLI.start(args) }
      opts.should include("args")
    end

end