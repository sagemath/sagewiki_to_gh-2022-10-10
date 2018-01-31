<<TableOfContents>>

= Cantor =

[[https://www.kde.org/applications/education/cantor/|Cantor]] is a front-end
for many mathematical software applications like Sage, Maxima, R and KAlgebra.
Cantor belongs to [[http://edu.kde.org/|The KDE Education Project]] and lets
you use your favorite mathematical applications from within a nice
KDE-integrated Worksheet Interface. It offers assistant dialogs for common
tasks and allows you to share your worksheets with others.

'''Cantor's main features are:'''
 * Nice Worksheet view for evaluating expressions
 * View of plotting results inside the worksheet or in a separate window
 * Easy plugin based structure to add different Backends
 * [[http://ghns.freedesktop.org/|GetHotNewStuff]] integration to upload/download example worksheets
 * Typesetting of mathematical formulas using LaTeX
 * Backend aware syntax highlighting
 * Plugin based assistant dialogs for common tasks (like integrating a function or entering a matrix)

= Install Cantor at Ubuntu Karmic =

For ubuntu karmic you just run 3 commands in a terminal:

{{{
sudo add-apt-repository ppa:kubuntu-ppa/beta
sudo apt-get update
sudo apt-get install cantor
}}}

It will update all the KDE-packages to version 4.4, but this is useful for having no troubles with Cantor.

= Build and Install Cantor =
As Cantor is part of KDE Edu since version 4.4, most Linux distributions will already have a package for it.
Either combined with other apps in one kdeedu package or split into a separate cantor package.

If you are using an older distribution, you can build cantor from source:

''Cantor depends upon kdelibs, so in order to build Cantor, you must have kdelibs development files.''

If you have a Linux box, then you can install the kdelibs-devel package
from your distribution. If you have Windows, then you can use the
[[http://windows.kde.org/|KDE on Windows]] project, please note that
there is already a Cantor.exe ported to windows, so it is not necessary
to build the application. Otherwise, you can
[[http://techbase.kde.org/Getting_Started/Build/KDE4#kdelibs|build
and install kdelibs from sources]].

''' ''The following steps can be used to build Cantor for a Linux distribution.'' '''

 * First obtain the sources

  {{{
svn co svn://anonsvn.kde.org/home/kde/trunk/KDE/kdeedu/cantor
  }}}

 * Replace the the content of ''cantor/CMakeLists.txt'' with this:

  {{{
project(cantor)

# search packages used by KDE
find_package(KDE4 4.3.80 REQUIRED)
if(WIN32)
  find_package(KDEWIN32 REQUIRED)
  # detect oxygen icon dir at configure time based on KDEDIRS - there may be different package installation locations
  execute_process(COMMAND "${KDE4_KDECONFIG_EXECUTABLE}" --path icon OUTPUT_VARIABLE _dir ERROR_QUIET OUTPUT_STRIP_TRAILING_WHITESPACE)
  file(TO_CMAKE_PATH "${_dir}" __dir)
  find_path(KDE4_ICON_DIR oxygen PATHS
      ${__dir}
  )
  message(STATUS "using oxygen application icons from ${KDE4_ICON_DIR}")
else(WIN32)
    set (KDE4_ICON_DIR  ${CMAKE_INSTALL_PREFIX}/share/icons)
endif(WIN32)

include(KDE4Defaults)
include(MacroLibrary)

if(NOT WIN32)
  macro_optional_find_package(LibSpectre)
  macro_log_feature(LIBSPECTRE_FOUND "libspectre" "A PostScript rendering library" "http://libspectre.freedesktop.org/wiki/" FALSE "${LIBSPECTRE_MINIMUM_VERSION}" "Support for rendering EPS files in Cantor.")

  if(LIBSPECTRE_FOUND)
    set( WITH_EPS On )
  else(LIBSPECTRE_FOUND)
    set( WITH_EPS Off )
  endif(LIBSPECTRE_FOUND)
else(NOT WIN32)
  set( WITH_EPS Off )
endif(NOT WIN32)

include_directories( ${KDE4_INCLUDES} ${QT_INCLUDES} )

add_subdirectory( src )
add_subdirectory( icons )
add_subdirectory( tests )
  }}}

 * Type these commands:

  {{{
cd cantor
mkdir build
cd build
cmake ../
  }}}

  Alternatively you can choose where to install by setting `DCMAKE_INSTALL_PREFIX`.
  For example replace the last line above by:

  {{{
cmake -DCMAKE_INSTALL_PREFIX=/usr/ ../
  }}}

 * Type this command

  {{{
make install
  }}}

= Using Sage with Cantor =
After starting Cantor you will be prompted with all the supported backends. 
If Sage is not on the list, you may have to check the settings, and correctly set the path to the Sage executable.
If you check the "make this the default backend" box, this backend will be preselected in the future.

The Cantor worksheet is quite similar to the one offered by Sage notebook. You can run any Sage commands by entering it in the cell
and pressing Shift+Enter.

If you evaluate "? command" the help for the specific command will show up in the help panel on the right, 
pressing <Tab> will show you possible completions for the current command.

Cantor offers some comfort features, like typesetting your results using LaTex, or offering dialogs for
commonly used functions.

Once you've finished working on your worksheet, you can easily share it with others, by publishing it on kde-files.org.
You just select the "Publish Worksheet" entry in File menu, and follow the assistant. Once completed, your new worksheet
will show up in the "Download Example" dialog.

= Links =
  * Official Site
    - http://edu.kde.org/cantor/
    - https://www.kde.org/applications/education/cantor/
  * Author's Blog - http://arieder.wordpress.com/
