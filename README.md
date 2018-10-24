# Breaking Down Large Problems with Subroutines

## Learning Goals

- Identify techniques for breaking down large problems

## Introduction

### Identify Techniques for Breaking Down Large Problems

_I feel like we could do a series of X not Y examples for these topics_

* Follow the Flatiron Process!
* Methods are single purpose
  * IF you see that several specific purposes methods can be solved in a more general way, _bubble-up from specifics_ (it's less error prone
* Methods names should be clear as to function
* Inputs should be meaningfully named as to purpose or type
  * An antipattern i've seen is `array_of_cats` or `hash_of_student grades`. Can we distance that pattern on this note like: while it's certainly tempting to do ^^, simple friendly English naming is usually sufficient. `cats` implies "an Array of cats" for most programmers and a `gradebook` would probably imply a hash. **Stretch** For anything that has more complexity, it's probably wise to create a new class
* Return value should line up with promise implied by method name.
  * This usually helps us make sure we named our method names well (per step (up there number)). If the method "awesome_dogs" doesn't return a Hash or an Array I'm going to feel like I was lied to as a developer. 
* Implementation should be as terse as possible without appearing magical
* If the method is too long, insert a helper method to pre-filter the input
  * Example: pass in `dogs` and then filter it (complexly) and then do something with the filtered list. 
  * Change impl. so that `good_dogs` are _passed in_ so that the method rewards good_dogs, not filters dogs to good dogs and then rewards them.
* Apply the Flatiron process recursively

## Conclusion


## Resources

- Flatiron Process reference
