class Superhero::Hero
   
    attr_accessor :id, :full_name, :place_of_birth, :alignment, :publisher, :race 

    @@all = []

    def initialize(args={})
    binding.pry
        args.each do |attribute, value|
            value.each do |attr, val|
                
                if attr == :id
                    puts "#{id}" 
                end
            end
        end
        @@all << self
    end

    def self.shazam_info
        #should return a bunch of instances of HEROES
        

        # {"id":"69",
        # "name":"Batman",
        # "powerstats":{"intelligence":"81",
        # "strength":"40",
        # "speed":"29",
        # "durability":"55",
        # "power":"63",
        # "combat":"90"},

        # "biography":{"full-name":"Terry McGinnis",
        # "alter-egos":"No alter egos found.",
        # "aliases":["Batman II","The Tomorrow Knight","The second Dark Knight","The Dark Knight of Tomorrow","Batman Beyond"],
        # "place-of-birth":"Gotham City, 25th Century",
        # "first-appearance":"Batman Beyond #1",
        # "publisher":"DC Comics",
        # "alignment":"good"},
        
        # "appearance":{"gender":"Male",
        # "race":"Human",
        # "height":["5'10","178 cm"],
        # "weight":["170 lb","77 kg"],
        # "eye-color":"Blue",
        # "hair-color":"Black"},
        
    



    end

    def self.list_superheroes(letter)
        puts <<-DOC
        This is where I will list all superheroes by a certain letter
    DOC
    end

end