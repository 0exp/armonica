# typed: strict
# frozen_string_literal: true

class Armonica::Lists::Lock
  extend T::Sig

  sig { void }
  def initialize
    @sync = T.let(Mutex.new, Mutex)
  end

  sig { params(block: T.proc.void).void }
  def thread_safe(&block)
    sync.synchronize(&block)
  end

  private

  sig { returns(Mutex) }
  attr_reader :sync
end
