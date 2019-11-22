#CLI Controller responsible for user interactions
class Superhero::CLI  

    def call
        puts "Welcome to Superhero Finder!"
        puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
        menu
        get_superheroes
        goodbye
    end

    def menu
        puts "Enter the name of the superhero you'd like to learn about." 
        puts "For a list of superheros by letter, type list."
        puts "Type exit to leave."
        
        while input != "exit"
            Superhero::API.query_superhero_db(input)
            get_superheroes
        elsif input == "list"
            list_superheroes_by_letter
        else
            puts "I don't know that superhero, try again."
            puts "For a list of superheros by letter, type list."
            puts "Type exit to leave."
        end
    end

    def get_superheroes #will really GET superheroes when using API
        @superheroes = Superhero::Hero.shazam
        # @superheroes.each_with_index(1) do |hero, i|
        #     puts "#{i}. #{hero.name}"
        # end
    end

    def list_superheroes_by_letter
        @list = Superhero::Hero.list_superheroes
    end

    def goodbye
        puts "See you soon Superhero!"
    end
end