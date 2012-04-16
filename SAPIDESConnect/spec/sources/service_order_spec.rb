require File.join(File.dirname(__FILE__),'..','spec_helper')

describe "ServiceOrder" do
  it_should_behave_like "SpecHelper" do
    before(:each) do
      setup_test_for ServiceOrder,'testuser'
    end

    it "should process ServiceOrder query" do
      pending
    end

    it "should process ServiceOrder create" do
      pending
    end

    it "should process ServiceOrder update" do
      pending
    end

    it "should process ServiceOrder delete" do
      pending
    end
  end  
end