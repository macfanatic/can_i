module CanI
  module HelperMethods

    def can(action)
      App.delegate.authorization.can action
    end

    def cannot(action)
      App.delegate.authorization.cannot action
    end

    def can?(action) 
      App.delegate.authorization.can? action
    end

  end

end
