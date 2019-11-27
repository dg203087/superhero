class Superhero::API
    BASE_URL = "https://superheroapi.com/api.php/"
    ACCESS_TOKEN = "814865975490"
    #should be saved in an environment and not hard coded

    def popular_superheroes
        scrape_restaurants_index.each do |shero|
            Superheroes::Hero.new_from_index(shero)
        end
    #common superheroes methoed utilizes array - iterates and passes name through 
    end

    def self.query_superhero_db(input)
        input = input.downcase.tr(" ","_") #make URL friendly parameterize
        results = HTTParty.get("#{BASE_URL}#{ACCESS_TOKEN}/search/#{input}")
        
        results["results"].each do |attribute|
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
            Superhero::Hero.new(full_name, race, alignment, home_base, publisher, intelligence, 
            strength, speed, durability, power, combat)
        end  
    end
end