require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/intermediate'

class IntermediateTest < MiniTest::Test

  def test_it_exists
    intermediate = Intermediate.new
    assert_instance_of Intermediate, intermediate
  end

end
