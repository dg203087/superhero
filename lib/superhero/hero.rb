class Superhero::Hero
   
    attr_accessor :full_name, :race, :alignment, :home_base, :publisher, :intelligence, 
    :strength, :speed, :durability, :power, :combat

    @@all = []

    def self.new_from_index(shero)
        self.new(

      end

    def initialize(full_name, race, alignment, home_base, publisher, intelligence, 
        strength, speed, durability, power, combat)
        @full_name = full_name
        @race = race
        @alignment = alignment
        @home_base = home_base
        @publisher = publisher
        @intelligence = intelligence
        @strength = strength
        @speed = speed
        @durability = durability
        @power = power
        @combat = combat
        @@all << self
    end

    def self.all
        @@all
    end

    # def valid?

    # end

    def self.find_by_index(index)
        @@all[index]
    end

    def self.list_superheroes(letter)
        puts <<-DOC
        This is where I will list all superheroes by a certain letter
        DOC
    end

end