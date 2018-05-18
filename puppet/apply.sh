#! /bin/bash
source $_SCRIPT_INIT
_isRoot "exit"
puppet apply $_PUPPET_ROOT/puppetfile.pp
