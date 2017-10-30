# Defined in rt.fish @ line 5
function rt-api-staging2-console
	ssh -t rt-api-staging2 "docker exec -it \$(docker ps | grep recruitee/api: | awk '{print \$1}' | head -n 1) /opt/app/bin/rancher_boot.sh remote_console"
end
