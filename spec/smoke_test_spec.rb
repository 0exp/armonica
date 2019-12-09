# frozen_string_literal: true

RSpec.describe 'Smoke test' do
  specify do
    expect(Armonica::VERSION).to be_a(String)
  end
end
