module HtmlAide
  class SnippetValidator

    def initialize(markup = '')
      @markup = markup
      @errors = []
      create_node_and_set_element
    end

    # returns the parsed element
    def element
      @element
    end

    # returns true if the element and all children are valid
    def valid?
      @valid
    end

    def errors
      @errors
    end

    private

    def create_node_and_set_element
      begin
        node = Ox.parse(@markup)
        @element = Element.new(node)
        @valid = true
      rescue Ox::ParseError => e
        @valid = false
        @element = NullElement.new
        @errors << InvalidElementError.new(e)
      end
    end
  end
end
