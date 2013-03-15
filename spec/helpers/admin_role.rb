class AdminRole < CanI::AuthorizationRole
  authorization_roles do
    can_do_anything!
  end
end