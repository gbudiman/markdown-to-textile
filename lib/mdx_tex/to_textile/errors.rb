# frozen_string_literal: true

module MdxTex
  class ToTextile
    VALID_HEADER_LEVELS = %w[h1 h2 h3 h4 h5 h6].freeze

    class InvalidListDepthError < ArgumentError
      def initialize(value)
        super("list_depth must be a positive integer, got: #{value.inspect}")
      end

      def self.validate!(value)
        raise self, value unless value.is_a?(Integer) && value.positive?
      end
    end

    class InvalidHeaderLevelError < ArgumentError
      def initialize(value)
        super("header_level must be one of #{VALID_HEADER_LEVELS.join(', ')}, got: #{value.inspect}")
      end

      def self.validate!(value)
        raise self, value unless VALID_HEADER_LEVELS.include?(value)
      end
    end
  end
end
