require_relative "../../config/environment.rb"
require "spec_helper"

describe "Cli" do

  let (:cli) {Cli.new}

    it 'expects area_valid? to return Invalid Selection' do

    cli.area_input = "5"
    expect (cli.area.valid?).to be("Invalid selection")
  end

    it 'expects eventtype_valid? to return Invalid Selection' do
    self.eventtype_input.to_i = "7"
    expect (self.area.valid?).to be("Invalid selection")
  end

    it 'expects availabletime_valid? to return Invalid Selection' do
    self.avalailabletime_input.to_i = "1"
    expect (self.area.valid?).to be("Invalid selection")
  end

end
