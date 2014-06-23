require 'rubygems'
require 'bundler/setup'

$: << File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'html_aide'

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.order = "random"
  config.color = true
end
