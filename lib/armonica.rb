# typed: strict
# frozen_string_literal: true

require 'sorbet-runtime'
T::Configuration.enable_final_checks_on_hooks

module Armonica
  extend T::Sig

  require_relative 'armonica/version'
  require_relative 'armonica/lists'
end
