if type -q hub
  function g
  	hub $argv;
  end
else
  function g
    git $argv;
  end
end
