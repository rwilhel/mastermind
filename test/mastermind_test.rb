require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'

class MastermindTest < MiniTest::Test

  def test_it_exists
    mastermind = Mastermind.new
    assert_instance_of Mastermind, mastermind
  end


end
