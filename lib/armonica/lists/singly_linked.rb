# typed: strict
# frozen_string_literal: true

class Armonica::Lists::SinglyLinked < Armonica::Lists::Abstract
  extend T::Sig

  sig { void }
  def initialize
    super
    @root = T.let(nil, T.nilable(Armonica::Lists::Element))
  end

  sig { params(value: T.nilable(BasicObject)).void }
  def append(value)
    next_element = T.let(Armonica::Lists::Element.new(value), Armonica::Lists::Element)
    last_element = T.let(root, T.nilable(Armonica::Lists::Element))

    if last_element.nil?
      assign_root(next_element)
    else
      last_element = last_element.next until last_element.next.nil?
      last_element.assign_next(next_element)
    end
  end

  sig { params(value: T.nilable(BasicObject)).void }
  def prepend(value)
    new_root = T.let(Armonica::Lists::Element.new(value), Armonica::Lists::Element)
    new_root.assign_next(T.must(root)) unless root.nil?
    assign_root(new_root)
  end

  sig { returns(Integer) }
  def count
    initial_count = T.let(0, Integer)
    current_element = T.let(root, T.nilable(Armonica::Lists::Element))

    unless current_element.nil?
      initial_count += 1
      initial_count += 1 until (current_element = current_element.next).nil?
    end

    initial_count
  end

  private

  sig { returns(T.nilable(Armonica::Lists::Element)) }
  attr_reader :root

  sig { params(element: Armonica::Lists::Element).void }
  def assign_root(element)
    @root = T.let(element, T.nilable(Armonica::Lists::Element))
  end
end
