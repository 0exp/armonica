# frozen_string_literal: true

RSpec.describe 'Smoke test' do
  specify do
    expect(Armonica::VERSION).to eq('0.1.0')
  end
end
