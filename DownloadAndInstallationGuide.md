

# Quick Download and Installation Guide

Not sure what <a class="http" href="http://www.sagemath.org/download.html">to download</a>? See the <a class="https" href="https://02dc12e7f56de4edc34c6532a8c465979c658c1f--sagemath-tobias.netlify.app/installation/index.html">installation guide</a>. 


## Troubleshooting

1.  If no binary version is available for your system, download the source version. Note that Sage compiles on a wide variety of systems, but does not compile on _every_ system. 
1. If you are not sure how to unpack the compressed file or its ending looks different: 
      * `*.tar.gz` or `*.tgz`: Use `tar xzf *.tar.gz` 
      * `*.tar.bzip2` or `*.tar.bz2`: Use `tar xjf *.tar.bzip2` 
      * `*.app.dmg` or `*.dmg`: This is a Mac disk image, and you can just double-click it. 
      * `*.tar.lzma`: Use `tar --lzma -xf *.tar.lzma` 
            * No `lzma`? Perhaps you have `xz`, that is compatible with `lzma`. There might also be `-J` in `tar -xJf *.tar.lzma` or you need to install an lzma or xz-utils package. 
      * If the file ending is different, the Linux command `file` gives you information about the archive type. (Type `file filename.ext` at the command prompt.) 
1. The <a class="https" href="https://wiki.sagemath.org/ReleaseTours">Release tour</a> corresponding to the Sage version that you wish to install may offer **version-specific installation help** that has become available after the release was made and is therefore not covered by the installation manual.   
1. Ask for help on the <a class="http" href="http://groups.google.com/group/sage-support">sage-support</a> mailing list. 