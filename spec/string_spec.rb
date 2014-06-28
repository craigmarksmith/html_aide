require 'spec_helper'

class AFakeClass
  using HtmlAide

  def markup
    "<div>Yup</div>"
  end

  def html?
    markup.html?
  end

  def to_html
    markup.to_html
  end
end

describe AFakeClass do

  describe '#html?' do
    it 'validates the string as html' do
      tester = AFakeClass.new
      expect(tester).to be_html
    end
  end

  describe '#to_html' do
    it 'turns the markup into an HtmlAide::Element object' do
      tester = AFakeClass.new
      expect(tester.to_html.name).to eq 'div'
      expect(tester.to_html.class).to eq HtmlAide::Element
    end
  end

end
