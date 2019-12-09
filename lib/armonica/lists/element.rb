# typed: strong
# frozen_string_literal: true

class Armonica::Lists::Element
  extend T::Sig

  sig { returns(T.nilable(BasicObject)) }
  attr_reader :object

  sig { params(object: T.nilable(BasicObject)).void }
  def initialize(object)
    @object = T.let(object, T.nilable(BasicObject))
  end
end
