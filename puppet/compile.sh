#! /bin/bash
source $_SCRIPT_INIT
outputFile="puppetfile.pp"

function _insert () {
	echo >> ${outputFile}
	echo "#---- `pwd`/$1" ----# >> ${outputFile}
	cat $1 >> ${outputFile}
}

cd ${_PUPPET_ROOT}
rm -f ${outputFile}

_insert "envList"
_insert "general.pp"
#cat ./general.pp >> ${outputFile}

for f in services/*
do
	_insert "${f}"
#	cat ${f} >> ${outputFile}
#	cat ${_PUPPET_ROOT}/services/${f} >> ${outputFile}
done

_insert "packages.pp"
#cat $_PUPPET_ROOT/packages.pp >> ${outputFile}
