# DART_LLM_Docker

## Install dependencies with rosdep
```
cd ~/share/ros2_ws/src && rosdep install --from-paths . --ignore-src -r -y
```


## Setting up to use GUI
Enable X-server usage

1. Install X-server
```
winget install marha.VcXsrv
```
1. Launch X-server
    - Launch the XLAUNCH app from the Start menu or similar
    - Ignore settings and keep pressing next

- Reference
https://zenn.dev/dozo/articles/3ef1565b2b069e

## You need to change the line ending settings in VSCode
It seems that when you git clone on Windows, it sometimes becomes CRLF.

![image](https://user-images.githubusercontent.com/83892604/233789822-5dcc164c-874d-42cf-b69c-c60e3cd5972d.png)
