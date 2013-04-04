# Can I?
Provides a simple DSL to define actions as roles in your [RubyMotion](http://www.rubymotion.com) app.  Requires [BubbleWrap](https://github.com/rubymotion/BubbleWrap) as a dependency.

![Travis CI](https://secure.travis-ci.org/macfanatic/can_i.png?branch=master)

## Installation

Add the following to your project's `Rakefile` to work with bundler.

```ruby
gem "can_i"
```

Install with bundler:

```ruby
bundle install
```

## Using the Authorization class
I recommend you create an instance and store it in your application delegate.

```ruby
  class AppDelegate
    attr_accessor :authorization
    def application(application, didFinishLaunchingWithOptions:launchOptions)
      self.authorization = CanI::Authorization.new :admin
      true
    end
  end
```

Now, wherever you want to request access:

```ruby
puts "can do that thing" if App.delegate.authorization.can? :perform_action
```
### Helper Methods
You'll be doing that so much, that there are included shortcut methods.  This expects you to have an `CanI::Authorization` or subclass of, accessible at `App.delegate.authorization`.

You'll need to first include a module, like so:

```ruby
class SomeView < UIview
  include CanI::HelperMethods
  def initWithFrame(f)
    super
    self << my_custom_button if can? :can_push_button
    self
  end
end
```

## Custom Authorization Roles
You can easily create custom authorization roles to easily define sets of roles.

Let's create a base role that everyone will use in our app.

```ruby
class BaseRole < CanI::AuthorizationRole
  authorization_roles do
    can :view_help
  end
end
```

Now, let's let admin users do something different:

```ruby
class AdminRole < BaseRole
  authorization_roles do
    cannot :view_help
    can :fire_people
  end
end
```

You associate a role with the authorization system when you create your authorization instance.  Pass a symbol, which will have "Role" tacked on before looking up the class at runtime.

```ruby
App.delegate.authorization = CanI::Authorization.new :admin
```

### Can Do Anything
For an admin role, you're most likely going to let the user do anything.  There's a method for that too.  Note that you can't override the all powerful setting in a subclass of the `AdminRole`.

```ruby
class AdminRole < BaseRole
  authorization_roles do
    can_do_anything!
  end
end
```

## Changing Roles At Runtime
You can change a role at runtime without creating an entirely new `Authorization` object.

```ruby

# Say we always start out with a "default" role in our app
@auth = CanI::Authorization.new :default

### ...

# Now we realize we need to use a different role
@auth.reset_with_role! :admin

```
