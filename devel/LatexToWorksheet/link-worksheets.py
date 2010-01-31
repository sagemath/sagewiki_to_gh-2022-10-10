#! /usr/bin/env sage

import sys
import subprocess
import re
from sagenb.notebook.notebook import Notebook

zero=r"""
Content of Worksheet Zero

{{{
2+3
///
57
}}}

<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam a nibh turpis. Suspendisse potenti. Vivamus a tellus dolor, in consequat risus. Integer non leo libero, vel lobortis dolor. Duis vel urna quis ante tincidunt ultrices sit amet vel felis. Etiam tristique mattis adipiscing. Proin sed nibh metus, non pellentesque tortor. Suspendisse turpis risus, tincidunt id aliquet sed, luctus a erat. Donec volutpat massa ut ante posuere sit amet molestie justo accumsan. Phasellus aliquet nibh purus. Proin eu tristique tellus. Sed libero ligula, euismod nec vehicula eget, gravida eget nulla. Nullam hendrerit mollis malesuada. Donec tincidunt ullamcorper ornare. Aliquam eu adipiscing erat.</p>

{{{
factor(2010)
///
}}}

<p>Quisque bibendum dui eget elit facilisis accumsan. Sed eget augue vel magna iaculis varius id gravida magna. Curabitur elementum commodo odio vel vestibulum. Quisque pulvinar posuere accumsan. Sed blandit dapibus dolor ultricies gravida. Maecenas sed mi sapien, in laoreet quam. Proin luctus nunc quis nulla viverra ut rhoncus velit varius. Nulla eu blandit diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi sed orci at odio iaculis sodales quis sit amet dolor. Praesent vel enim eu nibh molestie vulputate quis id elit. Fusce orci tellus, dapibus quis iaculis et, rutrum non mauris. Phasellus sed nibh odio, nec molestie orci. Etiam adipiscing, velit nec dictum pellentesque, felis massa ullamcorper elit, sed adipiscing nulla libero id ipsum. Maecenas auctor ante sit amet mauris fermentum sed eleifend arcu volutpat.</p>

<p>A spurious <a href="../1#landing">link</a> to a certain paragraph in the other worksheet (Worksheet 1).</p>

<p>Sed erat erat, hendrerit sed tincidunt et, malesuada ac diam. Sed sed nibh erat. Maecenas sed sapien neque. Mauris metus lorem, hendrerit et vehicula quis, eleifend in quam. Sed dapibus venenatis mi a lobortis. Curabitur consectetur lacinia turpis, ut posuere urna pulvinar dapibus. In hac habitasse platea dictumst. Vestibulum orci libero, congue vel mattis eu, pulvinar sit amet massa. Integer fermentum fringilla sollicitudin. Quisque posuere dapibus risus, sit amet faucibus dolor faucibus ut. Aliquam fermentum massa non risus viverra fermentum. Cras scelerisque lacinia magna, ac scelerisque turpis tristique id. Suspendisse potenti. Ut accumsan tortor eu orci vehicula vitae malesuada ipsum ultricies. Nulla vehicula leo quis augue scelerisque ut semper risus varius. Praesent suscipit fermentum convallis.</p>

Praesent venenatis nisi at eros faucibus commodo. Ut tincidunt fringilla congue. Curabitur blandit consequat magna ut facilisis. Fusce sollicitudin leo vitae elit aliquam rhoncus. Aenean fermentum adipiscing felis, at lacinia metus sodales vitae. Vivamus sed neque lacus, sed feugiat tellus. Nulla dui magna, porttitor sed tincidunt ac, molestie luctus arcu. In vitae ligula erat, eget tincidunt augue. Phasellus sit amet ante id tortor commodo lacinia eget vitae justo. Donec feugiat velit id quam pulvinar ut euismod lacus ullamcorper. Sed interdum rutrum arcu, a vehicula velit mollis quis. Aliquam porta elit quam. Vivamus massa ante, consequat vitae commodo eget, posuere imperdiet augue. Quisque neque mi, rutrum at tempus et, posuere quis tortor.

Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus at purus nec mi fermentum convallis. Praesent in nisl quis justo commodo ultrices. Vivamus eu urna non turpis eleifend gravida. Proin sit amet felis turpis, in suscipit felis. Donec ante sapien, consectetur sed posuere sit amet, bibendum et lorem. Vivamus mattis hendrerit vulputate. Vivamus sodales ipsum at neque suscipit eget malesuada sapien vehicula. Fusce nec convallis nibh. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec porttitor elit fermentum justo ornare placerat. Fusce sapien tortor, tristique non tincidunt eget, tempus quis magna. Mauris imperdiet nisi a mi mattis nec semper dolor rhoncus. Curabitur vel sapien lacus.
"""

one = """
Content of Worksheet One

{{{
2+3
///
195
}}}

<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam a nibh turpis. Suspendisse potenti. Vivamus a tellus dolor, in consequat risus. Integer non leo libero, vel lobortis dolor. Duis vel urna quis ante tincidunt ultrices sit amet vel felis. Etiam tristique mattis adipiscing. Proin sed nibh metus, non pellentesque tortor. Suspendisse turpis risus, tincidunt id aliquet sed, luctus a erat. Donec volutpat massa ut ante posuere sit amet molestie justo accumsan. Phasellus aliquet nibh purus. Proin eu tristique tellus. Sed libero ligula, euismod nec vehicula eget, gravida eget nulla. Nullam hendrerit mollis malesuada. Donec tincidunt ullamcorper ornare. Aliquam eu adipiscing erat.</p>

{{{
factor(2010)
///
}}}

<p>Sed erat erat, hendrerit sed tincidunt et, malesuada ac diam. Sed sed nibh erat. Maecenas sed sapien neque. Mauris metus lorem, hendrerit et vehicula quis, eleifend in quam. Sed dapibus venenatis mi a lobortis. Curabitur consectetur lacinia turpis, ut posuere urna pulvinar dapibus. In hac habitasse platea dictumst. Vestibulum orci libero, congue vel mattis eu, pulvinar sit amet massa. Integer fermentum fringilla sollicitudin. Quisque posuere dapibus risus, sit amet faucibus dolor faucibus ut. Aliquam fermentum massa non risus viverra fermentum. Cras scelerisque lacinia magna, ac scelerisque turpis tristique id. Suspendisse potenti. Ut accumsan tortor eu orci vehicula vitae malesuada ipsum ultricies. Nulla vehicula leo quis augue scelerisque ut semper risus varius. Praesent suscipit fermentum convallis.</p>

<p><a name="landing"></a>This is the landing site for the link from worksheet 0.  Praesent venenatis nisi at eros faucibus commodo. Ut tincidunt fringilla congue. Curabitur blandit consequat magna ut facilisis. Fusce sollicitudin leo vitae elit aliquam rhoncus. Aenean fermentum adipiscing felis, at lacinia metus sodales vitae. Vivamus sed neque lacus, sed feugiat tellus. Nulla dui magna, porttitor sed tincidunt ac, molestie luctus arcu. In vitae ligula erat, eget tincidunt augue. Phasellus sit amet ante id tortor commodo lacinia eget vitae justo. Donec feugiat velit id quam pulvinar ut euismod lacus ullamcorper. Sed interdum rutrum arcu, a vehicula velit mollis quis. Aliquam porta elit quam. Vivamus massa ante, consequat vitae commodo eget, posuere imperdiet augue. Quisque neque mi, rutrum at tempus et, posuere quis tortor.</p>

<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus at purus nec mi fermentum convallis. Praesent in nisl quis justo commodo ultrices. Vivamus eu urna non turpis eleifend gravida. Proin sit amet felis turpis, in suscipit felis. Donec ante sapien, consectetur sed posuere sit amet, bibendum et lorem. Vivamus mattis hendrerit vulputate. Vivamus sodales ipsum at neque suscipit eget malesuada sapien vehicula. Fusce nec convallis nibh. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec porttitor elit fermentum justo ornare placerat. Fusce sapien tortor, tristique non tincidunt eget, tempus quis magna. Mauris imperdiet nisi a mi mattis nec semper dolor rhoncus. Curabitur vel sapien lacus.</p>
"""

# A notebook with two worksheeets (0, 1) owned by "link"
nb=Notebook("./temp.sagenb")
nb.add_user('link', 'linko', 'nobody@example.com', force=True)
W0 = nb.create_new_worksheet('Zero', 'link')
W1 = nb.create_new_worksheet('One',  'link')
W0.edit_save(zero)
W1.edit_save(one)
#nb.export_worksheet(W.filename(), swsfilename)
#nb.delete()
nb.save()

# A really temporary, nearly empty notebook
# Just the same user as before (but different credentials)
nbtemp=Notebook("/tmp/junky.sagenb")
nbtemp.add_user('link', 'tempo', 'anybody@nowhere.com', force=True)
nbtemp.save()

# Copy the ./temp.sagenb/home/link subdirectory
# into /tmp/junky.sagenb/home subdirectory
# essentially re-creating the worksheet collection
# for user  link  into another notebook.
# For testing, then fire-up command-line Sage
# and execute
#    notebook(directory='/tmp/junky.sagenb')
# If you are into the notebook as user "admin" then logout
# and login as "link", with password "tempo"
# and you should see link's two worksheets
# (on first use you will need to creat an admin password)