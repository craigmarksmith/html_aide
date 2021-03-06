require 'bundler'
Bundler.require(:default, :development)
require 'ox'
require 'nokogiri'
require 'oj'
require 'rest-client'

require 'html_aide/string'
require 'html_aide/tag'
require 'html_aide/markup_parser'
require 'html_aide/validator'
require 'html_aide/version'
require 'html_aide/invalid_element_error'
require 'html_aide/element'
require 'html_aide/null_element'
require 'html_aide/snippet_validator'
require 'html_aide/page_validator'

module HtmlAide
end
