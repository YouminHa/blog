#!/bin/bash

draft_path="`pwd`/${1}"
if [[ ! -f ${draft_path} ]]; then
  echo "No file: ${1}"
  exit 1
fi

cd `dirname $0`

date_prefix=`cat $draft_path | grep "date:" | sed -e 's#^date: *\([0-9\-][0-9\-]*\) *.*$#\1#g'`
post_path="`pwd`/_posts/$date_prefix-`basename $draft_path`"
echo "Source: $draft_path"
echo "Dest: $post_path"

echo -e "Proceed? (y/n) "
read switch
if [ "$switch" = "y" ]; then
  cp -v $draft_path $post_path && rm -v $draft_path && echo "Done."
else
  echo "Cancelled."
fi

