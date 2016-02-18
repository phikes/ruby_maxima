require 'spec_helper'

describe RubyMaxima::Session do
  it 'can be created' do
    expect(subject).not_to be nil
  end

  it 'allows for adding commands' do
    subject.sqrt 2, "2", [1,2,"3"]
    expect(subject.commands).to include 'sqrt(2,"2",[1, 2, "3"]);'
  end

  it 'allows for execution of the commands' do
    subject.sqrt 16
    expect(subject.execute).to eq '4'
  end

  it 'allows for debugging the maxima calls' do
    subject.debug = true
    subject.sqrt 16
    expect(STDOUT).to receive(:puts)
    subject.execute
  end
end
