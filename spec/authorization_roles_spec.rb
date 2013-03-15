describe "auth roles" do

  before do
    @auth = CanI::Authorization.new
  end

  it "should have a default role" do
    @auth.auth_role.should.be.instance_of CanI::AuthorizationRole 
  end

  describe "custom auth roles" do

    before do
      @auth = CanI::Authorization.new :custom
    end

    it "should respect my custom auth role" do
      @auth.auth_role.should.be.instance_of CustomRole
    end

    it "should allow custom roles to add definitions" do
      @auth.can?(:my_role).should == true
    end

  end

  describe "can do anything" do
    before do
      @auth = CanI::Authorization.new :admin
    end

    it "should let me do anything I want" do
      @auth.can?(Time.now.to_i.to_s).should == true
    end

  end

end
