#!/bin/bash
# show original function
function myfunc(){
    if [ $# -ne 0 ]; then
        echo "ERROR: Invalid argument";
        return 1;
    fi
    echo "-----"
    echo "[NAME]"
    echo "- init_report"
    echo -e "-----\n"
}

# clone report template from my repository
function init_report(){
    if [ $# -eq 1 ]; then
        if [ $1 = "-h" -o $1 = "--help" ]; then
            echo "-----"
            echo "NAME"
            echo "    init_report"
            echo "USAGE"
            echo "    $ init_report [DirectoryName]"
            echo -e "-----\n"
        else
            git clone git@github.com:Forest0923/report-template.git $1;
            cd $1;
            rm -rf .git;
            rm README.md;
            cd ../;
        fi
    else
        echo "ERROR: Invalid argument";
        return 1;
    fi
}
