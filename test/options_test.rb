require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/options'

class OptionsTest < MiniTest::Test

  def test_it_exists
    options = Options.new
    assert_instance_of Options, options
  end

end
