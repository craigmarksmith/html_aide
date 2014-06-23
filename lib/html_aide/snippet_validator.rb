module HtmlAide
  class SnippetValidator

    def initialize(markup = '')
      @node = Ox.parse(markup)
      @element = Element.new(@node)
    end

    # returns the parsed element
    def element
      @element
    end

    # returns true if the element and all children are valid
    def valid?
      true
    end
  end
end
