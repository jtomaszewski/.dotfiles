# Defined in rt.fish @ line 1
function rt-c-s
	ssh -t rt-staging "docker exec -it \$(docker ps | grep recruitee/api: | awk '{print \$1}' | head -n 1) /opt/app/bin/rancher_boot.sh remote_console"
end
