require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/advanced'

class AdvancedTest < MiniTest::Test

  def test_it_exists
    advanced = Advanced.new
    assert_instance_of Advanced, advanced
  end

end
