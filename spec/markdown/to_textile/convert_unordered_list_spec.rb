# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Markdown::ToTextile::ConvertUnorderedList do
  it 'converts a depth-1 item' do
    expect(described_class.call('- item')).to eq('* item')
  end

  it 'converts a depth-2 item (2-space indent)' do
    expect(described_class.call('  - nested')).to eq('** nested')
  end

  it 'converts a depth-3 item (4-space indent)' do
    expect(described_class.call('    - deep')).to eq('*** deep')
  end

  it 'leaves non-list lines unchanged' do
    expect(described_class.call('plain text')).to eq('plain text')
  end
end
