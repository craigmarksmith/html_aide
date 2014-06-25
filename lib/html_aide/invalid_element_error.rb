module HtmlAide
  class InvalidElementError

    def initialize(error)
      @message = error.to_s
    end

    def message
      @clean_message ||= @message.gsub(/\[\w+?.+\]/, '').strip
    end
  end
end
