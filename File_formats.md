

# File formats related to SageMath

   * files for Sage objects 
         * _.sobj_ 
   * files for Sage code 
         * Python code: _.py_ 
         * Cython code: _.pyx_ 
         * Sage code: _.sage_ 
   * reading from a text file (_.txt_) and writing to a text file 
   * reading from a _.csv_ file and writing to a _.csv_ file 
   * reading from a _.xls_ or _.xlsx_ spreadsheet 
   * various notebook worksheets can be used with Sage 
         * _.sws_ (for the old legacy notebook) 
         * _.sagews_ (for the Cocalc notebook), 
         * _.ipynb_ (for the Jupyter notebook) 
   * location of Sage Notebook worksheets: in the .sage folder 
   * how to retrieve those _.sws_ worksheets 
   * how to convert them into _.sagews_ or _.ipynb_ worksheets 
         * <a href="https://github.com/sagemathinc/smc/blob/master/src/smc_pyutil/smc_pyutil/sws2sagews.py">https://github.com/sagemathinc/smc/blob/master/src/smc_pyutil/smc_pyutil/sws2sagews.py</a> 
         * <a href="https://github.com/sagemathinc/smc/blob/master/src/smc_pyutil/smc_pyutil/ipynb2sagews.py">https://github.com/sagemathinc/smc/blob/master/src/smc_pyutil/smc_pyutil/ipynb2sagews.py</a> 
   * how to convert to and from other formats: reStructuredText _.rst_, _.pdf_, etc. 
         * <a href="https://github.com/nthiery/rst-to-ipynb">https://github.com/nthiery/rst-to-ipynb</a> 
         * <a href="https://github.com/sagemathinc/smc/blob/master/src/smc_pyutil/smc_pyutil/sagews2pdf.py">https://github.com/sagemathinc/smc/blob/master/src/smc_pyutil/smc_pyutil/sagews2pdf.py</a> 
         * <a href="https://bitbucket.org/whuss/sws2tex/">https://bitbucket.org/whuss/sws2tex/</a> 
   * pandoc 

## Related pages

* <a href="/codesharingworkflow">CodeSharingWorkflow</a> 