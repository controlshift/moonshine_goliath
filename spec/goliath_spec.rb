require File.join(File.dirname(__FILE__), 'spec_helper.rb')

class GoliathManifest < Moonshine::Manifest::Rails
  include Moonshine::Goliath
end

describe "A manifest with the sidekiq plugin" do
  before do
    @manifest = GoliathManifest.new
    @manifest.configure(:goliath => {}, :deploy_to => '/srv/app')
  end

  it "should be executable" do
    @manifest.should be_executable
  end

  describe "using the `goliath` recipe" do
    before do
      @manifest.goliath
    end

    it "should install the template" do
      goliath_file = @manifest.files["/etc/god/#{@manifest.configuration[:application]}-goliath.god"]['content']
      goliath_file.should_not be_nil
      goliath_file.should include("w.name     = \"#{@manifest.configuration[:application]}-goliath")
    end
  end
end
