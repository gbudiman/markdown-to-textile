# frozen_string_literal: true

module Markdown
  class ToTextile
    module ConvertBold
      def self.call(line)
        line.gsub(/\*\*(.+?)\*\*|__(.+?)__/) { "*#{::Regexp.last_match(1) || ::Regexp.last_match(2)}*" }
      end
    end
  end
end
