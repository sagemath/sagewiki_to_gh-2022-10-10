## page was renamed from prerequisitesUbuntu
= Required packages to build SageMath 9.0 on Ubuntu =

{{http://loco.ubuntu.com/media/images/cof_orange_hex1.png||width=100px}}

Here is the minimal list of Ubuntu packages to install in order to build SageMath from sources (this is for Ubuntu 18.04):
 * git
 * m4
 * gfortran
 * libssl-dev
 * python-pip

In addition, it is recommended to install
 * texlive-generic-extra ''(to generate pdf documentation)''
 * texlive-xetex ''(to convert Jupyter notebooks to pdf)''
 * latexmk ''(to generate pdf documentation)''
 * pandoc ''(to convert Jupyter notebooks to pdf)''
 * dvipng ''(to render text with LaTeX in Matplotlib)''
 * default-jdk ''(to run the Jmol 3D viewer from the console and generate images for 3D plots in the documentation)''
 * ffmpeg ''(to produce animations)'' 
 * libavdevice-dev ''(to produce animations)'' 

Besides, to make SageMath use a maximum of system (Ubuntu) packages instead of building its own versions, see [[https://groups.google.com/d/msg/sage-devel/ZGEeuoTtbh4/bvSrf1jHCgAJ|here]].

For more details, see the  [[http://doc.sagemath.org/html/en/installation/source.html#prerequisites|Prerequisites section]] of Sage Installation Guide.

'''Since version 9.1, Sage generates the lists of required prerequisites in the installation manual automatically. Do not update this wiki page.  Automatically updating the list of recommended system packages is the subject of https://trac.sagemath.org/ticket/29557 '''
