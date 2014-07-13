module HtmlAide
  class MarkupParser
    class ParseError < StandardError; end

    def self.parse(markup, mode = :weak)
      parser = new
      parser.send("#{mode}_parse", markup)
    rescue Ox::ParseError => e
      raise ParseError, e.to_s
    rescue Tag::ParseError => e
      raise ParseError, e.to_s
    end

    private

    # Weak mode is for parsing snippets of markup
    def weak_parse(markup)
      node = Ox.parse(markup)
      node = Tag.parse(node)
    end

    # Strict mode is for parsing an entire document
    def strict_parse(markup)
      response = RestClient.post(
        "http://validator.nu/?out=json",
        markup,
        { 'Content-Type' => 'text/html; charset=utf-8', 'Content-Encoding' => 'UTF-8' }
      )
      @json = Oj.load(response.body)
      errors = @json['messages'].select { |mssg| mssg['type'] == 'error' }
      raise ParseError, errors.to_json if errors.any?
      @json
    end
  end
end
