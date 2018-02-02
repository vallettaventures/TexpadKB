This script is a frontend to the `texdoc` package.
If you run it and provide the name of a latex package it will open the documentation

    (*
    AppleScript for Texpad
    Get Help for Package
    This will open a dialog and ask for the
    name of a help file. The call is made
    using texdoc at the terminal

    v 1.0 J J Weimer 18.01.19
    known issues
    This version does not check the validity
    of the help file.
    *)

    on run
        display dialog "Get help for which package?" with title "LaTeX Document Help" default answer ""
        set thePackage to the text returned of the result
        set theCmd to "texdoc -v " & thePackage
        tell application "Terminal"
            set theResult to do script theCmd
            delay 3
            quit
        end tell
    end run
