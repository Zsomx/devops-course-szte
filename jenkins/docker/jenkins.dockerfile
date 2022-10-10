FROM jenkins/jenkins:lts-jdk8

RUN mkdir $JENKINS_HOME/casc_configs
COPY ./config/plugins.txt $JENKINS_HOME/casc_configs/plugins.txt
ENV CASC_JENKINS_CONFIG=$JENKINS_HOME/casc_configs

ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false
RUN jenkins-plugin-cli -f $JENKINS_HOME/casc_configs/plugins.txt