# frozen_string_literal: true

require 'rails/engine'

module MarkLeft
  class Engine < ::Rails::Engine
    config.autoload_paths << "#{root}/lib"
  end
end
