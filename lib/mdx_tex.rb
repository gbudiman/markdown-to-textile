# frozen_string_literal: true

require 'mdx_tex/version'
require 'mdx_tex/configuration'
require 'mdx_tex/to_textile'

module MdxTex
  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end

    def to_textile(markdown:, **options)
      merged = { header_level: configuration.header_level, list_depth: configuration.list_depth }.merge(options)
      MdxTex::ToTextile.new(**merged).execute(markdown)
    end
  end
end
