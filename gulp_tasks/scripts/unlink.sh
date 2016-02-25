#!/bin/bash
FE_DIR=$(pwd)
A2_DIR=$(cd "../abaqis2"; pwd)

for f in css fonts img js locales rev
do
  if [ -L "${A2_DIR}/public/${f}" ]
  then
    # In this case, we're looking at a symbolic
    # link; just delete the link
    rm -f "${A2_DIR}/public/${f}"
  else
    # In this case, we're looking at a real
    # directory; recursively delete the directory.
    rm -fr "${A2_DIR}/public/${f}"
  fi
done

rm -f "${A2_DIR}/app/views/nr/sessions/show.html.erb"
