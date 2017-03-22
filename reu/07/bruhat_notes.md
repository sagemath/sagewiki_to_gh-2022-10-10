Notes that Tom took during meeting with Sara on Friday:

{{{
list of isomorphism classes of subintervals
hasse diagram partial interval
k-crowns: ranked degree sequences (and up vs. down)

Ekedahl (Ekedahl structure interval)
Kazhdan - Lusztig polynomial



Questions:
  when is [id,v] ~ [id,w] ?
     completely determined by heights & degrees?

  count # interval isomorphism classes
     1) [id,w]
     2) all

Pattern avoidance:

  (general idea)
  for n = 1,2,3...
      for all w \in Sn
          if (has_property(w) == avoids_pattern(w)):
              'good'
          else
              print has_property(w), avoids_patterns(w)
              add w to known patterns

  (specific examples)
  Smoothness:
      w is a smooth permutation iff #{Tij <= w} = h(w)  (i < j)
      3412 or 4231 avoiding

  Fully commutative perms: w avoids 321

}}}
