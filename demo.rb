
def egg()
  egg_number=(rand()*12+1).to_i

  if (egg_number >= 1 and egg_number <=6); "White";
  elsif (egg_number >= 7 and egg_number <=9); "Brown";
  elsif (egg_number >= 10 and egg_number <= 12); "Blue";
  else "Call the farmer!"
  end
end

puts egg

#me playing with ideas.
def egg2(a, b, c)
  b2 = a + b
  c2 = b2 + c

  egg_number = (rand()*c2+1).to_i

  #print "#{egg_number}"
  
  if (egg_number > 0 and egg_number <= a); "White";
  elsif (egg_number > a and egg_number <= b2); "Brown";
  elsif (egg_number > b2 and egg_number <= c2); "Blue";
  else "Call the farmer!"
  end
end

puts egg2(6, 3, 3)

=begin
eggy = {
  "white" => 6,
  "brown" => 3,
  "blue"  => 3
}

#tests theory
eggy.each_with_index do |(key, value), index|
  lower = 0
  if (index != 0)
    lower = (eggy.values)[index - 1]
  end
end
=end
#me playing with ideas.#me playing with ideas.
def egg3(eggy)
  weights = eggy.values
  sum = weights.sum

  egg_number = (rand()*sum+1).to_i

  lower = 0 #dont need to reset this every time
  upper = weights[0] #idea but im done with mobile 
  
  egged = false #the chosen child, set as string later
  
  eggy.each_with_index do |(key, value), index|
    if (index.zero? == false)
      lower = upper #Each time, the lower bound moves to the last upper bound
      upper += value #and the upper bound is simply a summation of values
    end

    #wont be puts but i need to get the hell off this app
    if (egg_number > lower) and (egg_number <= upper)
      egged = 
    elsif index == (weights.length - 1) and egged
      puts "you failed"
    end
  end
end 