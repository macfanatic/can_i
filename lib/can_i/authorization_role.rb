module CanI
  class AuthorizationRole

    #
    # Create your own subclass to use with the Authorization class
    # You can define and undefine roles with a class method, as shown below
    #
    # Usage:
    #   class AdminRole < CanI::AuthorizationRole
    #     authorization_roles do
    #       can :fire_people
    #       cannot :sleep_in_cubicle
    #     end
    #   end
    #
    #   @auth = CanI::Authorization.new :admin
    #   @auth.can? :fire_people
    #   => true
    #

    class << self

      def authorization_roles(&block)
        registration_blocks << block
      end

      def registration_blocks
        @@registration_blocks ||= []
      end

    end

    # use to define additional rules in your subclass
    authorization_roles do
    end

  end
end
