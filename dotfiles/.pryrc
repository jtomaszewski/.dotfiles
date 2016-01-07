if defined?(PryDebugger)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
  Pry.commands.alias_command "q", "exit-all"
end

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

# to install theme, run: `gem install pry-theme`
Pry.config.theme = "railscasts"

def prompt_env
  if defined?(Rails)
    env_name = case Rails.env.to_s
    when "production" then "prod"
    when "staging" then "stag"
    when "development" then "dev"
    else Rails.env.to_s
    end
  else
    RUBY_VERSION
  end
end

Pry.prompt = [
  proc { |obj, nest_level, _|
    prompt = ""
    prompt += "\001\e[01;38;5;202m\002"
    prompt += "#{prompt_env} > "
    prompt += "\001\e[0m\002"
  },
  proc { |obj, nest_level, _|
    prompt = "(#{obj}):#{nest_level} *"
  }
]

if defined?(Rails)
  # Add Rails console helpers (like `reload!`) to pry
  if defined?(Rails::ConsoleMethods)
    extend Rails::ConsoleMethods

    def r!
      reload!
    end
  end

  # local methods helper
  # http://rakeroutes.com/blog/customize-your-irb/
  class Object
    def local_methods
      case self.class
      when Class
        self.public_methods.sort - Object.public_methods
      when Module
        self.public_methods.sort - Module.public_methods
      else
        self.public_methods.sort - Object.new.public_methods
      end
    end
  end
end
