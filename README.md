Compass-yaml
============

Intregrate a Yaml file in your Sass

## Benefits
[Yaml](http://www.yaml.org/) is a human friendly data serialization standard for all programming languages.
It's a common markup in a lot of languages and frameworks.

Now imagine you can share configuration through your application (configuration, views and all the other stuff) and your sass.

This allows you to reduce the effort for maintain your codebase.


## Code

Add this few lines to your `config.rb`. 

	require 'yaml'
	module Sass::Script::Functions
	  def yaml(option)
	    obj = YAML.load_file('config/config.yml')
	    Sass::Script::Value::String.new(obj['options'][option.to_s])
	  end
	end

Now from your sass files you can use the `yaml` function

	body{
		background-color: yaml(background); 
	}

where background is a variable in your `config.yml`

	options:
	  background: red
	  color: blue
	  columns: 12

## Easy, and now?

I'm thinking about creating a gem in order to use this even with plain sass.
Let me know if you are interested in.

Feel free to fork and adapt it.

Thank you, [Fabio](http://fabbrucci.me)