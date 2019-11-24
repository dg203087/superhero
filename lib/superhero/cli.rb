#CLI Controller responsible for user interactions
class Superhero::CLI  

    def call
        puts "Welcome to Superhero Finder!"
        puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
        menu
        goodbye
    end

    def menu
        puts "Enter the name of the superhero you'd like to learn about." 
        puts "Type exit to leave."
        input = gets.strip
            
        if input != nil #find a match in the API
            Superhero::API.query_superhero_db(input) 
            @attribute = Superhero::Hero.find_by_index(input.to_i - 1)
            display_info
        elsif input == "list"
                list_superheroes_by_letter
        else 
                puts "I don't know that superhero, try again."
                puts "Type exit to leave."
        end
    end

    def display_info 
        puts ""
        puts "----------- Profile -----------"
        puts ""
        puts "Full Name:           #{@attribute.full_name}"
        puts "Race:                #{@attribute.race}"
        puts "Alignment:           #{@attribute.alignment}"
        puts "Home Base:           #{@attribute.home_base}"   
    end

    def list_superheroes_by_letter(letter)
        puts "Enter the first letter of the superhero you're looking for:"
        
        # case letter = gets.strip.downcase
        #   when "a"
        #     puts Superhero::


        # @list = Superhero::Hero.list_superheroes
    end

    def goodbye
        puts "See you soon Superhero!"
    end
end