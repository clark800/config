git-pre-commit
==============

Simple generic git pre-commit hook that can easily be configured to run various lint tools based on filename extension


Installation
============

    wget https://raw2.github.com/clark800/git-pre-commit/master/pre-commit
    chmod +x pre-commit
    ./pre-commit install    # copy the script to a template directory
    rm pre-commit
    cd my_existing_git_repo
    git init   # copy the pre-commit hook from the template directory

Any new repositories that you create or clone will automatically inherit
the new pre-commit hook. If your repository already had a pre-commit hook
(in .git/hooks/pre-commit), you will have to remove it because "git init"
will not overwrite files.


How it Works
============
The installation will create a configuration file at ~/.git-pre-commit
containing the following default:

    *.py pylint
    *.py pep8

For each line in this file, if a file being committed matches the pattern
at the beggining of the line, the following command will be run with the file
path passed as the last argument.

If all the commands for matching patterns return exit code 0,
the commit is permitted, otherwise it is aborted.
