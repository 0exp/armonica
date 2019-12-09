# typed: strong
# frozen_string_literal: true

require 'sorbet-runtime'

module Armonica
  extend T::Sig

  require_relative 'armonica/version'
  require_relative 'armonica/lists'
end
