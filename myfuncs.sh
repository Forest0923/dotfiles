#! /bin/bash
# show original function
function myfunc(){
    if [ $# -ne 0 ]; then
        echo "ERROR: Invalid argument";
        return 1;
    fi
    echo "-----"
    echo "NAME"
    echo "    init_report"
    echo "USAGE"
    echo "    $ init_report [LocalDirName] [ReportRepositoryName]"
    echo -e "-----\n"

    echo "-----"
    echo "NAME"
    echo "    mkpdf"
    echo "USAGE"
    echo "    $ mkpdf [OPTION] [FILE]"
    echo "OPTION"
    echo "    -d, --draft"
    echo -e "-----\n"

    echo "-----"
    echo "NAME"
    echo "    rm_latex_useless"
    echo "USAGE"
    echo "    $ rm_latex_useless"
    echo -e "-----\n"
}


# clone report template from my repository
function init_report(){
    if [ $# -ne 2 ]; then
	echo "ERROR: Invalid argument";
	return 1;
    fi
    git clone git@github.com:forest0923/report-template.git $1;
    if [ $? -ne 0 ]; then
	return 1;
    fi
    echo -e "# finished cloning\n";
    cd $1;
    rm -rf .git;
    echo "# $2" > README.md;
    git init;
    echo -e "# finished initialising\n";
    git add *;
    echo -e "# finished adding\n";
    git commit -m "first commit";
    echo -e "# finished commiting\n";
    git remote add origin git@github.com:forest0923/$2.git;
    git push -u origin master;
    cd ..;
}

# platex
function mkpdf(){
    if [ $# -eq 1 ]; then
	FILENAME=$1
	SPLITNAME=${FILENAME%\.tex}
	sed -i -e "s/\\documentclass\[a4paper,\ draft\]{jsarticle}/\documentclass[a4paper]{jsarticle}/" $SPLITNAME.tex
        
    elif [ $# -eq 2 ]; then
	if [ $1 = "-d" -o $1 = "--draft" ]; then
	    FILENAME=$2
	elif [ $2 = "-d" -o $2 = "--draft" ]; then
	    FILENAME=$1
	else
	    echo "ERROR: Invalid argument"
	    echo "comand: mkpdf [OPTION(-d, -draft)] [FILENAME]"
	    return 1
	fi
	SPLITNAME=${FILENAME%\.tex}
	sed -i -e "s/\\documentclass\[a4paper\]{jsarticle}/\documentclass[a4paper, draft]{jsarticle}/" $SPLITNAME.tex
        
    else
	echo "ERROR: Invalid argument"
	echo "comand: mkpdf [OPTION(-d, -draft)] [FILENAME]"
	return 1
    fi
    
    echo -en "$SPLITNAME.tex -> $SPLITNAME.dvi\n[1]"
    platex -interaction=nonstopmode -shell-escape $SPLITNAME.tex > /dev/null
    if [ $? -ne 0 ]; then
	echo -e "\nERROR: platex"
	return 1
    fi
    echo  "[2]"
    platex -interaction=nonstopmode -shell-escape $SPLITNAME.tex > /dev/null
    dvipdfmx $SPLITNAME.dvi
    rm_latex_useless
}

function rm_latex_useless(){
    if [ $# -ne 0 ]; then
	echo "ERROR: Invalid argument"
	return 1
    fi
    rm *.log *.aux *.cls *.dvi 2> /dev/null
}
