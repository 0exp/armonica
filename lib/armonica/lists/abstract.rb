# typed: strong
# frozen_string_literal: true

class Armonica::Lists::Abstract
  extend T::Sig
  extend T::Helpers

  abstract!

  sig { returns(Armonica::Lists::Lock) }
  attr_reader :lock

  sig { void }
  def initialize
    @lock = T.let(Armonica::Lists::Lock.new, Armonica::Lists::Lock)
  end
end
