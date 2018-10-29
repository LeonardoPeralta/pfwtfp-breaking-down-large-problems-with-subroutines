#!/usr/bin/env ruby
# Required to make the Ruby work.
require 'ostruct'
demo_loaf = OpenStruct.new(:type => "light rye", :length => 60)
# (end GIVEN CODE)

def get_two_slices_from_loaf(loaf, width)
  slices = Array.new(loaf.length / width, "slice of #{loaf.type}")
  raise(ArgumentError, "Could not make enough bread from the loaf!") if slices.length < 2
  return slices[0,2]
end

def join_ingredients(i1, i2)
  puts "You join #{[i1, 'and', i2].join(' ')}"
  "(#{i1} and #{i2})"
end

def make_pbj_sandwich(bread1, bread2, peanut_butter, jelly)
  side1 = join_ingredients(bread1, peanut_butter)
  side2 = join_ingredients(bread2, jelly)
  join_ingredients(side1, side2)
end

two_slices = get_two_slices_from_loaf(demo_loaf, 2)
make_pbj_sandwich(*two_slices, "Avi Flombautter's PB", "Pappy Burgess' Grape Jelly")
