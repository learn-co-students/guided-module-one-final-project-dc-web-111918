require_relative "../config/environment.rb"

require "spec_helper"

describe "Cli" do
  # RSpec::Mocks.configuration.allow_message_expectations_on_nil
  let(:cli) {Cli.new}

  it "sets user's input to user_name attribute" do
    allow($stdin).to receive(:gets).and_return('user name')
    cli.user_name = $stdin.gets
    expect(cli.user_name).to eq("user name")
  end

  it "returns language associated with input number" do
     allow($stdin).to receive(:gets).and_return("1")
     cli.language = $stdin.gets
         expect(cli.chosen_language_name).to eq "Arabic"
   end

   it "returns category associated with input number" do
     allow($stdin).to receive(:gets).and_return("3")
     cli.category = $stdin.gets
         expect(cli.chosen_category_name).to eq "Directions"
   end


end
