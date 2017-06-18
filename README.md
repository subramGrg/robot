# robot-simulator

This is a ruby application that simulates a robot moving on a square tabletop (5 units x 5 units). It runs well with ruby versions 2.x.

### Details

This application only reads the following commands:
* place x,y,f `eg: place 0,0,south`
* move `moves robot a unit`
* left `rotates robot left`
* right `rotates robot right`
* report `reports back position`

## RDoc

You can consult the project's RDoc on [RubyDoc.info](http://www.rubydoc.info/github/subramGrg/robot-simulator).

## Run application

To run this application follow these simple steps:

- Download a copy locally on the computer
- Run application using `ruby main.rb`

### Additional information

To edit the order of command's executed, edit `lib/input.yml` before running `ruby main.rb`
