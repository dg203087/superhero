class Superhero::Hero
    attr_accessor :name, :power, :appearance, :bio
    
    def self.shazam
        #should return a bunch of instances of HEROES
        puts <<-DOC
            1. Batman
            2. Captain Marvel
            3. Batwoman
            4. Ant Man
        DOC
    # hero1 = self.new
    # hero1.name = "Batman"
    # hero1.power = "strong"
    # hero1.appearance = "black bat"
    # hero1.bio = "orphan bat"
    
    # hero2 = self.new
    # hero2.name = "Captain Marvel"
    # hero2.power = "strong"
    # hero2.appearance = "star-spangled hottie"
    # hero2.bio = "alien"

    # [hero1, hero2]
        
    end


end