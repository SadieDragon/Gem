
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
  "star5" => 4.5
}

temp_inv = [] #when nested, this will get shoved into a larger.. array
10.times {temp_inv.push(egg(geo))}

#questions
gems = {
  "star1" => ["trickshot", "black-rose", "everlasting-torment", "chained_death", "berserkers_eye", "mocking_laughter", "zod_stone", "caarsens_invigoration", "defiant_soul", "freedom_and_devotion", "nightmare_wreath", "respite_stone", "seleds_weakening", "pain_of_subjugation"],
  "star2" => ["power-and-command", "hunger", "bloody-reach", "cutthroats_grin", "lightning_core", "battleguard", "followers_burden", "unity_crystal"],
  "star5" => ["bottled-hope", "phoenix-ashes", "bsj", "chip_of_stoned_flesh", "echoing_shade", "howlers_call", "zwensons_haunting", "seeping_bile", "blessing_of_the_worthy"]
}

#for future me to get what in the world this mess is
fs = "\u{2605}" #full_star
es = "\u{2606}" #empty_star
space = "\u{20}" #there's a reason?
#and because i hate the spam of this
sf = "#{space}#{fs}" #Space before a full star
se = "#{space}#{es}" #space before an empty star
#funny output
star2 = "#{fs}#{sf}"
star = {
  "star1" => fs,
  "star2" => star2,
  2       => "#{star2}#{se}#{se}#{se}",
  3       => "#{star2}#{sf}#{se}#{se}",
  4       => "#{star2}#{space}#{star2}#{se}",
  5       => "#{star2}#{space}#{star2}#{sf}"
}

#five star types
fst = [2, 3, 4, 5]
#five star odds
fso = {
  2 => 75,
  3 => 20,
  4 => 4,
  5 => 1
}

temp_inv.each do |thing|
  gem_type = gems[thing]
  gem = gem_type[rand(0..(gem_type.length - 1))]

  (thing = egg(fso)) if (thing == "star5")

  puts "You recieved a #{star[thing]} #{gem}."
end
