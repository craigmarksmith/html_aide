require 'spec_helper'

describe HtmlAide::SnippetValidator do

  context 'with good markup' do
    before do
      @valid_markup = '<div id="taco">Taco Meat</div>'
    end

    subject { HtmlAide::SnippetValidator.new(@valid_markup) }

    describe '#element' do
      it 'returns HtmlAide::Element' do
        expect(subject.element).to be_kind_of HtmlAide::Element
      end
    end

    describe '#valid?' do
      it 'returns true' do
        expect(subject).to be_valid
      end
    end
  end

  context 'with bad markup' do
    before do
      @invalid_markup = '<div>Messed up </div'
    end

    subject { HtmlAide::SnippetValidator.new(@invalid_markup) }

    describe '#element' do
      it 'returns HtmlAide::NullElement' do
        expect(subject.element).to be_kind_of HtmlAide::NullElement
      end
    end

    describe '#valid?' do
      it 'returns false' do
        expect(subject).to_not be_valid
      end
    end

    describe '#errors' do
      it 'is an array with 1 error object' do
        expect(subject.errors.count).to eq 1
        expect(subject.errors.first).to be_kind_of HtmlAide::InvalidElementError
      end
    end
  end

end
