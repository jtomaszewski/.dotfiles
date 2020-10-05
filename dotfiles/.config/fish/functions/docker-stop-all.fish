# Defined in - @ line 1
function docker-stop-all --wraps='docker stop (docker ps -aq)' --description 'alias docker-stop-all=docker stop (docker ps -aq)'
  docker stop (docker ps -aq) $argv;
end
