# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'html_aide/version'

Gem::Specification.new do |spec|
  spec.name          = "html_aide"
  spec.version       = HtmlAide::VERSION
  spec.authors       = ["Jeremy Woertink"]
  spec.email         = ["jeremywoertink@gmail.com"]
  spec.summary       = %q{Validate HTML snippets and markup.}
  spec.description   = %q{Validate HTML snippets and markup.}
  spec.homepage      = "https://github.com/devpointlabs/html_aide"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_dependency "ox"
  spec.add_dependency "nokogiri"
  spec.add_dependency "rest-client"
  spec.add_dependency "oj"
end
