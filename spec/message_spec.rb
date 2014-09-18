require 'rails_helper'

describe Message, :vcr => true do
  it "doesn't save the message if Twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '111111', :from => '4842902040')
    expect(message.save).to be_falsey
  end

  it "adds an error if the number is invalid" do
    message = Message.new(:body => 'hi', :to => '111111', :from => '4842902040')
    message.save
    message.errors[:base].should eq ["The 'To' number 111111 is not a valid phone number."]
  end
end
