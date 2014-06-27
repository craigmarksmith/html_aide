module HtmlAide
  class MarkupParser

    def self.parse(markup)
      node = Ox.parse(markup)
      node = Tag.parse(node)
    rescue Ox::ParseError => e
      raise ParseError, e.to_s
    rescue Tag::ParseError => e
      raise ParseError, e.to_s
    end

    class ParseError < StandardError; end
  end
end
