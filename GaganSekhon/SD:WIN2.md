<<TableOfContents>>


= Color2 =


A simple macro to create colored text. One can optionally also set background color and font.

'''Note:''' [[MacroMarket/span]] is a somewhat related, more powerful macro, but if one needs only colored text, this macro is much simpler to use.

 * '''Python versions''' - 2.5+
 * '''Moin versions''' - 1.5, 1.6, 1.9
 * '''Copyright''' - ClifKussmaul, DaveHein, GregorMirai
 * '''License''' - [[GPL|GNU GPL]] version 2
 * '''Download''' - [[attachment:Color2-1.9.3-1.py|Latest version 2011.2.23 - 1.9.3-1]]

== Download & Release Notes ==

'''Note''': should be installed as Color2.py

||<rowbgcolor="#CCCCCC" width="18%" tablewidth="80%"> '''Download''' ||<width="18%"> '''Release Version''' ||<width="18%"> '''Moin Version''' || '''Release Notes''' ||
|| [[attachment:Color2-1.9.3-1.py]] || 1.9.3-1 || 1.9.3-1 || Added "MiniPage" support on text parameter. ||
|| [[attachment:Color2-1.9.3.py]]   || 1.9.3   || 1.9.3   || Tested on 1.9.3 version of MoinMoin ||
|| [[attachment:Color2-1.6.py]]     || 1.6     || 1.7     || Tested on 1.7.1 version of MoinMoin ||
|| [[attachment:Color2-1.6.py]]     || 1.6     || 1.6     || ||
|| [[attachment:Color2.py]]         ||         || 1.5     || ||

== Usage ==

{{{
<<Color2(text,col=text_color,bcol=background_color,font=font_name)>>
}}}

||<rowbgcolor="#CCCCCC" width="12%" tablewidth="80%"> '''Name''' ||<width="75%"> '''Description''' || '''Default value''' ||
|| `text` || The text to be colored. || `None` ||
|| `col`  || Text color. Color names and codes can be found at [[http://www.w3schools.com/Html/html_colornames.asp|w3schools]]. || `None` ||
|| `bcol` || Background text color. Color names and codes can be found at [[http://www.w3schools.com/Html/html_colornames.asp|w3schools]].  || `None` ||
|| `font` || Font name. It is safe to choose one of the following fonts: arial, arial black, comic sans ms, courier, courier new, georgia, helvetica, impact, palatino, times new roman, trebuchet ms, verdana. || `None` ||

== Example ==

=== Tested in MoinMoin 1.9.3 (2011.02.23) ===

Colored text (syntax as of MoinMoin 1.9.3):

Example, in normal text:

{{{
<<Color2(red courier on blue,col=red,bcol=blue,font=courier)>>

<<Color2(Green Font on Yellow Background,green,yellow)>>

<<Color2(Orange Text,orange)>>

<<Color2("Text with commas:one,two,three",red)>>

<<Color2("Optional parameters",bcol=yellow)>>
}}}

=== Tested in MoinMoin 1.8.2 (2009.03.12) ===

Colored text (syntax as of MoinMoin 1.7.1):

In normal text

{{{
<<Color2(color,bgcolor,font,text)>>
<<Color2(color,bgcolor,text)>>
<<Color2(color,text)>>
}}}

Example, in normal text:

{{{
<<Color2(red,blue,courier,red courier on blue)>>

<<Color2(green,yellow,Green Font on Yellow Background)>>

<<Color2(orange,Orange Text)>>
}}}

Result (somehow, courier does not work? example from "Description" above):

{{attachment:Color2_Example.png|Example Normal Text}}

Also works within tables:

{{{
||<<Color2(red,blue,courier,red courier on blue)>><<BR>><<Color2(green,yellow,Green Font on Yellow Background)>><<BR>><<Color2(orange,Orange Text)>>||
}}}
{{{
||<style="background-color: #CCFFFF;"> <!> '''Notice!'''<<BR>>The allocation of IP addresses for the abc interfaces on the host start with 10.10.<<Color2(red,1)>>.<<Color2(red,1)>> --> (abc server .<<Color2(red,rack 1, rack position 1)>>). ||
}}}
{{attachment:Color2_ExampleTables.png|Example Tables}}


= Bugs =


This macro should be refactored
 a. use of arg parser for macros ('''DONE''' - default parameter parsing for macros in 1.9.X)
 a. use of wikiutil.renderText() ('''DONE''')
 a. /!\ user input needs to be escaped XSS problems ('''DONE''' - uses formatter.escapedText(text))


= Discussion =


 * If there is no syntax given by the autors, you might find some information in the .py file itself. ('''DONE''' - usage described)
 * When using super or subscript modifiers Color2 does not work -- PeterGurk
 * This macro does not give an easy way to color text that has commas in it. -- JohnJHarrison ('''DONE''' - result of default par. parsing in 1.9.X)
  It seems that this macro also supports colon (:) as a delimiter, which could be a workaround for the comma (,) issue. Nonetheless, since both (,) and (:) are frequently used in normal texts, how about allowing it use a bar (|) rather than comma (,)? Example: [[attachment:Color2_bar.py]]. -- TakeoKatsuki <<DateTime(2009-08-08T10:58:56+0900)>>{{{
<<Color2(black|yellow|For example, color2 will work fine with commas and colons like this: black, yellow, and green.)>>
}}}
  {{attachment:Color2_bar_example.png}}

   It should also work if the text is entered quoted. comma is the delimiter for arguments if the argumentparser is involved.
   `<<Color2(black,yellow,"For example, color2 will work fine with commas and colons like this: black, yellow, and green.")>>`  so it makes sense for one using this macro to refactor it to use the argument parser and while doing this also to fix the XSS problem.
    Currently it doesn't work with quote, right?  
     Yes, because it is not using the argument parser. Besides looking into the moin macros e.g. [[http://hg.moinmo.in/moin/1.8/file/a6b0b1fcd463/MoinMoin/macro/EmbedObject.py|EmbedObject.py]] a simple example is given at [[http://moinmo.in/MacroMarket/HelloWorld-1.7|HelloWorld-1.7]] ([[http://moinmo.in/MoinAPI/Beispiele#macro|macro examples]]).

 * When using with MoinMoin 1.8.2 the macro seems to add a line break after the coloured text in the preview pane. The page is displayed correctly though. -- SamRoy
 * I've tested this "break line" with 1.6 and 1.7, and the reason is somewhere in formattext procedure.  -- KrisR
 * Anyone tested the Color2 macro on 1.9.3?  Thanks. -- lanepierce ('''DONE''')
