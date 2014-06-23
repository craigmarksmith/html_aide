require 'spec_helper'

describe HtmlAide::SnippetValidator do
  subject { HtmlAide::SnippetValidator.new }

  describe 'valid?', :focus do

    it 'returns false' do
      expect(subject).to_not be_valid
    end
  end

end
