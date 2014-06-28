module HtmlAide
  refine String do

    def html?
      HtmlAide::Validator.validate(self).valid?
    end

    def to_html
      node = HtmlAide::MarkupParser.parse(self)
      Element.new(node)
    end

  end
end
