module HtmlAide
  class InvalidElementError

    def initialize(error)
      @message = error
    end

    def message
      @clean_message ||= @message.gsub(/\[\w+?.+\]/, '').strip
    end
  end
end
