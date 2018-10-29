def make_pbj_sandwich(bread1, bread2, peanut_butter, jelly)
  # Join ingredients
  puts "You join #{bread1} and #{peanut_butter}"
  side1 = "#{peanut_butter} on #{bread1}"

  # Join ingredients
  puts "You join #{bread2} and #{jelly}"
  side2 = "#{jelly} on #{bread2}"

  # Join ingredient on bread
  puts "You join #{side1} with #{side2}"
  "A #{peanut_butter} and #{jelly} sandwich"
end

puts make_pbj_sandwich("dark rye", "dark rye", "smooth premium Adirondack peanut butter", "organic strawberry jelly")



# GIVEN CODE
#
# Required to make the Ruby work.
require 'ostruct'
demo_loaf = OpenStruct.new(:type => "light rye", :length => 60)
# (end GIVEN CODE)

def make_pbj_sandwich(loaf, peanut_butter, jelly, slice_width)

  if slices.length >= 2
    bread1 = slices.shift # one less slice in slices
    bread2 = slices.shift # one less slice in slices

    # Join ingredients
    puts "You join #{bread1} and #{peanut_butter}"
    side1 = "#{peanut_butter} on #{bread1}"

    # Join ingredients
    puts "You join #{bread2} and #{jelly}"
    side2 = "#{jelly} on #{bread2}"

    # Join ingredient on bread
    puts "You join #{side1} with #{side2}"
    "A #{peanut_butter} and #{jelly} sandwich"
  else
    puts "Sorry we don't have enough bread to make a PBJ!"
  end
end

make_pbj_sandwich(demo_loaf, "crunchy monkey brand peanut butter", "Belgian forest-berry", 2)



----


  def get_two_slices_from_loaf(loaf, width)
      slices = []
        slices_count = loaf.length / width
          slices_count.times do
                slices << "slice of #{loaf.type}"
                  end

            if slices.length >= 2
                  return slices[0,2]
                    else
                          raise ArgumentError, "Could not make enough bread from the loaf!"
                            end
end

def make_pbj_sandwich(loaf, peanut_butter, jelly, slice_width)
    bread1, bread2 = get_two_slices_from_loaf(loaf, slice_width)

      # Join ingredients
    #   puts "You join #{bread1} and #{peanut_butter}"
    #     side1 = "#{peanut_butter} on #{bread1}"
    #
    #       # Join ingredients
    #         puts "You join #{bread2} and #{jelly}"
    #           side2 = "#{jelly} on #{bread2}"
    #
    #             # Join ingredient on bread
    #               puts "You join #{side1} with #{side2}"
    #                 "A #{peanut_butter} and #{jelly} sandwich"
    #                 end
    #
    #                 make_pbj_sandwich(demo_loaf, "crunchy monkey brand peanut
    #                 butter", "Belgian forest-berry", 2)
    #
