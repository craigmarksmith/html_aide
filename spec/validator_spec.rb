require 'spec_helper'

describe HtmlAide::Validator do

  describe '#initialize' do
    it 'returns a SnippetValidator' do
      v = HtmlAide::Validator.new('')
      expect(v).to be_kind_of HtmlAide::SnippetValidator
    end
  end
end
