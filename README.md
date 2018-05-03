# docker-flask-cent7
A simple flask application running on CentOS 7

## build
Run below command on this repository directory
```
$ docker build -t flask-cent7 .
```

## run
```
$ docker run -itd --name flask-test -p 5000:5000 flask-cent7
```
You can see the application page on http://localhost:5000
