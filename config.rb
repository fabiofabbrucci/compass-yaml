# Require any additional compass plugins here.
require 'yaml'

# Set this to the root of your project when deployed:
http_path = "/"
css_dir = "stylesheets"
sass_dir = "sass"
images_dir = "images"
javascripts_dir = "javascripts"

module Sass::Script::Functions
  def yaml(option)
    obj = YAML.load_file('config/config.yml')
    value = obj['options'][option.to_s]
    p value
    if(value.is_a?(String))
	    Sass::Script::Value::String.new(value.to_s)
  	elsif (value.is_a?(Array))
  		value.each_with_index do |elem, i|
    			value[i]= Sass::Script::Value::String.new(elem.to_s)
  		end
  		Sass::Script::Value::List.new(value, ",")
  	end
  end
end