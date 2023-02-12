

# Foundation for mathematical and scientific computing: Discussion Notes

* - Revenue generation - Proprietary software - Training - Reproducible research 

## Discussion

- R. Bradshaw: keep revenue generation and open source parts separate.  Don't have a mixed message "donate money to my right hand; buy the stuff from my left hand". 

- P. Ivanov brings up the Mozilla foundation as an example that has both a foundation and a company side to it.  Though Mozilla isn't really selling anything, so perhaps this helps. 

- Jarrod: EC2-style setup of preconfigured services as a source of revenue? 

- Dav Clark: Monetizing an EC2 image preconfigured with all the right dependencies. 

- Fernando/Robert: would running a company take too much time/effort away from the foundation work? 

- William: people do want to pay for images running a Sage notebook.  There *is* a market for these types of services, if they provide sufficient value. 

- Audience: if you monetize these products, don't you end up precisely excluding the audience you want to support with free tools? 

   * Reply (William, Robert): no, the free versions are always available.  The service model target people with more money than time.   
- Robert: I don't like the idea of paying so much for training. 

   * F: is it the amount or paying at all? R: it seems way too expensive for a week ($10.000 for a week's Mathematica workshop). 
- Merchandise? "Whenever I see that, I think I'd rather they not make stuff and just donate money". 

   * Paul: vanity email addresses are free to create and can be a nice incentive. 
- Audience: Keep the boundaries between foundation and company very clear. 

- Stefan: to get people to give you money, you need to earn their trust.  Be very clear upfront on how you'd spend their money before they give it to you. Make financial statements open as well. 

- Jarrod: large scale fundraising?  No replies... 

- Proprietary software in research? 

   * William: it's great to have completely independent implementations of things to check against.  Proprietary systems provide independent confirmation that doesn't share the code with the open source tools.  Anecdote reviewing John Cremona's students computation of integral points, where the comparisions with Magma found bugs in *both* Sage and Magma.  But as far as what the foundation should support or not... 
- Audience: instrumentation companies provide proprietary software for post-processing. 

- There are differences regarding proprietary software in research and education; the argument above does not apply equally in an educational context. 

- Training? William: tons of Sage days!  Teaching undergrad/grad classes in departments that don't classically do this.  The foundation could help by providing course materials to make this easier. 

   * Prabhu: many scientists don't even realize they're still in the 70's.  They don't even see what they are missing, and it's very hard to convince them of the importance of this.  CS departments are not friendly to these questions, they don't actually write any code.  We don't even go through the CS department at all: they don't teach version control, testing, etc.  They don't understand what the working scientist needs. Fernando: this is already being recognized even by institutions.  Cf. Josh Bloom's example, who just received funding from Berkeley to put together such a course. The foundation perhaps could be a clearing house/centralizing these resources, showing the importance of the problem, making materials available, etc. 
- Audience: a revenue model providing access to supercomputing resources? 

   * William: No.  The NSF already has spent tons of money building the Teragrid resources which are very easily available, so there's no point competing with them.  The foundation could work with these supercomputing facilities for them to have the tools readily available. 
- Reproducible research.  William: definition?  Jarrod: the ability to reproduce any figure/table from a computational publication easily, by having access to the code and data necessary. 

   * Dav: the important part is to be able to start from scratch, acquire new data and get the same result. Paul: when you use a commercial package that could be built on top of BSD code, you may be misled into thinking you've validated your code. Robert: data storage site? Paul Ivanov: point out the existing resources for data sharing, encourage their use. William: many journals don't have the resources to store a 50GB dataset that's the key to a paper.  How can this be made available in a stable, long-term manner?  Jarrod points out PURL (<a href="http://purl.oclc.org">http://purl.oclc.org</a>) as a way to have a persistent URL, though it has to be manually maintained. Audience: journals/funding agencies require that data be made publicly available and reliably archived. Dav Clark: help with the legally contradictory conditions that researchers find themselves in, caught between privacy and data sharing requirements. 
- Audience: training about why open source/reproducible research is important could generate revenue.  
