describe "auth roles" do

  before do
    @auth = CanI::Authorization.new
  end

  it "should have a default role" do
    @auth.auth_role.should.be.instance_of CanI::AuthorizationRole 
  end

  describe "custom auth roles" do

    before do

      class CustomRole < CanI::AuthorizationRole
        authorization_roles do
          can :my_role
        end
      end

      @auth = CanI::Authorization.new :custom

    end

    it "should respect my custom auth role" do
      @auth.auth_role.should.be.instance_of CustomRole
    end

    it "should allow custom roles to add definitions" do
      @auth.can?(:my_role).should == true
    end

  end

end
