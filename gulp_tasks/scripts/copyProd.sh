#!/bin/bash
FE_DIR=$(pwd)
A2_DIR=$(cd "../abaqis2"; pwd)

# Locate all the directories under dist
for f in css fonts img js locales 
do
  cp -fr "${FE_DIR}/dist/${f}" "${A2_DIR}/public/${f}"
done 

# Now, copy the index.html to the right place
cp -f "${FE_DIR}/dist/index.html" "${A2_DIR}/app/views/nr/sessions/show.html.erb"

