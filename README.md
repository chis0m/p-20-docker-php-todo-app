### Using Jenkins to Build And Publish Image in Docker Hub
- Setup the Jenkins server and install docker
- Add `jenkins` user to `docker` group and restart `sudo usermod -aG docker jenkins && sudo service jenkins restart`
- Setting up Dockerhub Credentials
    - Goto to `Dockerhub -> Account Settings -> Security -> New Access Token -> Copy the token generated`
    - Goto `Jenkins -> Manage Jenkins -> Manage Credentials -> Credentials -> System -> Global credentials -> Click Add Credentials ->  Choose 'Username and Password'
     -> Input your dockerhub username and access token -> ID: input what you will use in jenkins file`

### Using Docker compose

`docker-compose up -d --build`
`docker-compose run --rm composer install`
`docker-compose run --rm artisan migrate:fresh`
`docker-compose run --rm artisan migrate`
