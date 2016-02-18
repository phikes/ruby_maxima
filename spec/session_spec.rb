require 'spec_helper'

describe RubyMaxima::Session do
  it 'can be created' do
    expect(subject).not_to be nil
  end

  it 'allows for adding commands' do
    subject.sqrt 2, "2", [1,2,"3"]
    expect(subject.commands).to include 'sqrt(2,"2",[1, 2, "3"])'
  end
end
