# shadedErrorBar

`shadedErrorBar` is a MATLAB function that creates a continuous shaded error region around a line rather than discrete bars. 
The error region can either be specified explicitly or calculated on the fly based upon function handles. 
The appearance of the plot can be modified via input argumets and/or the handles of the returned plot objects.
You will need OpenGL to get transparency to work.


### Change Log

24th November 2017
* Add `patchSaturation` as an optional argument.

6th August 2017

* Parameter/value pairs for input arguments greater than 3.
* Transparency on by default.
* No longer changes the renderer.
