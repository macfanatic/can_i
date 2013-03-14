module CanI
  class Authorization

    #
    # This is the main class to interact with to determine if
    # an action is permitted, or to define permissions
    #
    # Usage:
    #  
    #   class AppDelegate
    #     attr_accessor :authorization
    #     def application(application, didFinishLaunchingWithOptions:launchOptions)
    #       self.authorization = CanI::Authorization.new :admin
    #       true
    #     end
    #   end
    #
    #   class MyController < UIViewController
    #     def viewDidLoad
    #       if App.delegate.authorization.can? :get_drunk
    #         App.alert "Let's get drunk!"
    #       else
    #         App.alert "I'm married"
    #       end
    #     end
    #   end
    #

    attr_reader :auth_role

    def initialize(role=:authorization)

      klass = CanI.const_defined?("#{role}_role".camelize) ? CanI.const_get("#{role}_role".camelize) : Kernel.const_get("#{role}_role".camelize)

      @auth_role = klass.new
      auth_role.class.registration_blocks.each do |more_roles|
        instance_eval &more_roles
      end
    end

    def can(action)
      approved_actions << action.to_sym unless approved_actions.include?(action.to_sym)
    end

    def can?(action)
      approved_actions.include? action.to_sym
    end

    def cannot(action)
      approved_actions.delete action.to_sym
    end


    private

    def approved_actions
      @approved_actions ||= []
    end

  end
end
