class Superhero::API
    BASE_URL = "https://superheroapi.com/api.php/"
    ACCESS_TOKEN = "814865975490"
    #should be saved in an environment and not hard coded

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