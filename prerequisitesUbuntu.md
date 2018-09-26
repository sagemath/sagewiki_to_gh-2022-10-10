= Required packages to build SageMath on Ubuntu =

{{http://loco.ubuntu.com/media/images/cof_orange_hex1.png||width=100px}}

Here is the list of Ubuntu packages to install in order to build SageMath from sources (this is for Ubuntu 18.04):
 * git
 * m4
 * gfortran
 * libssl-dev
 * python-pip
 * automake (should no longer be required after [[https://trac.sagemath.org/ticket/26298|#26298]] is merged)

In addition, it is recommended to install
 * texlive-generic-extra ''(to generate pdf documentation)''
 * texlive-xetex ''(to convert Jupyter notebooks to pdf)''
 * latexmk ''(to generate pdf documentation)''
 * pandoc ''(to convert Jupyter notebooks to pdf)''
 * dvipng ''(to render text with LaTeX in Matplotlib)''
 * default-jdk ''(to run the Jmol 3D viewer from the console and generate images for 3D plots in the documentation)''
 * ffmpeg ''(to produce animations)'' 
 * libavdevice-dev ''(to produce animations)'' 


For more details, see the  [[http://doc.sagemath.org/html/en/installation/source.html#prerequisites|Prerequisites section]] of Sage Installation Guide.
