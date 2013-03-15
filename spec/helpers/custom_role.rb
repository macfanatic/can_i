class CustomRole < CanI::AuthorizationRole
  authorization_roles do
    can :my_role
  end
end