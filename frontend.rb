require 'Unirest'
require 'pp'

base_url = "http://localhost:3000"

while true 

  p "Choose an option"

  p "[1] create a user"
  p "[2] login"
  p "[3] see all users"
  p "[4] see all addresses"

  user_input = gets.chomp

  if user_input == "1"
    the_parameters = {}
    p "Please enter your first name"
    the_parameters[:first_name] = gets.chomp
    p "Please enter your last name"
    the_parameters[:last_name] = gets.chomp
    p "Please enter your username"
    the_parameters[:username] = gets.chomp
    p "Please enter your zip code"
    the_parameters[:zip] = gets.chomp
    p "Please enter your password"
    the_parameters[:password] = gets.chomp
    p "Please confirm your password"  
    the_parameters[:password_confirmation] = gets.chomp
    response = Unirest.post("#{base_url}/users", parameters: the_parameters)
    pp response.body
 
  elsif user_input == "2"
  
    p "type in your username"
    username = gets.chomp
    p "type in your password"
    user_password = gets.chomp
    response = Unirest.post(
    "http://localhost:3000/user_token",
    parameters: {
      auth: {
        email: username,
        password: user_password
      }
    }
  )

    jwt = response.body["jwt"]

    Unirest.default_header("Authorization", "Bearer #{jwt}")

    pp jwt   

  elsif user_input == "3"

    response = Unirest.get("http://localhost:3000/users")
    pp response
    
  elsif user_input == "4"

    response = Unirest.get("http://localhost:3000/addresses")
    pp response
     
  elsif user_input == "0"
    break
  end

end