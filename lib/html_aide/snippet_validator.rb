module HtmlAide
  class SnippetValidator
    attr_accessor :ox
    attr_reader :markup

    def initialize(markup = '')
      self.markup = markup
    end

    def markup=(markup)
      @ox = Ox.parse(markup)
      @markup = markup
    end

    def element
      @element ||= Element.new(@ox)
    end

    def valid?
      true
    end
  end
end
