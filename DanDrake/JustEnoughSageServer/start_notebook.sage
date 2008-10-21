# A script for starting the Sage notebook with the options you like.
# Change the options to your needs, save this script and do "sage
# start_notebook.sage" to start the notebook with these options.
#
# by Dan Drake; see http://wiki.sagemath.org/DanDrake/JustEnoughSageServer

# we'll stuff everything into a dictionary and pass that on to notebook()
nbopts = {}

# listen on all addresses
nbopts['address'] = ''

# use https, not http
nbopts['secure'] = True

# don't open a viewer, I'll do that myself thankyouverymuch
nbopts['open_viewer'] = False

# use this directory for nb files; must be writable by the nb? users
nbopts['directory'] = '/home/sageadm/nbfiles'

# at most 500MB memory, 100MB files, 100 processes for nb? users
nbopts['ulimit'] = '-v 500000 -f 100000 -u 100'

# time out idle sessions after two hours
nbopts['timeout'] = 7200

# yes, can create new accounts
nbopts['accounts'] = True

# use these minions to do our bidding
nbopts['server_pool'] = ['nb%s@localhost' % n for n in [1..5]]

# Go!
notebook(**nbopts)
