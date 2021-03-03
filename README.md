# Spring-boot-kubernatics-configMap

Usecase : we develop here spring cloud kubernatices project for configMap, SecretMap. means we take username, password and database URL from these 
          kubernatices secretMap and ConfigMap service and post customer data in MongoDataBase.

Solution : This problem is divided in two parts 1. MongoDB and Mongo-Express Setup and 2. Spring-Boot project integration.
    
    part 1. Need to setup the mongodb and mongo express in kubernatices and docker.
	  
	  step-1 : Run below command for mondodb and mongo express to setup in kubernatics from folder "mongo-database-setup"
		    :/> kubectl apply -f mongodb-secret.yml
		    :/> kubectl apply -f mongo-configmap
		    :/>	kubectl apply -f mongodb-deployment.yml
		    :/>	kubectl apply -f mongo-express-deployment.yml
	  step-2 : open mongo express URL in browser
                http://localhost:8081	
       				
    part 2 : clone the project Spring-boot-kubernatics-configMap spring boot project and open in STS
              
	      step-1 : make tha jar using below command			
        	     :/> mvn clean install
	      step-2 : make the docker image and push image in Docker Hub Repository
		     :/> docker build -t pankaj570/customer-service .
                     :/> docker push pankaj570/customer-service
              step-3 : make deployment and Load balancer service for accessing the application from out side of Docker container.
                     :/> kubectl apply -f customer-service-deployment.yml	
              step-4 : open postman and use below url and request.
                      URL : http://localhost:8080/customer
                      METHOD : POST
                      REQUEST : {"id":"2", "name":"manish", "address":"bikramganj"}
