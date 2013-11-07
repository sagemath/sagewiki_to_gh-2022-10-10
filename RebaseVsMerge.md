== What happens with merging instead of rebasing? ==

As an aside, here is what would happen in the scenario above if Alice merged instead of rebasing:

 1. The story is the same until Sage development gets to the commit `T`.
{{{
---K---L---M---P---Q---R---S---T  <-(origin/master)
            \
             --A---B---C  <-(aardvarks)
                        \
                         --X---Y---Z  <-(bowling)
}}}
 1. Alice doesn't know about Bob's `bowling` feature, but still wants `aardvarks` to incorporate the latest official `origin/master`, that is commit `T`, instead of commit `M`. Alice merges `T` into the `aardvarks` branch.
{{{
---K---L---M---P---Q---R---S---T  <-(origin/master)
            \                   \
             --A---B---C---------D  <-(aardvarks)
                        \
                         --X---Y---Z  <-(bowling)
}}}
 1. The `aardvarks` feature is ready and has a positive review, so it is merged into the official `origin/master`. Any merge conflicts were resolved in the commit `D`, so this is a clean merge.
{{{
---K---L---M---P---Q---R---S---T---U  <-(origin/master)
            \                   \ /
             --A---B---C---------D  <-(aardvarks)
                        \
                         --X---Y---Z  <-(bowling)
}}}
 1. The `bowling` feature is ready and has a positive review, so it is merged into the official `origin/master`. At this point, the commits `A---B---C` are in the common history of `U` and `Z`, so there is no conflict there. If `X---Y---Z` and `D` do not introduce a further conflict, the merge into `V` is a clean merge.
{{{
---K---L---M---P---Q---R---S---T---U---V  <-(origin/master)
            \                   \ /   /
             --A---B---C---------D   /    <-(aardvarks)
                        \           /
                         --X---Y---Z  <-(bowling)
}}}
