# Defined in rt.fish @ line 1
function rt-api-production
  ssh -t rt-api-production "docker exec -it \$(docker ps | grep recruitee/api: | awk 'NR==1{print \$1}') sh"
end
