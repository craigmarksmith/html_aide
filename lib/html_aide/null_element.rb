module HtmlAide
  class NullElement < Element

    def initialize
      node = Struct.new(:name, :attributes, :nodes).new('Null', {}, [])
      super(node)
    end
  end
end
