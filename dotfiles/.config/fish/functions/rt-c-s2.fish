# Defined in rt.fish @ line 5
function rt-c-s2
	ssh -t rt-staging2 "docker exec -it \$(docker ps | grep recruitee/api: | awk '{print \$1}' | head -n 1) /opt/app/bin/rancher_boot.sh remote_console"
end
