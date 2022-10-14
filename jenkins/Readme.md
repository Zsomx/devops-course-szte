# Used plugins
 - Docker

# Used agents
- Image: jenkins/jnlp-agent-docker<br>
  Dir: /home/jenkins
  User: root
  Env:
<<<<<<< HEAD
    - DOCKER_HOST: tcp://192.168.5.2:2376
=======
    - DOCKER_HOST: tcp://192.168.56.5:2376
>>>>>>> origin/2022.learning-material

- Image: jenkins/jnlp-agent-node<br>
  Dir: /home/node