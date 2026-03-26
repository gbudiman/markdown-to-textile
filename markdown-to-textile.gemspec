# frozen_string_literal: true

require_relative 'lib/markdown_to_textile/version'

Gem::Specification.new do |spec|
  spec.name    = 'markdown-to-textile'
  spec.version = MarkdownToTextile::VERSION
  spec.summary = 'Convert between Markdown and Textile'
  spec.authors = ['Gloria Budiman']

  spec.required_ruby_version = '>= 2.6'

  spec.require_paths = ['lib']
  spec.files = Dir['lib/**/*.rb']

  spec.metadata['rubygems_mfa_required'] = 'true'
end
