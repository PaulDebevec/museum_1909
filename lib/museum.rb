class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @exhibit_interest = {}
  end

  #Adds an exhibit to the museum
  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  #Provides recommended exhibits for patrons based on their interests
  def recommend_exhibits(patron)
    patron_exhibits = []
    patron.interests.each do |interest|
      @exhibits.each do |exhibit|
        if exhibit.name.include?(interest)
          patron_exhibits << exhibit
        end
      end
    end
    patron_exhibits
  end

  # Adds patron to the museum array of patrons/visitors
  def admit(patron)
    @patrons << patron
  end

  # # Attempted to create a helper method for test_patrons_by_exhibit_interest
  # def all_patrons
  #   @patrons.flat_map { |patron| patron}
  # end

  # # Method to create a hash where the exhibits are the keys, and the patrons
  # #   who have an interest are the values.
  # def patrons_by_exhibit_interest
  #   @exhibits.reduce({})do |key, exhibit|
  #     @patrons.each do |patron|
  #       require 'pry'; binding.pry
  #     # This if statement works by itself, but why won't it work outside?
  #       if patron.interests.include?(exhibit.name)
  #       key[exhibit] = patron
  #       key
  #       end
  #     end
  #   end
  # end
end
