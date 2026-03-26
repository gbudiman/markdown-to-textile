# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Markdown::ToTextile do
  subject(:converter) { described_class.new }

  let(:full_document_expected) do
    <<~TEXTILE
      h3. Title
      * item one
      * item two
      ** nested
      # first
      # second
    TEXTILE
  end
  let(:full_document_input) do
    <<~MD
      # Title
      - item one
      - item two
        - nested
      1. first
      1. second
    MD
  end

  it 'converts bold inside a list item' do
    expect(converter.convert('- **bold** text')).to eq('* *bold* text')
  end

  it 'converts bold inside a header' do
    expect(converter.convert('# **Bold** header')).to eq('h3. *Bold* header')
  end

  it 'converts a full document' do
    expect(converter.convert(full_document_input)).to eq(full_document_expected)
  end
end
