# frozen_string_literal: true

require 'markdown/to_textile/header'
require 'markdown/to_textile/bold'
require 'markdown/to_textile/unordered_list'
require 'markdown/to_textile/ordered_list'

module Markdown
  class ToTextile
    VALID_HEADER_LEVELS = %w[h1 h2 h3 h4 h5 h6].freeze

    class InvalidListDepthError < ArgumentError
      def initialize(value)
        super("list_depth must be a positive integer, got: #{value.inspect}")
      end
    end

    class InvalidHeaderLevelError < ArgumentError
      def initialize(value)
        super("header_level must be one of #{VALID_HEADER_LEVELS.join(', ')}, got: #{value.inspect}")
      end
    end

    def initialize(header_level: 'h3', list_depth: 3)
      raise InvalidHeaderLevelError, header_level if invalid_header_level?(header_level)
      raise InvalidListDepthError, list_depth if invalid_list_depth?(list_depth)

      @header_level = header_level
      @list_depth = list_depth
    end

    def convert(input)
      return '' if input.nil?

      input.to_s.split("\n", -1).map { |line| convert_line(line) }.join("\n")
    end

    private

    def invalid_header_level?(header_level)
      !VALID_HEADER_LEVELS.include?(header_level)
    end

    def invalid_list_depth?(list_depth)
      !list_depth.is_a?(Integer) || !list_depth.positive?
    end

    def convert_line(line)
      line = Header.execute(line, header_level: @header_level)
      line = Bold.execute(line)
      line = UnorderedList.execute(line, list_depth: @list_depth)
      OrderedList.execute(line)
    end
  end
end
