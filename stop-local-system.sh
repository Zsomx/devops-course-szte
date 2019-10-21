cd vagrant && vagrant destroy -f --parallel && cd ..
#Source: https://www.jeffgeerling.com/blog/2016/remove-all-your-local-vagrant-boxes-bash-command
vagrant box list | cut -f 1 -d ' ' | xargs -L 1 vagrant box remove -f
docker rm -f $(docker ps -aq)
docker rmi $(docker images -q)
rm -r packer/artifact