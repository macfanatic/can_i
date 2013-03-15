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
      reset_with_role! role
    end

    def can(action)
      approved_actions << action.to_sym unless approved_actions.include?(action.to_sym)
    end

    def can?(action)
      can_do_anything? || approved_actions.include?(action.to_sym)
    end

    def cannot(action)
      approved_actions.delete action.to_sym
    end

    def can_do_anything!
      @can_do_anything = true
    end

    def reset_with_role!(role)
      @can_do_anything = false
      @approved_actions = []

      klass = role_for_symbol(role)
      @auth_role = klass.new
      klass.registration_blocks.each { |b| instance_eval &b }
    end


    protected

    def approved_actions
      @approved_actions ||= []
    end

    def can_do_anything?
      @can_do_anything
    end

    def role_for_symbol(sym)
      role = "#{sym}_role".camelize
      CanI.const_defined?(role) ? CanI.const_get(role) : Kernel.const_get(role)
    end

  end
end
