module HtmlAide
  class PageValidator

    def initialize(markup = '')
      @markup = markup
      @errors = []
      parse_markup_for_errors
    end

    def valid?
      @valid
    end

    def errors
      @errors
    end

    private

    def parse_markup_for_errors
      begin
        node = MarkupParser.parse(@markup, :strict)
        @valid = true
      rescue MarkupParser::ParseError => e
        @errors += Oj.dump(e)
        @valid = false
      end
    end
  end
end
