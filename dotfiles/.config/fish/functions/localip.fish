function localip --wraps='ipconfig getifaddr en0' --description 'alias localip ipconfig getifaddr en0'
  ipconfig getifaddr en0 $argv
        
end
