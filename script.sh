#!/bin/bash

set -e

IS_DEPLOY=false

if [ -z $PLUGIN_MODNAME ];then
    npm install
    ${PLUGIN_CMD}
    IS_DEPLOY=true
else
    FILES=$(cat env.yaml | shyaml get-values checkList)
    for element in $FILES
    do
        if [ $element == ${PLUGIN_MODNAME} ]; then
            IS_DEPLOY=true
            echo "+ npm build start. "
            npm install
            ${PLUGIN_CMD}
            break
        fi
    done
fi

if $IS_DEPLOY ; then
   echo "+ npm build success."
else
    echo "+ skip module package npm build."
fi