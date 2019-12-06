class Superhero::Hero
   
    attr_accessor :name, :full_name, :race, :alignment, :home_base, :publisher, :intelligence, 
    :strength, :speed, :durability, :power, :combat

    @@all = []

    def initialize(name, full_name, race, alignment, home_base, publisher, intelligence, 
        strength, speed, durability, power, combat)
        @name = name
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

    def self.find_by_index(index)
        @@all[index]
    end

    def self.clear
        @@all.clear
    end

end