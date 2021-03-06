# WARNING:
this gem is in super early stages, and API may change many times without notice.  

# HtmlAide

Use the HtmlAide to validate html snippets or entire page markup

## Installation

Add this line to your application's Gemfile:

    gem 'html_aide'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install html_aide

## Usage

_With valid markup_

```ruby
snippet = '<div id="taco"><strong>Taco</strong> Meat</div>'
validator = HtmlAide::Validator.validate(snippet)
validator.valid? #=> true
validator.class #=> HtmlAide::SnippetValidator
validator.errors #=> []
tag = validator.element #=> HtmlAide::Element
tag.attributes #=> {:id => "taco"}
tag.name #= 'div'
tag.text #=> 'Taco Meat'
tag.children #=> [<#HtmlAide::Element>]
tag.children.first.name #=> 'strong'
tag.children.first.to_s #=> '<strong>Taco</strong>'
tag.to_s #=> '<div id="taco"><strong>Taco</strong> Meat</div>'
```

_With invalid markup_

```ruby
snippet = '<div>Messed up </div'
validator = HtmlAide::Validator.validate(snippet)
validator.valid? #=> false
validator.class #=> HtmlAide::SnippetValidator
validator.errors #=> [<#HtmlAide::InvalidElementError>]
error = validator.errors.first #=> HtmlAide::InvalidElementError
error.message #=> 'invalid format, document not terminated at line 1, column 21'
validator.element #=> HtmlAide::NullElement
```

_Also validates invalid HTML 5 tags_

```ruby
snippet = '<taco>Chicken Soft</taco>'
validator = HtmlAide::Validator.validate(snippet)
validator.valid? #=> false
validator.errors.first.message #=> 'taco is not a valid HTML tag'
```

_Extend your object with HtmlAide_

```ruby
class MySpecialObject
  using HtmlAide
  attr_accessor :markup

  def initialize(some_markup)
    @markup = some_markup
  end

  def is_html?
    @markup.html?
  end

  def to_element
    @markup.to_html
  end
end

obj = MySpecialObject.new('<div>Taco Meat</div>')
obj.is_html? #=> true
obj.to_element #=> <#HtmlAide::Element>
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/html_aide/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## Notes & thoughts
My current vision for this project is that you can pass in a snippet of html like `<a href="http://www.google.com">Google</a>` and it would return an object that knows the type of element along with the attributes as well as if it's valid or not. An invalid snippet would also return an object, but more of a `NullObject` or something like that which would act similar to a valid object, but would have `errors` method which would include any validation errors that occurred.

Instantiating this `HtmlAide::Validation` object would give you the option to choose page or snippet. The full page validation would look for things like doctype, proper head tags, etc... We could proxy this to `tidy` which would need to be required, or somehow included.

More advanced markup like `<ul><li>Item</li></ul>` could be passed where the return object (`HtmlAide::HTMLElement` ?) would have a `children` method that could return a collection of the nested elements.
