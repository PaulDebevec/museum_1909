require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'
require './lib/museum'

class MuseumTest < Minitest::Test
  def setup
    @museum = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    @dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    @imax = Exhibit.new("IMAX", 15)
    @bob = Patron.new("Bob", 20)
    @sally = Patron.new("Sally", 20)
  end

  def test_it_exists
    assert_instance_of Museum, @museum
  end

  def test_it_initializes_with_name_and_empty_exhibits_array
    assert_equal "Denver Museum of Nature and Science", @museum.name
    assert_equal [], @museum.exhibits
  end

  def test_it_can_add_exhibits
    @museum.add_exhibit(@gems_and_minerals)
    @museum.add_exhibit(@dead_sea_scrolls)
    @museum.add_exhibit(@imax)
    assert_equal [@gems_and_minerals, @dead_sea_scrolls, @imax], @museum.exhibits
    assert_equal 3, @museum.exhibits.length
  end

  def test_its_recommend_exhibits_is_correct_for_each_patron
    @bob.add_interest("Dead Sea Scrolls")
    @bob.add_interest("Gems and Minerals")
    @sally.add_interest("IMAX")
    @museum.add_exhibit(@gems_and_minerals)
    @museum.add_exhibit(@dead_sea_scrolls)
    @museum.add_exhibit(@imax)

    assert @museum.recommend_exhibits(@bob).include?(@dead_sea_scrolls)
    assert @museum.recommend_exhibits(@bob).include?(@gems_and_minerals)
    assert_equal 2, @museum.recommend_exhibits(@bob).length
    assert_equal [@imax], @museum.recommend_exhibits(@sally)
    assert @museum.recommend_exhibits(@sally).include?(@imax)

  end

  def test_it_tracks_patrons_visiting
    assert_equal [], @museum.patrons
    @museum.admit(@bob)
    @museum.admit(@sally)
    assert @museum.patrons.include?(@sally)
    assert @museum.patrons.include?(@bob)
    assert_equal 2, @museum.patrons.length

  end

  def test_patrons_by_exhibit_interest
    @bob.add_interest("Dead Sea Scrolls")
    @bob.add_interest("Gems and Minerals")
    @sally.add_interest("IMAX")
    @museum.add_exhibit(@gems_and_minerals)
    @museum.add_exhibit(@dead_sea_scrolls)
    @museum.add_exhibit(@imax)
    @museum.admit(@bob)
    @museum.admit(@sally)
    # Brain fart. How test?!
    # require 'pry'; binding.pry
  end
end
