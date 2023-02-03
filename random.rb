
##jaq!
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

  if (egg_number > 0 and egg_number <= a); "White";
  elsif (egg_number > a and egg_number <= b2); "Brown";
  elsif (egg_number > b2 and egg_number <= c2); "Blue";
  else "Call the farmer!"
  end
end

puts egg2(6, 3, 3)

#hashify
def egg3(eggy)
  sum = eggy.values.sum
  egg_number = (rand() * sum)

  lower = upper = 0 # STEAL HIS SMART IDEA
  eggy.keys.each do |color|
    upper += eggy[color]

    #shouldn't need to really check for a failstate
    (return color) if (egg_number > lower) and (egg_number <= upper)

    lower = upper
  end
end 

puts egg3({"1 star" => 0.754, "2 star" => 0.201, "5 star" => 0.045})
