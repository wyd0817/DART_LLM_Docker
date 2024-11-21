# Shared Folder between Host PC and Container
Here, the host PC and the container are connected, and files are synchronized. (Bind mount)

Specify the absolute path to this folder (src) in the path variable of the Makefile. In Windows, it is faster to manually write the absolute path. (In the case of Linux, ${pwd} can be specified.)