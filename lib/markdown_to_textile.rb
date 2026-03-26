# frozen_string_literal: true

require 'markdown_to_textile/version'
require 'markdown/to_textile'

module MarkdownToTextile
  def self.convert(markdown, **options)
    Markdown::ToTextile.new(**options).convert(markdown)
  end
end
