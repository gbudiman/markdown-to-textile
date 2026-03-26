# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Markdown::ToTextile::ConvertOrderedList do
  it 'converts a depth-1 item' do
    expect(described_class.call('1. item')).to eq('# item')
  end

  it 'converts any number prefix' do
    expect(described_class.call('3. item')).to eq('# item')
  end

  it 'converts a depth-2 item (2-space indent)' do
    expect(described_class.call('  1. nested')).to eq('## nested')
  end

  it 'leaves non-list lines unchanged' do
    expect(described_class.call('plain text')).to eq('plain text')
  end
end
