#CLI Controller responsible for user interactions
class Superhero::CLI  

    def call
        puts " Welcome to Superhero Finder!"
        puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
        puts ""
        puts "   Popular Superheroes List"
        puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
        Superhero::API.new.popular_superheroes
        menu
    end

    def menu
        puts "Enter the name of the superhero from the list you'd like to learn about:" 
        puts "Type 'list' to see the list again."
        puts "Or you can type exit to leave."
        input = gets.strip
            
        if input == "exit"
            goodbye
        elsif input != nil         #.valid? == true #find a match in the API
            Superhero::API.query_superhero_db(input) 
            @attribute = Superhero::Hero.find_by_index(input.to_i - 1) 
            #instance variable set equal all initialized objects to be called below
            display_info

            puts "Would you like to learn about another superhero? y/n"
            input = gets.strip.downcase
            if input == "y"
                menu
            elsif input == "n"
                goodbye
            else
                puts ""
                puts "Not sure what you're trying to say, let's try again."
                puts ""
                menu
            end
        # elsif input == "list"
        #     list_superheroes_by_letter
        else 
            puts "I don't know that superhero, try again."
            puts "Type exit to leave."
        end
    end

    def display_info 
        puts "------------- Profile -------------"
        puts ""
        puts "Full Name:           #{@attribute.full_name}"
        puts "Race:                #{@attribute.race}"
        puts "Alignment:           #{@attribute.alignment}"
        puts "Home Base:           #{@attribute.home_base}"
        puts "Publisher:           #{@attribute.publisher}"
        puts ""
        puts "----------- Power Stats -----------"
        puts ""
        puts "Intelligence:        #{@attribute.intelligence}"
        puts "Strength:            #{@attribute.strength}"
        puts "Speed:               #{@attribute.speed}"
        puts "Durability:          #{@attribute.durability}"
        puts "Power:               #{@attribute.power}"
        puts "Combat:              #{@attribute.combat}"
        puts ""
    end

    def list_superheroes_by_letter(letter)
        puts "Enter the first letter of the superhero you're looking for:"
        
        # case letter = gets.strip.downcase
        #   when "a"
        #     puts Superhero::


        # @list = Superhero::Hero.list_superheroes
    end

    def goodbye
        puts ""
        puts "Off to another adventure! See you soon Superhero!"
    end
end