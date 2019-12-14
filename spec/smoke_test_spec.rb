# typed: false
# frozen_string_literal: true

RSpec.describe 'Smoke test' do
  specify do
    list = Armonica::Lists::SinglyLinked.new
    expect(list.count).to eq(0)
    expect(list.head).to eq(nil)

    list.append(3)
    expect(list.count).to eq(1)
    expect(list.head).to eq(3)
    expect(list.tail).to eq(3)

    list.append('7')
    expect(list.count).to eq(2)
    expect(list.head).to eq(3)
    expect(list.tail).to eq('7')

    list.prepend(9)
    expect(list.count).to eq(3)
    expect(list.head).to eq(9)
    expect(list.tail).to eq('7')

    extention = Armonica::Lists::SinglyLinked.new.tap do |ext|
      ext.append(9)
      ext.append(7)
      ext.append(2)
    end

    list.extend(extention)
    expect(list.count).to eq(6)
    expect(list.head).to eq(9)
    expect(list.tail).to eq(2)

    extention.append(10)
    expect(list.count).to eq(6)
    expect(list.head).to eq(9)
    expect(list.tail).to eq(2)

    expect(Armonica::VERSION).to eq('0.1.0')
  end
end
