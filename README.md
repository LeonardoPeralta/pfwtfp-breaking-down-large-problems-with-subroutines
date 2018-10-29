# Breaking Down Large Problems with Subroutines

## Learning Goals

- Identify techniques for breaking down large problems: hide work in
  subroutines
- Identify techniques for breaking down large problems: DRY, prefer subroutines

## Introduction

Good code should be both easy to read as well as correct. When code is easy to
read, we can quickly isolate problems as well as reason about previous
programmers' intentions.

_Subroutines_ are procedures called by a procedure. These "child" procedures
help the "parent" procedure in two ways:

* They hide work that makes the "parent" code hard to read
* They make repetition of the same task follow the same code path; reducing
  error and limiting the number of changes required

We'll explore how subroutines help us in both pseudocode _and_ code by trying
to solve that persistent human problem: "I am hungry."

## Pseudocoding "Solve My Hunger"

Let's recall our Flatiron Programming Process:

1. Identify the problem
2. Identify the output that would solve the problem
3. Name the procedure that fixes the problem
4. Identify what inputs are needed to create the output
5. Define the procedure’s implementation
6. Translate the procedure description into code
7. Verify the procedure's output


We'll fill out steps 1-5 here.

```text
1. Identify the problem

I am hungry

2. Identify the output that would solve the problem

I want a peanut butter and jelly (pbj) sandwich.

3. Name the procedure that fixes the problem

make_pbj

4. Identify what inputs are needed to create the output

2 slices of bread, 20oz smooth PB, 20oz strawberry jam

5. Define the procedure’s implementation

* Get a slice of bread, put peanut butter on it
* Get the other slice of bread, put jelly on it
* Put the two slices of bread together with ingredients touching
* End result: sandwich
```

## Coding "Solve My Hunger"

Let's finish following the Flatiron process by performing Step 6: Translate the
procedure description into code.

We might translate this pseudocode into the following code in Ruby:

```ruby
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

#=> You join dark rye and smooth premium Adirondack peanut butter
#=> You join dark rye and organic strawberry jelly
#=> You join smooth premium Adirondack peanut butter on dark rye with organic strawberry jelly on dark rye
#=> A smooth premium Adirondack peanut butter and organic strawberry jelly sandwich

```

Follow Step 7 on your own. Work through the flow of the program and verify that
it works as we described in our pseudocode.


## New Directives

But now let's suppose the inputs change slightly. For each PBJ, we now get a
_loaf_ of bread _instead of_ two slices. We must make our PBJ on two equally
cut slices of bread from the loaf we are given.

Let's update our code:

```ruby
# GIVEN CODE
#
# Required to make the Ruby work.
require 'ostruct'
demo_loaf = OpenStruct.new(:type => "light rye", :length => 60)
# (end GIVEN CODE)

def make_pbj_sandwich(loaf, peanut_butter, jelly, slice_width)
  slices = []
  slices_count = loaf.length / slice_width
  slices_count.times do
    slices << "slice of #{loaf.type}"
  end

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

#=> You join slice of light rye and crunchy monkey brand peanut butter
#=> You join slice of light rye and Belgian forest-berry
#=> You join crunchy monkey brand peanut butter on slice of light rye with Belgian forest-berry on slice of light rye

```

Wow! Look at that, to add a little intelligence around working with a loaf
instead of two slices, our code lost a lot of its readability!  The new code is
confusing the core activity of the method which used to be there. We'd like to
hide away this new and confusing logic. The secret is to use a _subroutine_.

## Identify Techniques for Breaking Down Large Problems: Hide Work in Subroutines

The great part is that we can apply the Flatiron Process to help us think
through the subroutine. In fact, we can apply the Flatiron Process
_recursively_ until our problem is simple enough to reason about easily. Any
time a procedure is too complicated to easily grasp, feel free to use this
process to create a new subroutine. Coding in this style put humankind on the
moon, it's very powerful.

1. Identify the problem
2. Identify the output that would solve the problem
3. Name the procedure that fixes the problem
4. Identify what inputs are needed to create the output
5. Define the procedure’s implementation
6. Translate the procedure description into code
7. Verify the procedure's output

```text
1. Identify the problem

We have a loaf and we need two slices

2. Identify the output that would solve the problem

Two slices of bread

3. Name the procedure that fixes the problem

get_two_slices_from_loaf

4. Identify what inputs are needed to create the output

* a loaf
* the width

5. Define the procedure’s implementation

* Given a loaf and a width
* Cut the loaf as many times as posssible
* Collect the slices
* if there are at least two, return them
* otherwise `raise` an error and crash the program

6. Translate the procedure description into code

def get_two_slices_from_loaf(loaf, width)
  slices = []
  slices_count = loaf.length / slice_width
  slices_count.times do
    slices << "slice of #{loaf.type}"
  end

  if slices.length >= 2
    return slice[0,2]
  else
    raise ArgumentError, "Could not make enough bread from the loaf!"
    # `raise` makes a program crash with an error
  end
end

7. Verify the procedure's output

Exercise left to the reader
```

With this new method, this _subroutine_, in place, our code for
`make_pbj_sandwich` returns to its earlier, readable state:

```ruby
# Required to make the Ruby work.
require 'ostruct'
demo_loaf = OpenStruct.new(:type => "light rye", :length => 60)
# (end GIVEN CODE)

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
  puts "You join #{bread1} and #{peanut_butter}"
  side1 = "#{peanut_butter} on #{bread1}"

  # Join ingredients
  puts "You join #{bread2} and #{jelly}"
  side2 = "#{jelly} on #{bread2}"

  # Join ingredient on bread
  puts "You join #{side1} with #{side2}"
  "A #{peanut_butter} and #{jelly} sandwich"
end

make_pbj_sandwich(demo_loaf, "crunchy monkey brand peanut butter", "Belgian
forest-berry", 2)
```

## Identify Techniques for Breaking Down Large Problems: DRY, Prefer Subroutines

Not only do subroutines make it possible to hide complexity away, they also
make it possible to reduce repetition. Inside the implementation of
`make_a_pbj_sandwich`, we do three bits of work to join ingredients:

* Bread 1 and PB
* Bread 2 and Jelly
* ((Bread 1 and PB) and (Bread 2 and Jelly))

Let's update this implementation so that we "join" ingredients in a style like
`(ingredient1 and ingredient2)`.  Try to use the Flatiron Process here. Write
your answers on a sheet of paper or in a new editor window.

We'll wait :)

No peeking!

![No peeking Lucy Ricardo](https://media.giphy.com/media/26u8y41tkhGq81fr2/source.gif)

Back already? Great. We thought we could make the code simpler by writing this
method:

```ruby
def join_ingredients(i1, i2)
  puts "You join #{[i1, 'and', i2].join(' ')}"
  "(#{i1} and #{i2})"
end
```

With this our implementation can become even clearer:

```ruby
def make_pbj_sandwich(loaf, peanut_butter, jelly, slice_width)
  bread1, bread2 = get_two_slices_from_loaf(loaf, slice_width)
  side1 = join_ingredients(bread1, peanut_butter)
  side2 = join_ingredients(bread2, jelly)
  join_ingredients(side1, side2)
end

make_pbj_sandwich(demo_loaf, "crunchy monkey brand peanut butter", "Belgian forest-berry", 2)

#=> You join slice of light rye and crunchy monkey brand peanut butter
#=> You join slice of light rye and Belgian forest-berry
#=> You join crunchy monkey brand peanut butter on slice of light rye with Belgian forest-berry on slice of light rye
```

Test out this new code in a test program or in IRB.

## Stretch (Optional): How a Professional Would Write This

Most professional programmers think like chefs: prepare the ingredients before
you do the work. In this case, we start the work, `make_pbj_sandwich` and, in
its first step, prepare the ingredient of the bread loaf. A professional
implementation would probably build on this insight and look something like
following. If you see a technique that you're unfamiliar with, try it out in
IRB!

```ruby
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

make_pbj_sandwich(*get_two_slices_from_loaf(demo_loaf, 2),
  "Poodle Byron's Peanut Butter", "Pappy Burgess' Grape Jelly")
```

## Final Tips

* Methods should perform one task only
* Most methods should be about 5-8 lines
* Methods should have meaningful names
* Methods' parameters should have meaningful names **or** the method should be
  so short and "general purpose" that simple names are appropriate
* Donald Knuth said: "Premature optimization is the root of all evil." There's
  no shame in writing very specific or repetitive code while you're getting it
  to work. Once you have the code working and know how to test it to make sure
  you haven't broken it, _then_ look for opportunities to DRY out the code. Don't
  try to "think DRY" _as you code_. Do a second pass. With version control in
  place, you can feel safe to try and throw away, if necessary.

## Conclusion

In this lesson we've covered one of the most powerful tools a programmer has
for battling confusing code: the subroutine. It can be used to hide away
complex calculations or work and can help you store behavior that you'll repeat
multiple times. As you start in your programming career, use subroutines to
keep you thinking clear and your code simple. It will pay dividends again and
again.

## Resources

- Flatiron Process reference
