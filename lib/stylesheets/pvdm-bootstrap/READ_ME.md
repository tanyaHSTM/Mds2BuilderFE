pvdm-bootstrap
--------------

"pvdm-bootstrap" is a base build of the bootstrap library with a custom theme 
to provide a cross application color palette and widgets. The intent is to import
this library in all apps as a foundation for the UI and then build on it with 
custom components and styles specific for each app.

DO NOT edit /pvdm-bootstrap/bootstrap.css. Instead use the URL below to update
the configuration and download a new version of the file.

Generate a new lib here:
http://getbootstrap.com/customize/?id=5a6369443d2a96a8f610. 

/bootstrap-overrides
-------------------

"/bootstrap-overrides" provides overrides to the base styles of the bootstrap
library that can't be applied through a custom build configuration via
http://getbootstrap.com/customize/

Only edit these files if the changes are intended for ALL apps using our
"custom-bootstrap" library. For app/component specific styles, make them within
the app/component itself.