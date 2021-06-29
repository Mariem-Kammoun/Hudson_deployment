# Hudson_deployment
Configuration of an automatic launch of a hudson job following a failure

##Overview:
From Dockerfile, I installed java JDK, Tomcat then I deployed hudson and installed the necessary plugins. For our problem of automatically launching a job upon failure, I found the "Naginator" plugin do the trick.

##Deploy:
1. Clone this repository : `$ git clone https://github.com/Mariem-Kammoun/Hudson_deployment.git`
2. Change the current working directory : `$ cd Hudson_deployment/`
3. Create the docker image : `$ docker build -t hudson .` 
4. Create and start the container : `$ docker run -it -d -p 8080:8080 -v hudson_volume:/.hudson image_id`
5. Open the browser at http://localhost:8080/ to show Tomcat server, and http://localhost:9090/hudson-war-3.3.3/ to access hudson
6. Create a new job and check "Retry build after failure" in post build actions
7. We can also in such cases only do the build if the output log contains a given regular expression. All you have to do is activate the advanced configuration options by checking the option "Only rerun build if regular expression is found in output".

##Screenshots:
![1](/Screenshots/1.PNG)
![2](/Screenshots/2.PNG)
![3](/Screenshots/3.PNG)
![4](/Screenshots/4.PNG)
![5](/Screenshots/5.PNG)
![6](/Screenshots/6.PNG)
![7](/Screenshots/7.PNG)
 
