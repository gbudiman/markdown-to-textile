# frozen_string_literal: true

require 'mdx_tex/to_textile/errors'
require 'mdx_tex/to_textile/header'
require 'mdx_tex/to_textile/bold'
require 'mdx_tex/to_textile/unordered_list'
require 'mdx_tex/to_textile/ordered_list'

module MdxTex
  class ToTextile
    def initialize(header_level: 'h3', list_depth: 3)
      InvalidHeaderLevelError.validate!(header_level)
      InvalidListDepthError.validate!(list_depth)

      @header_level = header_level
      @list_depth = list_depth
    end

    def execute(input)
      return '' if input.nil?

      input.to_s.split("\n", -1).map { |line| convert_line(line) }.join("\n")
    end

    private

    def convert_line(line)
      line = Header.execute(line, header_level: @header_level)
      line = Bold.execute(line)
      line = UnorderedList.execute(line, list_depth: @list_depth)
      OrderedList.execute(line)
    end
  end
end
