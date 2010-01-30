goto [[Tips]]

<<TableOfContents>>

 1. item 1
   1. item 1.1
   1. item 1.2
 1. item 2

= Cantor =

Cantor is a front-end for many mathematical software applications like Sage, Maxima, R and KAlgebra. Cantor belongs to [[http://edu.kde.org/|The KDE Education Project]] and lets you use your favorite mathematical applications from within a nice KDE-integrated Worksheet Interface. It offers assistant dialogs for common tasks and allows you to share your worksheets with others.

'''Cantor's main features are:'''
 * Nice Worksheet view for evaluating expressions
 * View of plotting results inside the worksheet or in a separate window
 * Easy plugin based structure to add different Backends
 * [[http://ghns.freedesktop.org/|GetHotNewStuff]] integration to upload/download example worksheets
 * Typesetting of mathematical formulas using LaTeX
 * Backend aware syntax highlighting
 * Plugin based assistant dialogs for common tasks (like integrating a function or entering a matrix)

= Install Cantor =
Cantor depends upon kdelibs, so in order to build Cantor, you must have kdelibs development files.

If you have a Linux box, then you can install the kdelibs-devel package from your distribution. If you have windows, then you can use [[http://windows.kde.org/|The KDE on Windows Project]], please note that there is already a Cantor.exe ported to windows, so is not necesary build the application. Otherwise, you can [[http://techbase.kde.org/Getting_Started/Build/KDE4#kdelibs|build and install kdelibs from sources]].

''' ''The following steps can be used to build Cantor for a Linux distribution.'' '''

 1. First obtain the sources
{{{
svn co svn://anonsvn.kde.org/home/kde/trunk/KDE/kdeedu/cantor
}}}

 1. Replace the the content of ''cantor/CMakeLists.txt'' with this
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

 1. Type this 4 commands:
{{{
cd cantor
mkdir build
cd build
cmake ../
}}}

You can choose where to install with this param DCMAKE_INSTALL_PREFIX For example: 

{{{
cmake -DCMAKE_INSTALL_PREFIX=/usr/ ../
}}}

1. Type this command
{{{
make install
}}}

= Using Sage with Cantor =
 * Worksheet managment ...
 *
 * 

= Links =
 * Official Site - http://edu.kde.org/cantor/ 
 * Author's Blog - http://arieder.wordpress.com/

----
Front-ends
