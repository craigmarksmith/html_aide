require 'spec_helper'

describe HtmlAide::InvalidElementError do

  describe '#message' do
    it 'returns the string "invalid format"' do
      error = HtmlAide::InvalidElementError.new('invalid format')
      expect(error.message).to eq 'invalid format'
    end

    it 'removes the cruft from Ox' do
      error = HtmlAide::InvalidElementError.new('invalid format, document not terminated at line 1, column 5 [parse.c:785]')
      expect(error.message).to eq 'invalid format, document not terminated at line 1, column 5'
    end
  end

end
