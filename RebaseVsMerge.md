
This page describes a hypothetical situation that could arise with the sage git workflow, as discussed on <a href="/TentativeConventions">TentativeConventions</a> and at <a href="/days54">Sage Days 54</a>. 


# Why can rebasing cause problems?

Consider the following scenario, and the accompanying ascii art diagrams: 

* Sage development happens, and the `origin/master` branch gets to a certain commit `M`. 

```txt
---K---L---M  <-(origin/master)
```
* Developer Alice comes along and decides to work on a new feature, say `aardvarks`, starting from the current official `origin/master` branch. 

```txt
---K---L---M  <-(origin/master)
            \
             --A---B---C  <-(aardvarks)
```
* Developer Bob sees that the `aardvarks` feature looks nice, and starts work on a new feature, say `bowling`, which depends on `aardvarks`. 

```txt
---K---L---M  <-(origin/master)
            \
             --A---B---C  <-(aardvarks)
                        \
                         --X---Y---Z  <-(bowling)
```
* Sage development continues, and some other features are merged meanwhile into `origin/master`. 

```txt
---K---L---M---P---Q---R---S---T  <-(origin/master)
            \
             --A---B---C  <-(aardvarks)
                        \
                         --X---Y---Z  <-(bowling)
```
* Alice doesn't know about Bob's `bowling` feature, and thinks (correctly or not) that it would be better if the `aardvarks` feature was based on the latest official `origin/master`, that is commit `T`, instead of commit `M`. Instead of merging commit `T` into the `aardvarks` branch, Alice does a rebase. This creates a new history `A2--B2--C2` based at `T` instead of the original `A---B---C` based at `M`. 

```txt
---K---L---M---P---Q---R---S---T  <-(origin/master)
            \                   \
             \                   --A2--B2--C2  <-(aardvarks)
              \
               A---B---C
                        \
                         --X---Y---Z  <-(bowling)
```
* The `aardvarks` feature is ready and has a positive review, so it is merged into the official `origin/master`. 

```txt
---K---L---M---P---Q---R---S---T----------------U  <-(origin/master)
            \                   \              /
             \                   --A2--B2--C2--  <-(aardvarks)
              \
               A---B---C
                        \
                         --X---Y---Z  <-(bowling)
```
* The `bowling` feature is ready and has a positive review, so it is merged into the official `origin/master`. However, at this point the commits `A---B---C` create a merge conflict with the seemingly identical commits `A2--B2--C2`. They are only seemingly identical, because they don't appear at the same location in the git tree (they have different parents). However, of course they touch the same code files, and in the same regions too. 

```txt
---K---L---M---P---Q---R---S---T----------------U---*  <-(origin/master)
            \                   \              /   /
             \                   --A2--B2--C2--   /    <-(aardvarks)
              \                                  /
               A---B---C                        /
                        \                      /
                         --X---Y---Z-----------  <-(bowling)
```
Now, there is a problem, because the `bowling` code does not merge cleanly into the official `origin/master` branch. Regardless of who is right or wrong, this needs to be fixed before the positively reviewed `bowling` branch can be merged into `origin/master`. The question here is: whose responsibility is it to fix the problem? 

* If the commits `A---B---C` in the `aardvarks` branch were marked as belonging to Alice only, then Bob could foresee the possibility that Alice messes with these commits (in the example, by rebasing them), so Bob should be responsible for fixing the mess created by basing his work on someone else's unstable work-in-progress. 
* If the commits `A---B---C` were marked as belonging to the whole community, then Alice could foresee that other may use the code (even if she doesn't see it on Trac yet), so Alice should be responsible for fixing the mess created by changing what the community saw as stable (even if it was pre-review) history of code on the server. 
So, the central question is, when does the `aardvarks` branch change from belonging to Alice only, to belonging to the whole community? 


# What happens with merging instead of rebasing?

Here is what would happen in the scenario above if Alice merged instead of rebasing: 

* The story is the same until Sage development gets to the commit `T`. 

```txt
---K---L---M---P---Q---R---S---T  <-(origin/master)
            \
             --A---B---C  <-(aardvarks)
                        \
                         --X---Y---Z  <-(bowling)
```
* Alice doesn't know about Bob's `bowling` feature, but still wants `aardvarks` to incorporate the latest official `origin/master`, that is commit `T`, instead of commit `M`. Alice merges `T` into the `aardvarks` branch. 

```txt
---K---L---M---P---Q---R---S---T  <-(origin/master)
            \                   \
             --A---B---C---------D  <-(aardvarks)
                        \
                         --X---Y---Z  <-(bowling)
```
* The `aardvarks` feature is ready and has a positive review, so it is merged into the official `origin/master`. Any merge conflicts were resolved in the commit `D`, so this is a clean merge. 

```txt
---K---L---M---P---Q---R---S---T---U  <-(origin/master)
            \                   \ /
             --A---B---C---------D  <-(aardvarks)
                        \
                         --X---Y---Z  <-(bowling)
```
* The `bowling` feature is ready and has a positive review, so it is merged into the official `origin/master`. At this point, the commits `A---B---C` are in the common history of `U` and `Z`, so there is no conflict there. If `X---Y---Z` and `D` do not introduce a further conflict, the merge into `V` is a clean merge. 

```txt
---K---L---M---P---Q---R---S---T---U---V  <-(origin/master)
            \                   \ /   /
             --A---B---C---------D   /    <-(aardvarks)
                        \           /
                         --X---Y---Z  <-(bowling)
```