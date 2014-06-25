module HtmlAide
  class Validator
    # validate markup and return the instance that validated the markup based on format
    # possible future formats [:snippet, :document]
    def self.validate(markup, format = :snippet)
      @validator = HtmlAide.const_get("#{format.to_s.capitalize}Validator").new(markup)
    end
  end
end
