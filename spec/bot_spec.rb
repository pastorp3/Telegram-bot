# ../spec/bot_spec.rb

require_relative '../lib/Methods.rb'
require_relative '../lib/Location.rb'
require_relative '../lib/Number.rb'

# ------------Test----------

RSpec.describe '#set_location method to validate input' do
  it 'return false if the input length is less than 5' do
    input = '/map'
    expect(location(input)).to be(false)
  end

  it 'return false if the input match with a number' do
    input = '/map 1'
    expect(location(input)).to be(false)
  end

  it 'return name of the country if the first letter is capitalized' do
    input = '/map Mexico'
    expect(location(input)).to eql('Mexico')
  end

  it 'return name of the country capitalized if the first letter is not capitalized' do
    input = '/map mexico'
    expect(location(input)).to eql('Mexico')
  end
end

RSpec.describe '#set_number method to validate input' do
  it 'return false if input length is less than 6' do
    input = '/play'
    expect(number(input)).to be(false)
  end

  it 'return false if the number include letters' do
    input = '/play a'
    expect(number(input)).to be(false)
  end

  it 'return false if the number length is greater than 2' do
    input = '/play 100'
    expect(number(input)).to be(false)
  end

  it 'return false if the number is not between 0 to 10' do
    input = '/play 11'
    expect(number(input)).to be(false)
  end

  it 'return number if it is between 0 to 10' do
    input = '/play 1'
    expect(number(input)).to eql('1')
  end
end

RSpec.describe 'SetLocation class' do
  test = SetLocation.new
  it 'return false if the input is not in the database for the latitud' do
    input = 'asds'
    expect(test.latitud(input)).to be(false)
  end

  it 'return a float that is the latitud if the input is in the database' do
    input = 'Mexico'
    expect(test.latitud(input).class).to eql(Float)
  end

  it 'return false if the input is not in the database for the longitude' do
    input = 'asds'
    expect(test.longitude(input)).to be(false)
  end

  it 'return a float that is the longitude if the input is in the database' do
    input = 'Mexico'
    expect(test.longitude(input).class).to eql(Float)
  end
end
