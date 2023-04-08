function ip --wraps='curl -s https://ipinfo.io/ip' --description 'alias ip curl -s https://ipinfo.io/ip'
  curl -s https://ipinfo.io/ip $argv
        
end
