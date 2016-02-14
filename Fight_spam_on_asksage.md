Most spam (currently all) is blocked automatically, thanks to the firewall (iptables) blocking IP sets provided by stopforumspam.

However, it is possible that spam could enter the website again, in which case, it must be removed by hand.  If you feel you can help to fight spam, please ask for an admin account.

Here are measures to remove spam, in increasing order.

== isolated spam message ==
 * go to the message, click on "close" or "delete" if someone already closed it.
 * a discussion started on the policy about this (should we remove it direclty and block the user, should we let another chance), since some message are not clearly spams, look at the archives of sage-askbot-admin mailing-list.

== bunch of spams from the same user (remove) ==
 * click on the user's nickname (bottom right of the question)
 * click on "moderation" (top right)
 * click on "block user and delete all content"

== bunch of spams with a similar pattern (prevent) ==
 * go to http://ask.sagemath.org/settings/MODERATION/
 * add the typical keywords appearing in the spams on the "Reject all posts with these phrases" field.

== overloaded, need to stop the flood ==
 * go to http://ask.sagemath.org/settings/ACCESS_CONTROL/
 * select "Make site read-only"
 * We should find a way to temporary block user registration, so that registered users can still interact.
