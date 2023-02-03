
#for future me to get what in the world this mess is
fs = "\u{2605}" #full_star
es = "\u{2606}" #empty_star
space = "\u{20}" #there's a reason?
#and because i hate the spam of this
sf = "#{space}#{fs}" #Space before a full star
se = "#{space}#{es}" #space before an empty star
#funny output
star1 = fs
star2 = "#{fs}#{sf}"
star5 = ["#{star2}#{se}#{se}#{se}", "#{star2}#{sf}#{se}#{se}", "#{star2}#{space}#{star2}#{se}", "#{star2}#{space}#{star2}#{sf}"]

def egg(eggy)
  sum = eggy.values.sum
  egg_number = (rand() * sum)

  lower = upper = 0 # STEAL HIS SMART IDEA
  eggy.keys.each_with_index do |color, index|
    upper += eggy[color]

    #shouldn't need to really check for a failstate
    (return color) if (egg_number > lower) and (egg_number <= upper)

    lower = upper
  end
end

#gem types (5 rolls from the next two)
gt = [1, 2, 5]
#the odds of each (youch)
geo = {
  "star1" => 75.4,
  "star2" => 20.1,
  "5" => 4.5
}

#star types
fst = [2, 3, 4, 5]
#five star odds
fso = {
  0 => 75,
  1 => 20,
  2 => 4,
  3 => 1
}

temp_inv = [] #when nested, this will get shoved into a larger.. array
10.times do
  roll = egg(geo)

  #if we rolled a chance at one of the 5 star gems
  (roll = egg(fso)) if (roll == "5")
  
  temp_inv.push(roll)
end

#does this even need to be a function? Not anymore? *sigh*
def pick_gem(thing)
  gem1 = ["trickshot", "black-rose", "everlasting-torment", "chained_death", "berserkers_eye", "mocking_laughter", "zod_stone", "caarsens_invigoration", "defiant_soul", "freedom_and_devotion", "nightmare_wreath", "respite_stone", "seleds_weakening", "pain_of_subjugation"]
  gem2 = ["power-and-command", "hunger", "bloody-reach", "cutthroats_grin", "lightning_core", "battleguard", "followers_burden", "unity_crystal"]
  #2, 3, 4, 5 star varients
  gem5 = ["bottled-hope", "phoenix-ashes", "bsj", "chip_of_stoned_flesh", "echoing_shade", "howlers_call", "zwensons_haunting", "seeping_bile", "blessing_of_the_worthy"]

  #thing is treated as an index here
  lengths = [gem1.length, gem2.length, gem5.length]
  g = rand(0..(lengths[thing] - 1))
  
  if thing == 0
    g = gem1[g]
  elsif thing == 1
    g = gem2[g]
  else
    g = gem5[g]
  end

  return g
end

temp_inv.each do |thing|
  if thing == "star1"
    gem = 0
    out_star = star1
  elsif thing == "star2"
    gem = 1
    out_star = star2
  else
    gem = 2
    out_star = star5[thing]
  end
  
  puts "You recieved a #{out_star} #{pick_gem(gem)}."
end
