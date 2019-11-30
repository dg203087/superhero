class Superhero::API
    BASE_URL = "https://superheroapi.com/api.php/"
    ACCESS_TOKEN = "814865975490"
    #should be saved in an environment and not hard coded

    def popular_superheroes
        popular_names = ["Batman", "Batwoman", "Beast", "Black_Widow", "Captain_America", 
        "Captain_Marvel", "Catwoman", "Deadpool", "Flash", "Harley_Quinn", "Hawkeye", 
        "Iron_Man", "Jessica_Jones", "Nebula", "Night_Crawler", "Quicksilver", "Robin", 
        "Rogue", "Spider Man", "Superman", "Valkyrie", "Winter_Soldier", "Wonder_Woman", 
        "Wolverine", "Yoda"]

        popular_names.each do |hero_name|
            results = HTTParty.get("#{BASE_URL}#{ACCESS_TOKEN}/search/#{hero_name}")

            results["results"].each do |attribute|
                name = ["name"]
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