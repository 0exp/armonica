# typed: false
# frozen_string_literal: true

RSpec.describe 'Smoke test' do
  specify do
    list = Armonica::Lists::SinglyLinked.new
    expect(list.count).to eq(0)

    list.append(3)
    expect(list.count).to eq(1)

    list.append('7')
    expect(list.count).to eq(2)

    list.prepend(9)
    expect(list.count).to eq(3)

    extention = Armonica::Lists::SinglyLinked.new
    extention.append(7)
    extention.append(Object.new)

    list.extend(extention)
    expect(list.count).to eq(5)

    expect(Armonica::VERSION).to eq('0.1.0')
  end
end
