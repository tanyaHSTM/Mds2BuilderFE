#!/bin/bash
FE_DIR=$(pwd)
BE_DIR=$(cd "../Mds2BuilderBE"; pwd)

for f in css fonts img js locales rev
do
  if [ -L "${BE_DIR}/priv/static/${f}" ]
  then
    # In this case, we're looking at a symbolic
    # link; just delete the link
    rm -f "${BE_DIR}/priv/static/${f}"
  else
    # In this case, we're looking at a real
    # directory; recursively delete the directory.
    rm -fr "${BE_DIR}/priv/static/${f}"
  fi
done

rm -f "${BE_DIR}/web/templates/layout/app.html.eex"
