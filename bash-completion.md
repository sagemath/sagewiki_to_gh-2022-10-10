Bash (and other shells such as zsh) have programmable tab completion.  For example
{{{
./sage --n[TAB]
}}}
becomes
{{{
./sage --notebook
}}}

Below is a rudimentary means of adding such completion to bash.  It will most likely not work on all platforms since it uses `grep -o` but it should not be difficult to change this.  Also it uses the new long form options which will hopefully be part of sage soon.  To use the old form simply change the `--help` and `--advanced` to `-help` and `-advanced` respectively.

{{{
# add this to .bashrc

# bash tab completion for sage
SAGE_OPTIONS=
_sage_tab() {
   COMPREPLY=()
   _sage_tab_binary=${COMP_WORDS[0]}
   _sage_tab_current_word=${COMP_WORDS[COMP_CWORD]}

   # Cache SAGE_OPTIONS for performance
   if [ "$SAGE_OPTIONS" = '' ]; then
       SAGE_OPTIONS=$(
           ("$_sage_tab_binary" --help 2>/dev/null;
               "$_sage_tab_binary" --advanced 2>/dev/null; ) \
                   | grep -Eoe '--?[a-zA-Z_][a-zA-Z_-]*' | sort -u)
   fi

   case ${_sage_tab_current_word} in
       -*) # Options
           COMPREPLY=($(echo ${SAGE_OPTIONS[@]} | tr " " "\n" \
               | grep -oe "${_sage_tab_current_word}[a-z-]*" \
               | sort | uniq | tr "\n" " "));;
       *)  # Search for files that sage understands
           # If it doesn't find any it will default to directories
           SAGE_EXTENSIONS='sage|py|spkg'
           COMPREPLY=($(compgen -G "${_sage_tab_current_word}*" \
               | grep -Ee '\.('$SAGE_EXTENSIONS')(\.gz)?$'));;
   esac
   return 0
}
# use _sage_tab to complete, it produces filenames, and if no matches
# are returned, complete with directory names
complete -F _sage_tab -o filenames -o dirnames sage
}}}

See [[Tips]] for other handy hints for using Sage.
