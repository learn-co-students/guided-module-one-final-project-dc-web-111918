<<<<<<< HEAD
# require_relative "../../app/models/cli.rb"
# require_relative "../../config/environment.rb"
# require "spec_helper"
#
#
# describe "Cli" do
#   let (:checker) {Cli.new}
#
# #test neighborhood
#
# end
=======
require_relative "../../app/models/cli.rb"
require_relative "../../config/environment.rb"
require "spec_helper"

describe "CliChecker" do

  let (:checker) {CliChecker.new}

    it 'expects area_valid? to return Invalid Selection' do
    self.area_input.to_i = "5"
    expect (self.area.valid?).to be("Invalid selection")
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
>>>>>>> 6ca4fec40d4c071431255383dc4b02f8ec222beb
