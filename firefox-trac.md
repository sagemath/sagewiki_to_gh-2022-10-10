= Firefox and Trac =

== Search Plugins ==

Like all browsers, Firefox has a "search" box (usually to the right of the address bar) that one can use to search on specific search engines without first loading them. It's also quite straightforward to add custom search plugins. Last night, I made two such plugin files:

 * [[attachment:trac.xml]]
 * [[attachment:speed-trac.xml]]

The first one takes a phrase to search for, and searches on trac for it. The second one is more useful -- given a number, it goes '''directly''' to the corresponding trac ticket. (If you enter something that doesn't exist, it will instead search for a hash symbol followed by your search query.)

You can copy the following bits of text into your browser address bar to have Firefox automatically download and install the search plugins:

 * `javascript:window.external.AddSearchProvider("https://wiki.sagemath.org/firefox-trac?action=AttachFile&do=get&target=trac.xml")`
 * `javascript:window.external.AddSearchProvider("https://wiki.sagemath.org/firefox-trac?action=AttachFile&do=get&target=speed-trac.xml")`

Or, if you want to download the plugins and install manually, see below for directions.

These are easy to use: Firefox maintains a directory of search plugins. They're located here:

 * `/Applications/Firefox.app/Contents/MacOS/searchplugins` (Mac)

Here `/Applications/Firefox.app` should be replaced by the path to your Firefox app. In Linux, you can place the XML files in the searchplugins/ directory in your Firefox profile directory; for example, Mike put his in /home/mike/.mozilla/firefox/thvmoys3.default/searchplugins/ and it worked correctly.

So now, once those two files are in place, you simply restart Firefox. Two new searches will be available (with Sage favicons!). You can simply use them as normal from the upper right corner, but that's not too exciting. Much more exciting: in Firefox 3 at least, you can bind a key shortcut to each of them. (I use `t` for speed-trac and `trac` for trac.) Once you do this, typing `t 1000` in the address bar will immediately take you to trac ticket #1000, and typing `trac notebook` will search for notebook on trac.

Enjoy.
