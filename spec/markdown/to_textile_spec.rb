# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Markdown::ToTextile do
  subject(:converter) { described_class.new }

  let(:input) do
    <<~MD
      # **Title**

      - item one
      - **item two**
        - nested with **bold**

      1. **first**
      1. second
    MD
  end

  let(:output) do
    <<~TEXTILE
      h3. *Title*

      *** item one
      *** *item two*
      **** nested with *bold*

      # *first*
      # second
    TEXTILE
  end

  it 'converts bold inside a list item' do
    expect(converter.convert('- **bold** text')).to eq('*** *bold* text')
  end

  it 'converts bold inside a header' do
    expect(converter.convert('# **Bold** header')).to eq('h3. *Bold* header')
  end

  it 'converts a full document' do
    expect(converter.convert(input)).to eq(output)
  end
end
