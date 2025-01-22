This is a repository to minimally create a problem with including the file seen here:

`#include <moveit/online_signal_smoothing/butterworth_filter.h>`


## The Problem

When trying to include the above file, which has worked in the past we get the following error:

```bash
Starting >>> butterworth_test_package
--- stderr: butterworth_test_package                         
In file included from /workspaces/moveit_butterworth_minimal_project/src/butterworth_test_package/include/butterworth_test_package/test_file.hpp:3,
                 from /workspaces/moveit_butterworth_minimal_project/src/butterworth_test_package/src/test_file.cpp:1:
/opt/ros/humble/include/moveit/online_signal_smoothing/butterworth_filter.h:44:10: fatal error: moveit_butterworth_parameters.hpp: No such file or directory
   44 | #include <moveit_butterworth_parameters.hpp>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
gmake[2]: *** [CMakeFiles/butterworth_test_package.dir/build.make:76: CMakeFiles/butterworth_test_package.dir/src/test_file.cpp.o] Error 1
gmake[1]: *** [CMakeFiles/Makefile2:137: CMakeFiles/butterworth_test_package.dir/all] Error 2
gmake: *** [Makefile:146: all] Error 2
---
Failed   <<< butterworth_test_package [1.05s, exited with code 2]

Summary: 0 packages finished [1.16s]
  1 package failed: butterworth_test_package
  1 package had stderr output: butterworth_test_package
```


## How To Reproduce

1. clone this repository into some directory 
2. cd to cloned repository directory
3. build image from [test.Dockerfile](test.Dockerfile)
    * `docker build --no-cache -f test.Dockerfile -t ros2:test . `
4. Open prject root in VSCode
5. Open command pallet (ctrl+shift+p)
6. Select `Reopen in Container`
7. Using the terminal now running the docker container inside VSCode, build the project with `colcon build`
