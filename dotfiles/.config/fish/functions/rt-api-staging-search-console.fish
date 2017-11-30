# Defined in rt.fish @ line 1
function rt-api-staging-search-console
	ssh -t rt-api-staging "docker exec -it \$(docker ps | grep recruitee/api-search: | awk '{print \$1}' | head -n 1) /opt/app/bin/rancher_boot.sh remote_console"
end
