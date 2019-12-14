# typed: strict
# frozen_string_literal: true

class Armonica::Lists::SinglyLinked < Armonica::Lists::Abstract
  extend T::Sig

  sig { returns(T.nilable(Armonica::Lists::Element)) }
  attr_reader :root

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
    new_root = Armonica::Lists::Element.new(value)
    new_root.assign_next(T.must(root)) unless root.nil?
    assign_root(new_root)
  end

  sig { params(list: Armonica::Lists::SinglyLinked).void }
  def extend(list) # rubocop:disable Metrics/AbcSize
    extention_head = T.let(list.root, T.nilable(Armonica::Lists::Element))
    return if extention_head.nil?
    last_element = T.let(root, T.nilable(Armonica::Lists::Element))

    if last_element.nil?
      last_element = Armonica::Lists::Element.new(extention_head.value)
      assign_root(last_element)
      extention_head = extention_head.next
    else
      last_element = last_element.next until last_element.next.nil?
    end

    until extention_head.nil?
      new_element = Armonica::Lists::Element.new(extention_head.value)
      last_element.assign_next(new_element)
      last_element = new_element
      extention_head = extention_head.next
    end
  end

  sig { returns(BasicObject) }
  def head
    T.must(root).value unless root.nil?
  end

  sig { returns(BasicObject) }
  def tail
    last_element = T.let(root, T.nilable(Armonica::Lists::Element))
    return nil if last_element.nil?
    last_element = last_element.next until last_element.next.nil?
    last_element.value
  end

  sig { returns(Integer) }
  def count
    initial_count = 0
    current_element = T.let(root, T.nilable(Armonica::Lists::Element))

    unless current_element.nil?
      initial_count += 1
      initial_count += 1 until (current_element = current_element.next).nil?
    end

    initial_count
  end

  private

  sig { params(element: Armonica::Lists::Element).void }
  def assign_root(element)
    @root = T.let(element, T.nilable(Armonica::Lists::Element))
  end
end
