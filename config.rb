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
    Sass::Script::Value::String.new(obj['options'][option.to_s])
  end
end