# Defined in rt.fish @ line 1
function rt-api-legacy
  ssh -t core@149.202.184.50 "docker exec -it \$(docker ps | grep recruitee/legacy: | awk 'NR==1{print \$1}') bash"
end
