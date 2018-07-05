<<TableOfContents>>

== The Sage Patchbot ==

The patchbot pulls and applies git branches from Trac and can be found at https://patchbot.sagemath.org or from links on the individual Trac tickets (round icons at top right). 

You can help by running your own patchbot. See below for instructions about installation and usage.

See a list of patchbot names and their owners at [[patchbot/owners]].

This is still very much a work in progress. The latest version of the code lives at http://github.com/sagemath/sage-patchbot.

== Lists of reports ==

You can see the status of several tickets at the same time (replace xxxx by your user name) : 

For the tickets you participated in, see https://patchbot.sagemath.org/ticket/?base=develop&participant=xxxx

For the tickets you authored, see https://patchbot.sagemath.org/ticket/?base=develop&author=xxxx

=== Ticket Status ===

The color of the report page icon indicates the status of the ticket. See the report page itself for more details. The possible statuses are:

{{https://patchbot.sagemath.org/svg/New||width=48}} '''New'''

{{https://patchbot.sagemath.org/svg/Pending||width=48}} '''Pending''' A patchbot is currently running on this ticket. The patchbot may have stopped if the ticket was deemed unsafe.

{{https://patchbot.sagemath.org/svg/TestsPassed||width=48}} '''!TestsPassed''' Everything is okay, as far as a patchbot can tell.

{{https://patchbot.sagemath.org/svg/TestsPassedOnRetry||width=48}} '''!TestsPassedOnRetry''' Everything is okay, but only after several tentatives.

{{https://patchbot.sagemath.org/svg/ApplyFailed||width=48}} '''!ApplyFailed''' The branch could not be applied. This can be caused by conflicts with other branches or dependencies. Try rebase your branch on the latest develop branch.

{{https://patchbot.sagemath.org/svg/BuildFailed||width=48}} '''!BuildFailed''' The branch can be applied, but sage failed to build, due to errors in the code. Check the code.

{{https://patchbot.sagemath.org/svg/TestsFailed||width=48}} '''!TestsFailed''' One or more tests did not succeed.

{{https://patchbot.sagemath.org/svg/PluginFailed||width=48}} '''!PluginFailed''' Tests have been successfully done, but plugins have found some problems.

{{https://patchbot.sagemath.org/svg/PluginOnlyFailed||width=48}} '''!PluginOnlyFailed''' Plugin have found some problems. Tests have not been made.

{{https://patchbot.sagemath.org/svg/PluginOnly||width=48}} '''!PluginOnly''' Plugins have found no problem. Tests have not been made.

{{https://patchbot.sagemath.org/svg/NoPatch||width=48}} '''!NoPatch''' No branch has been uploaded to Trac so far. The patchbot has nothing to do.

{{https://patchbot.sagemath.org/svg/Spkg||width=48}} '''Spkg''' This is related to an spkg. The patchbot will only check the spkg installation.

=== Hints and tricks ===

 * To rerun tests (even though the branch was not modified) add the kick parameter, e.g., http://patchbot.sagemath.org/ticket/12345/?kick
== Installing the patchbot ==

It is safer to run the patchbot in an unused sage install.

||<style="width: 99%; text-align: center;background-color: #FFCCCC;">WARNING: Install mode has changed a lot with patchbot ≥ 2.6.0||

These are the new instructions.

||<#FFFF66>① Install the patchbot using '''pip install --user git+https://github.com/sagemath/sage-patchbot.git'''||

Dependencies: shell commands '''git'''; '''tar'''; '''wget'''

'''pyflakes''' is not required but will be used if installed.

||<#98FF98> Please register [[patchbot/owners|here]] if you run a patchbot. It is required to know whom to contact.||

You can instead use the --owner option.

== Installing optional packages ==

You are allowed and in fact even encouraged to install optional packages in sage before running the patchbot. When doing so, please keep in mind that certain optional packages require things outside of sage to be installed. 
The following list of commands is handy if one wants to install ''all'' optional packages.

{{{
sage -pip install service_identity
apt-get install graphviz pandoc build-essential libxml2 libxml2-dev
}}}

== Running the patchbot ==

Before running the patchbot make sure that the following two commands produce no errors when executed in the root of the sage installation you want to run the patchbot with.

{{{
    make
    ./sage -t --all --long
}}}

||<#FFFF66>② Run the patchbot using '''python -m sage_patchbot.patchbot --sage-root=XXXX'''||

The patchbot should now run just the same with '''pip3''' and '''python3''' instead. Please report any problem.

The '''--sage-root''' parameter is required.

Your patchbot will run forever, as long as it finds a ticket to work on.

You can let the patchbot choose the tickets it will run on.

You can run a specific ticket by using '''--ticket=N''' where N is a ticket number such as 12345 (or a sequence such as 12345,23456)

Several other options are available, see '''--help'''

'''--skip-base''' will skip the check that the base sage installation is sane. Please do not use when running on many tickets.

'''--plugin-only''' will only build (sage and the doc) and run the plugins but not the tests (much quicker but less useful).

'''--safe-only''' will only test branches that only change files inside the directory "src/sage" (this is the case by default).

'''--skip-doc-clean''' the "make doc-clean" is not run during the patchbot initialization. Useful if your machine does not have enough ram to build the documentation in a single round.

If the patchbot process receives the signal SIGUSR1 (using {{{kill -s SIGUSR1 pid}}}), it will gracefully stop after finishing its job on the ticket it is currently working on.

== Configuration ==

By default, the patchbot should run without needing to tune its configuration. You can use a specific configuration file in the json format and run the patchbot with the option
{{{
--config=fullpath/config_file.json
}}}
The json format mostly looks like a python dictionary. Here is an example of a valid configuration file
{{{
    {"bonus": {"niceguy": 200, "needs_work": -20},
     "use_ccache": false,
     "safe_only": true,
     "skip_base": true,
     "time_of_day": "22-7",
     "parallelism": 8
    }
}}}
Note that the booleans must be written with no capital first letter.

The config will be read again between every run, hence it allows live configuration of the patchbot.

The list of configurable entities are:

|| option                    || type            || default       || description                                                                       ||
|| ''time_of_day''           || string          || "0-0"         || (example "0-0" or "22-7") an interval of time during which the patchbot is active ||
|| ''bonus''                 || dictionary      || ''see below'' || some bonus to influence the order in which tickets are tested (see below)         ||
|| ''safe_only''             || boolean         || true          || whether to only test "safe" tickets modifying only src/sage or src/doc            ||
|| ''skip_base''             || boolean         || false         || whether to run testlong on the base before testing tickets                        ||
|| ''parallelism''           || integer         || 3             || the number of threads to execute when compiling or testing                         ||
|| ''idle''                  || integer         || 300           || seconds to wait when network is not working or there are no tickets available     ||
|| ''timeout''               || integer         || 10800         ||                                                                                   ||
|| ''base_branch''           || string          || develop       || the name of the git branch to synchronized with the develop branch on trac        ||
|| ''sage_root''           || string          ||        || the path to the directory containing the sage installation ||
|| ''plugins''               || list of strings || ''see below'' || the plugins to use                                                                ||

=== bonus ===

There are two kinds of bonus, the one related to tickets:

 * ''logins'' (counted x2 if author and x1 if participant)
 * ''component'' (e.g. "linear algebra", "combinatorics", ...)
 * ''status'' (e.g. "needs_review", "positive_review", ...)
 * ''priority'' (e.g "blocker", "critical", ...)

and the one related to other bot reports:

 * ''behind'': weight the number of commits behind master
          (and count for -1 if the commit is not locally available)
 * ''applies'': whether previous bots succeeded when merging the branch with the current beta
 * ''unique'' : give less chance for already seen tickets

The defaults are
{{{
 bonus = {
     "blocker"        : 100,
     "critical"       : 60,
     "major"          : 10,
     "minor"          : 0,
     "needs_review"   : 1000,
     "positive_review": 500,
     "needs_info"     : 0,
     "needs_work"     : 0
     "unique"         : 40,
     "applies"        : 20,
     "behind"         : 1
    }
}}}
But you could add
{{{
 bonus = {
     "vbraun": 10,
     "inconito": -5,
     "linear programming": 200,
     "finance": -200
     "14382": 100,
     "15777": 100
     }
}}}

== Looking at patchbot activities ==

Remotely, you can have a look at the last tickets tested by patchbots at https://patchbot.sagemath.org/ and the tests without tickets applied can be found at http://patchbot.sagemath.org/ticket/0/.

On your machine, the patchbot writes a summary of its activities in $SAGE_ROOT/logs/patchbot/history.txt

== using an ipython session ==

You can try the patchbot inside a ipython session, as follows.

First, in the sage directory, create a branch "patchbot/base" by
{{{
git checkout develop -b patchbot/base
}}}
then
{{{
cd sage-patchbot/
}}}
launch ipython and (for patchbot version ≥ 2.6.2)
{{{
from sage_patchbot.patchbot import Patchbot

opt = {'sage_root': '/home/platon/sage/', 'owner': 'Sophocle'}

P = Patchbot(opt)

P.test_a_ticket(14974)   # just test one ticket and stop

P.test_some_tickets([14974, 19876, 20202])  # test several tickets in the given order
}}}

The argument dictionary must contain at least (patchbot version ≥ 2.6.2):
{{{
{'sage_root': path to the sage local repository}
}}}
