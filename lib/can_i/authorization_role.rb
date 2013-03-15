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
    # The above admin example would probably be more realistically written as:
    #   class AdminRole < CanI::AuthorizationRole
    #     authorization_roles do
    #       can_do_anything!
    #     end
    #   end
    #

    class << self

      # DSL to register a block to add more roles
      def authorization_roles(&block)
        class_instance_blocks << block
      end

      # Returns blocks for this subclass & all superclasses merged together
      def registration_blocks
        ancestors.select { |klass| klass <= CanI::AuthorizationRole }.map { |klass| klass.class_instance_blocks }.flatten
      end  

      # Stores the blocks registered just for this class
      def class_instance_blocks
        @class_instance_blocks ||= []
      end
      protected :class_instance_blocks

    end

  end
end
