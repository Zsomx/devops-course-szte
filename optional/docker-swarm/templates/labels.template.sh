docker node update $worker --label-add cloudrole=appnode
docker node update $lmanager --label-add cloudrole=devopsnode