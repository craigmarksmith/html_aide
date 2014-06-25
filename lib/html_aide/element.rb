module HtmlAide
  class Element
    attr_reader :proxy

    def initialize(node)
      @proxy = node
      @markup = Ox.to_xml(node).gsub("\n", '')
    end

    def name
      proxy.name
    end

    def attributes
      proxy.attributes
    end

    def text
      @text ||= Nokogiri::HTML.parse(@markup).text.strip
    end

    def to_s
      @markup
    end

    def children
      @children ||= proxy.nodes.reject {|n|
        String === n}.collect do |node|
        Element.new(node)
      end
    end

  end
end
