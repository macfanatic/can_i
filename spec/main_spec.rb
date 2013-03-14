describe "authorization functionality" do
  
  before do
    @auth = CanI::Authorization.new
  end

  it "should not allow duplicates" do
    before_adding_new_role = @auth.send(:approved_actions).count
    @auth.can :some_action
    @auth.can :some_action
    @auth.send(:approved_actions).count.should.equal (before_adding_new_role+1)
  end

  it "should allow you to define access rules" do
    @auth.can?(:my_action).should == false
    @auth.can :my_action
    @auth.can?(:my_action).should == true
  end

  it "should allow strings or symbols" do
    @auth.can(:some_action)
    @auth.can?('some_action').should == true
    @auth.can('my_action')
    @auth.can?(:my_action).should == true
  end

  it "should allow you to remove access" do
    @auth.cannot :some_action
    @auth.can?(:some_action).should == false
  end

end
