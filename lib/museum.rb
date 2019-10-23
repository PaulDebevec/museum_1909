class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

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

  def admit(patron)
    @patrons << patron
  end

  # def rent(boat, renter)
  # @rental_log[boat] = renter
  # end
end
