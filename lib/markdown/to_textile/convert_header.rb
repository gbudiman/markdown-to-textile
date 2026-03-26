# frozen_string_literal: true

module Markdown
  class ToTextile
    module ConvertHeader
      def self.call(line, header_level:)
        line.sub(/\A#+\s+(.+)\z/, "#{header_level}. \\1")
      end
    end
  end
end
