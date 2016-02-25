# A3 Front End

See the [Wiki](https://github.com/GitHubAdmin/abaqisFE/wiki) for detailed setup and AngularJS styleguide

## Quick Build
First, make sure you've [already installed](https://github.com/GitHubAdmin/abaqisFE/wiki/Build-Tools-&-Process#tools) the correct versions of our front end toolchain. Then...

### Install resources
    $ sudo npm install // install node packages
    $ bower install // download third party js/css libs

### Build project
    $ gulp // for quick build, or...
    $ gulp watch // for build and live compliation of front end changes

## Run Tests
To launch Chrome and run unit tests:

    $ karma start karma.conf.coffee
