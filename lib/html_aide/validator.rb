module HtmlAide
  class Validator
    # The validator class should not be used directly expect to instantiate
    # the actual class
    def self.new(markup, format = :snippet)
      @validator = HtmlAide.const_get("#{format.to_s.capitalize}Validator").new(markup)
    end
  end
end
