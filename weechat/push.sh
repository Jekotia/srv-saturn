#! /bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
image=`basename $DIR`

/saturn/docker/tools/manifest-tool/manifest-tool push from-spec /saturn/docker/$image/manifest.yml
