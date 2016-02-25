#!/bin/bash
FE_DIR=$(pwd)
BE_DIR=$(cd "../Mds2BuilderBE"; pwd)

# Locate all the directories under dev
for f in css fonts img js locales
do
  if [ -L "${BE_DIR}/priv/static/${f}" ]
  then
    echo "Link to ${BE_DIR}/priv/static/${f} already exists"
  else
    echo "Linking ${FE_DIR}/dev/${f} -> ${BE_DIR}/priv/static/${f}"
    ln -nfs "${FE_DIR}/dev/${f}" "${BE_DIR}/priv/static/${f}"
  fi
done

# Now, link the index.html to the right place
if [ -L "${BE_DIR}/web/templates/layout/app.html.eex" ]
then
  echo "Link to "${BE_DIR}/web/templates/layout/app.html.eex" already exists"
else
  echo "Linking ${FE_DIR}/dev/index.html to ${BE_DIR}/web/templates/layout/app.html.eex"
  ln -sf "${FE_DIR}/dev/index.html" "${BE_DIR}/web/templates/layout/app.html.eex"
fi
