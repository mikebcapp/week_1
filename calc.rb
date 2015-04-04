puts "Welcome to my command line calculator"
puts "--------------------------------------"
def user_input(num_order)
  puts "Enter your #{num_order} number into the calculator"
  input = gets.chomp
  puts "You entered the following number:  #{input}"
  input  
end
begin
  num1 = user_input("first")
  num2 = user_input("second")
  begin
    puts "Choose 1) to add  2) to subtract 3) to multiply or 4) to divide the two numbers"
    operator = gets.chomp
  end until %w(1 2 3 4).include?(operator)
  result= case operator
          when "1" then num1.to_i + num2.to_i
          when "2" then num1.to_i - num2.to_i
          when "3" then num1.to_i * num2.to_i
          when "4" then num1.to_f / num2.to_f
          end
  puts "The answer is #{result}"
  puts 'Do you want to continue? Enter Yes to continue and carry on calculating'
  answer = gets.chomp.downcase
end while answer == 'yes'