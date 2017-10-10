### Note
if you encounter the problem as below when you run `docker-compose up`:
> WARNING: Service "jenkins" is using volume "/var/jenkins_home" from the previous container. Host mapping "/opt/jenkins" has no effect. Remove the existing contRecreating jenkins ... done

please try `docker-compose down -v` before the `up` command.
