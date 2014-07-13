require 'spec_helper'

describe HtmlAide::Validator do

  describe '.validate' do
    it 'returns a SnippetValidator' do
      v = HtmlAide::Validator.validate('<a></a>')
      expect(v).to be_kind_of HtmlAide::SnippetValidator
    end
  end

  describe '#valid?' do
    context 'when the markup is valid' do
      it 'returns true for a normal snippet' do
        validator = HtmlAide::Validator.validate('<div id="taco">Taco</div>')
        expect(validator).to be_valid
      end

      it 'returns true for a nested snippet' do
        validator = HtmlAide::Validator.validate('<div id="taco">Taco <strong>Meat</strong></div>')
        expect(validator).to be_valid
      end

      it 'returns true for valid html tags' do
        validator = HtmlAide::Validator.validate('<input />')
        expect(validator).to be_valid
      end

      it 'returns true for a full page markup' do
        full_page = '<!DOCTYPE html><html><head><title>Test</title></head></html>'
        validator = HtmlAide::Validator.validate(full_page, :page)
        expect(validator).to be_valid
      end
    end

    context 'when the markup is not valid' do
      it 'returns false for a broken tag' do
        validator = HtmlAide::Validator.validate('<div id="taco">Taco</div')
        expect(validator).to_not be_valid
      end
      it 'returns false for a nested broken tag' do
        validator = HtmlAide::Validator.validate('<div id="taco">Taco <strong>Meat</strong</div>')
        expect(validator).to_not be_valid
      end
      it 'returns false for invalid tags' do
        validator = HtmlAide::Validator.validate('<taco>Meat</taco>')
        expect(validator).to_not be_valid
      end
    end
  end
end
