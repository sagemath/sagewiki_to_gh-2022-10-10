== Daily progress report on Project 4 ==

=== Thursday 24 June ===


Rado and Jeremy found a paper by Petho giving an algorithm for listing number field elements by height and implemented it.  It does not seem very efficient (the vast majority of the elements it lists have height greater than the bound!)  So they are continuing to implement the other strategy we started on earlier in the week.  They have already implemented an iterator over ideals of bounded norm.  The next stage involves units.  We found out (by asking Karim Belabas, the lead pari developer) that the fundamental units (as computed by pari) are LLL-reduced, which will help.  
