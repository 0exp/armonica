# typed: strong
# frozen_string_literal: true

class Armonica::Lists::Element
  extend T::Sig

  sig { returns(T.nilable(BasicObject)) }
  attr_reader :value

  sig { returns(T.nilable(Armonica::Lists::Element)) }
  attr_reader :next

  sig { params(value: T.nilable(BasicObject)).void }
  def initialize(value)
    @value = T.let(value, T.nilable(BasicObject))
    @next  = T.let(nil, T.nilable(Armonica::Lists::Element))
  end

  sig { params(element: Armonica::Lists::Element).void }
  def assign_next(element)
    @next = T.let(element, T.nilable(Armonica::Lists::Element))
  end
end
