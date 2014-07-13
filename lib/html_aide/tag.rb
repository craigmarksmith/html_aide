require 'pry'
module HtmlAide
  class Tag
    VALID_TAGS = %w(
      a abbr address area article aside audio
      b base bdi bdo blockquote body br button
      canvas caption cite code col colgroup
      datalist dd del details dfn div dl dt doctype
      em embed
      fieldset figcaption figure footer form
      h1 h2 h3 h4 h5 h6 head header hgroup hr html
      i iframe img input ins
      kbd keygen
      label legend li link
      map mark menu menuitem meta meter
      nav noscript
      object ol optgroup option output
      p param pre progress
      q
      rp rt ruby
      s samp script section select small source span strong summary sup
      table tbody td textarea tfoot th thead time title tr track
      ul
      var video
      wbr
    ).freeze

    DOCTYPE_REGEXP = /<\!doctype\shtml>/i

    def self.parse(ox_node)
      raise ParseError, "#{ox_node.name} is not a valid HTML tag." unless valid_tag?(ox_node.name)
      ox_node
    end

    def self.valid_tag?(tag_name)
      VALID_TAGS.include?(tag_name)
    end

    class ParseError < StandardError; end
  end
end
