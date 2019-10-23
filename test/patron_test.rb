require 'minitest/autorun'
require 'minitest/pride'
require './lib/patron'

class ExhibitTest < Minitest::Test
  def setup
    @patron = Patron.new("Bob", 20)
  end

  def test_it_exists
    assert_instance_of Patron, @patron
  end

  def test_it_initializes_with_name_and_spending_money
    assert_equal "Bob", @patron.name
    assert_equal 20, @patron.spending_money
  end

  def test_patron_interests_default_empty_array
    assert_equal [], @patron.interests
  end

  def test_patron_may_add_interests_to_array
    assert_equal [], @patron.interests
    @patron.add_interest("Dead Sea Scrolls")
    @patron.add_interest("Gems and Minerals")
    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], @patron.interests
    assert_equal 2, @patron.interests.length
  end
end
