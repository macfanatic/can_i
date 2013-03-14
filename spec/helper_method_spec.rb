describe "should provide helper methods to all objects" do

  before do
    @tester = HelperMethodsTestObject.new
  end

  it "should let me shortcut the DSL methods" do
    @tester.should.respond_to :can
    @tester.should.respond_to :cannot
    @tester.should.respond_to :can?
  end

end
