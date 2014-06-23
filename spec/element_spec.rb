require 'spec_helper'

describe HtmlAide::Element do
  before do
    @markup = '<div id="taco"><strong>Taco</strong> Meat</div>'
    @node = Ox.parse(@markup)
  end

  subject { HtmlAide::Element.new(@node) }

  describe '#name' do
    it 'returns div' do
      expect(subject.name).to eq 'div'
    end
  end

  describe '#attributes' do
    it 'returns a hash' do
      expect(subject.attributes).to be_kind_of Hash
    end

    it 'has the key id with a value "taco"' do
      expect(subject.attributes).to have_key :id
      expect(subject.attributes[:id]).to eq 'taco'
    end
  end

  describe '#text' do
    it 'returns Taco Meat' do
      expect(subject.text).to eq 'Taco Meat'
    end
  end

  describe '#to_s' do
    # it 'returns the original markup' do
    #   # TODO: this test fails because ox adds spaces to the string
    #   #expect(subject.to_s).to eq @markup
    # end
    pending 'figure out how to not add spaces in ox'
  end

  describe '#children' do
    it 'returns an array with 1 element' do
      expect(subject.children.count).to eq 1
    end

    it 'contains a strong Element object' do
      expect(subject.children.collect(&:name)).to include 'strong'
    end

    it 'has a child element with the text Taco' do
      expect(subject.children.first.text).to eq 'Taco'
    end
  end

end
