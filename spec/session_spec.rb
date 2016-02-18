require 'spec_helper'

describe RubyMaxima::Session do
  it 'can be created' do
    expect(subject).not_to be nil
  end

  it 'allows for adding single argument commands' do
    subject.sqrt 2
    expect(subject.commands).to include 'sqrt(2)'
  end

  it 'allows for adding multiple argument commands' do
    subject.sqrt 2, 3
    expect(subject.commands).to include 'sqrt(2,3)'
  end
end
