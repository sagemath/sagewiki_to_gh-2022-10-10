{{{#!markdown
# Personnel / Research Software Engineers

Opportunities for hiring RSE in our institutions?

# Funding opportunities

- EOSC  (EU)
- CoST (EU)
- Simons Foundation?   https://www.simonsfoundation.org/

# Numfocus

Here is the e-mail thread where we last discussed NumFocus, and has much of the info and links:
- https://groups.google.com/d/msg/sage-devel/aY0GVqBwFkI/cTqfaBN5AQAJ

# Connection with industry

# Connection with Oscar

Is there any hope to combine use of Sage and Julia? (There is a rudimentary pexpect interface)

# Research code

# Technical aspects (Build system / CI / ...)

What are the big challenges?
- better integration with Python distribution system (aka `pip install sage`)

## Modularity

Separate parts of the Sage library to be installed on their own.

https://trac.sagemath.org/ticket/29705 
Meta-ticket: Modularize sagelib into separate distutils packages

### Strong candidate: categories + parent+element + morphisms + coercion 

Would enable people to implement "Sage-style code" without the need to depend on all of Sage

A lot of the core framework of Sage could be factored out into a smaller `sage.core` package or something.  Could include e.g. a minimal Integer class that can represent integers as a category but does not fully implement them, 
among others.

### Calculus?

Calculus could be included in this core library (or presumably a separate library) if we had good enough reason to switch most of that functionality by default to Sympy - but I don't know what the current status of that is, there were some comparisons of our test suite run using Sympy versus Maxima a year or two ago.


## Use more system installed software

- Jupyter
- ...

## Using types?

# Development model

monolithic versus modular

# Installation instructions for sysadmins

How to install Sage on a bunch of machines.
- computer room full of pcs
- large number of laptops for staff and/or students

# Involve institutions?

Some departments or institutes might be interested in running patchbots etc.

# Connections with math education: incorporate into more textbooks, provide framework for more classes

## Social Infrastructure

### How many people are using Sage?

for cocalc, there is https://cocalc.com/index.html → bottom table → sage worksheets. there are no concrete numbers for sage kernels in jupyter. (as of writing this, a quarter million sagews files in the last month)

This is potentially useful to know in order to apply for funding

We have more than 100K downloads of the sagemath/sagemath Docker image in about 3 years. Much of this is from CI systems though.

We have 95K downloads of the sagelib conda package in the past three years. I don't think there's that many CI users here.

SageCell monthly uses?

Sage 9.0 downloads? Sage 9.1 downloads?

Does it make sense to ask on the first run of sage the permission to send in an anonymous registration?

Some numbers in ODK's KPI section:
https://github.com/OpenDreamKit/OpenDreamKit/blob/master/ReportingPeriod3/TechnicalReport/report-final.pdf

### History 

Sage has historically done very well with community, compared to other large projects.  But it is so big now that this is difficult.

### Current places people interact around Sage

- Website
- ask.sagemath
- sage-* Google groups (many! some moribund)
- Stackexchange
- Facebook ?!
- CoCalc community
- Trac of course
- Github
- Gitlab
- zulip

### One stop shop for Sage

Somewhere where people come and find everything related to Sage?  Or at least that sends them to the appropriate places for doing so.
}}}
