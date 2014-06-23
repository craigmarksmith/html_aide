require 'spec_helper'

describe HtmlAide::SnippetValidator do

  context 'with good markup' do
    before do
      @valid_markup = '<div id="taco">Taco Meat</div>'
    end

    subject { HtmlAide::SnippetValidator.new(@valid_markup) }

    describe '#initialize' do
      it 'can assign the markup after instantiation' do
        expect(subject).to respond_to :markup=
      end
      it 'parses the markup with ox after assignment' do
        validator = HtmlAide::SnippetValidator.new(@valid_markup)
        expect(validator.ox).to be_kind_of Ox::Element
      end
    end

    describe 'element' do
      it 'returns HtmlAide::Element' do
        expect(subject.element).to be_kind_of HtmlAide::Element
      end
    end

    describe 'valid?' do

      it 'returns true' do
        expect(subject).to be_valid
      end
    end
  end

end
