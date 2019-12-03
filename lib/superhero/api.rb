class Superhero::API
    BASE_URL = "https://superheroapi.com/api.php/"
    ACCESS_TOKEN = "814865975490"
    #should be saved in an environment and not hard coded

    def self.create_popular_superheroes
        popular_names = [70, 73, 75, 107, 149, 156, 165, 213, 263, 309, 313, 346, 361, 
        487, 490, 536, 561, 567, 621, 644, 684, 714, 720, 717, 729]
        # popular_names = ["Batman", "Batwoman", "Beast", "Black_Widow", "Captain_America", 
        # "Captain_Marvel", "Catwoman", "Deadpool", "Flash", "Harley_Quinn", "Hawkeye", 
        # "Iron_Man", "Jessica_Jones", "Nebula", "Quicksilver", "Robin", 
        # "Rogue", "Spider-Man", "Superman", "Valkyrie", "Winter_Soldier", "Wonder_Woman", 
        # "Wolverine", "Yoda"]

        popular_names.each do |hero_id|
            results = HTTParty.get("#{BASE_URL}#{ACCESS_TOKEN}/#{hero_id}")
            # if results.has_key?()
    
            results["results"].each do |attribute|
                name = attribute["name"]
                full_name = attribute["biography"]["full-name"]
                race = attribute["appearance"]["race"]
                alignment = attribute["biography"]["alignment"]
                home_base = attribute["work"]["base"]
                publisher = attribute["biography"]["publisher"]
                intelligence = attribute["powerstats"]["intelligence"]
                strength = attribute["powerstats"]["strength"]
                speed = attribute["powerstats"]["speed"]
                durability = attribute["powerstats"]["durability"]
                power = attribute["powerstats"]["power"]
                combat = attribute["powerstats"]["combat"]
            
                Superhero::Hero.new(name, full_name, race, alignment, home_base, publisher, intelligence, 
                strength, speed, durability, power, combat)
            end
        # else 
        #     binding.pry
        # end 
        end 
    end

    # def self.query_superhero_db(input)
    #     input = input.downcase.tr(" ","_") #make URL friendly parameterize
    #     results = HTTParty.get("#{BASE_URL}#{ACCESS_TOKEN}/search/#{input}")
        
    #     results["results"].each do |attribute|
    #         name = ["name"]
    #         full_name = attribute["biography"]["full-name"]
    #         race = attribute["appearance"]["race"]
    #         alignment = attribute["biography"]["alignment"]
    #         home_base = attribute["work"]["base"]
    #         publisher = attribute["biography"]["publisher"]
    #         intelligence = attribute["powerstats"]["intelligence"]
    #         strength = attribute["powerstats"]["strength"]
    #         speed = attribute["powerstats"]["speed"]
    #         durability = attribute["powerstats"]["durability"]
    #         power = attribute["powerstats"]["power"]
    #         combat = attribute["powerstats"]["combat"]
    #         Superhero::Hero.new(hero_name, full_name, race, alignment, home_base, publisher, intelligence, 
    #         strength, speed, durability, power, combat)
    #     end  
    # end
end