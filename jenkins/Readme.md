# Used plugins
 - Docker

# Used agents
- Image: jenkins/jnlp-agent-docker<br>
  Dir: /home/jenkins
  User: root
  Env:
    - DOCKER_HOST: tcp://192.168.2.2:2376

- Image: jenkins/jnlp-agent-node<br>
  Dir: /home/node

# This config should be handled by Jenkisn Configuration as Code in the future. 