# Defined in - @ line 1
function docker-cache-clear --wraps='docker-stop-all ; docker builder prune -af && docker image prune -af && docker system prune -af' --description 'alias docker-cache-clear=docker-stop-all; docker builder prune -af && docker image prune -af && docker system prune -af'
  docker-stop-all ; docker builder prune -af && docker image prune -af && docker system prune -af $argv;
end
