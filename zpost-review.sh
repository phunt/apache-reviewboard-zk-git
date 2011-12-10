#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: zpost-review.sh rev-list JIRA# ...";
    exit 1;
fi;

REVLIST=$1;
JIRA=$2
shift 2;

~/dev/myrbtools/rbtools/postreview.py --repository-url="/home/reviewboard/zookeeper/.git" --server="https://reviews.apache.org" --target-groups=zookeeper --summary="$(git log --pretty=format:%s $REVLIST)" --description="$(git whatchanged $REVLIST)" --diff-filename=<(git diff --no-prefix $REVLIST) -o --bugs-closed=ZOOKEEPER-$JIRA $*
