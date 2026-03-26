# frozen_string_literal: true

module Markdown
  class ToTextile
    module ConvertOrderedList
      INDENT_SIZE = 2

      def self.call(line)
        line.sub(/\A(\s*)\d+\.\s+(.+)\z/) do
          depth = (::Regexp.last_match(1).length / INDENT_SIZE) + 1
          "#{'#' * depth} #{::Regexp.last_match(2)}"
        end
      end
    end
  end
end
