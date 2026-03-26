# frozen_string_literal: true

require 'markdown/to_textile/convert_header'
require 'markdown/to_textile/convert_bold'
require 'markdown/to_textile/convert_unordered_list'
require 'markdown/to_textile/convert_ordered_list'

module Markdown
  class ToTextile
    def initialize(header_level: 'h3')
      @header_level = header_level
    end

    def convert(input)
      input.split("\n", -1).map { |line| convert_line(line) }.join("\n")
    end

    private

    def convert_line(line)
      line = ConvertHeader.call(line, header_level: @header_level)
      line = ConvertBold.call(line)
      line = ConvertUnorderedList.call(line)
      ConvertOrderedList.call(line)
    end
  end
end
