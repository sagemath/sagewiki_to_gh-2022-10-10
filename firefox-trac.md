= Firefox and Trac =

== Search Plugins ==

Like all browsers, Firefox has a "search" box (usually to the right of the address bar) that one can use to search on specific search engines without first loading them. It's also quite straightforward to add custom search plugins. Last night, I made two such plugin files:

 * [[attachment:trac.xml]]
 * [[attachment:speed-trac.xml]]

The first one takes a phrase to search for, and searches on trac for it. The second one is more useful -- given a number, it goes '''directly''' to the corresponding trac ticket. (If you enter something that doesn't exist, it will instead search for a hash symbol followed by your search query.)

These are easy to use: Firefox maintains a directory of search plugins. On a Mac, it's located in: 
 * `/Applications/Firefox.app/Contents/MacOS/searchplugins` 

Here `/Applications/Firefox.app` should be replaced by the path to your Firefox app. I don't have another machine handy to find out where the directory is on Linux -- but here's the developer page about the feature, which would probably tell me if I were willing to read it:

 * [[https://developer.mozilla.org/en/Creating_OpenSearch_plugins_for_Firefox|Firefox Search Plugins]]

If someone wants to find it there, and post the path here, everyone would probably appreciate it.

So now, once those two files are in place, you simply restart Firefox. Two new 
