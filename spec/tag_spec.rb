require 'spec_helper'

describe HtmlAide::Tag do

  describe '.parse' do
    let(:bad_node) { Ox.parse('<taco></taco>') }
    let(:good_node) { Ox.parse('<p></p>') }
    it 'takes an ox node and raises an error for an invalid tag' do
      expect { HtmlAide::Tag.parse(bad_node) }.to raise_error 'taco is not a valid HTML tag.'
    end

    it 'returns the original node when all is good' do
      expect(HtmlAide::Tag.parse(good_node)).to eq good_node
    end
  end

  describe '.valid_tag?' do
    it 'takes the tag name section and returns true' do
      expect(HtmlAide::Tag.valid_tag?('section')).to eq true
    end
    it 'takes the tag name blink and returns false' do
      expect(HtmlAide::Tag.valid_tag?('blink')).to eq false
    end
  end
end
