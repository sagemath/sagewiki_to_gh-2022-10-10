

# Thoughts about the account model for the SAGE notebook

This page is linked to from  <a href="/days4/projects/nb">The SAGE Notebook project page</a>. 

See <a href="/days4/projects/account/userData">User Data</a> for the configurable options. 

When hashing out a user/permissions model, I think it's probably best to begin by envisioning use cases. So here is a range of examples of what I think typical notebook users will look like: 

a) I am a linux/windows user who puts SAGE on my laptop. I expect to be the only person ever to use the notebook. I want everything visible by everyone, but everyone in this case is me. Dealing with access and write permissions is a redundant step and nothing but a hassle for me. 

b) I'm a high school computer teacher. I want to run SAGE in my school's computer lab, and finally convinced the school to set up a linux server running SAGE. I want a quick and easy way to set up a lot of user accounts (one for each student). I want only my students to have the ability to create new worksheets. I probably don't want my students to have the option of hiding their worksheets from me. I have different classes, and want to be able to make permissions changes to large groups of people at the same time. 

c) I'm a shadowy TLA agency. I want to use SAGE to help break RSA and defend my country. Despite the fact that I use IPSEC and VPN everywhere possible, I need an extra layer of security in SAGE. I need authentication for each one of my agents. I can't let passwords fall into enemy hands, or lives will be lost. I probably don't want a way for users to sign up for an account. If they need one, I'll provide it. 

d) I'm a large, upper tier university. I'm making a push cut license fees, so I get SAGE installed on my school's Unix cluster. I want a notebook server that students can log into both from home and from the university computer labs. I want only university students and employees to use the notebook, but I don't want to set up each of their accounts individually. There are simply too many. Instead, I want SAGE to integrate with my school's kerberos-based authentication system. I don't want data saved in a central place. I want each student's worksheets saved in their /home NFS mount. 

e) I'm William Stein, and I want everyone in the world to have access to a sandbox in which to try SAGE. But I don't want one person hogging my (admittedly massive) system resources, so I need disk quotas, memory limits, process priorities, etc. I want every worksheet owned by some user. Hence I need each and every user to log in. When users sign up, I will need to verify that they are actual human beings, so that sage.math does not become a massive spamming bot. Once they have signed up, I want users to be able to share and collaborate at will. I pretty much want the permissions model of google documents. 

Of course it goes without saying that things like server security are an issue in each and every one of these cases. 

Anyway, that's a list of a few potential use cases that are plausible to me. While some may be a bit far fetched, it has become clear to me in writing this that we will have to think in pretty general terms for our user/permissions model. 

~Bobby 
