# Breaking Down Large Problems with Subroutines

## Learning Goals

- Identify techniques for breaking down large problems: hide work in
  subroutines
- Identify techniques for breaking down large problems: DRY, prefer subroutines

## Introduction

Good code is both:

1. Easy to read and
2. Correct

When code is _easy to read_, we can quickly isolate problems as well as reason
about previous programmers' intentions. When code is _correct_, it performs the
work we need.  But needs from code grow, code becomes less easy to read,
change, and maintain.

An essential technique for dealing with the growing complexity that threatens
to overwhelm us is **_the subroutine_**. This one little humble idea has been
essential for putting mankind on the moon and sequencing the human genome.

## Subroutine Defined

_Subroutines_ are procedures called by a procedure.

These "child" procedures help the "parent" procedure do some sub-component
work.  Subroutines hide work that makes the "parent" code hard to read.  They
also give repeated tasks a unique name so that we can refer to a complex
process by a single, simple name (`make_pbj_sandwich` hides a lot of
complexity!). Naming bits of code that we would otherwise repeat if we were to
write it out again and again is called the "DRY" principle: Do Not Repeat
yourself.

We'll explore how subroutines help us in _both_ pseudocode _and_ code by trying
to solve that persistent human problem: "I am hungry."
