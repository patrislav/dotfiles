# Remove the welcome message
set fish_greeting

# Set starship as the prompt
starship init fish | source

# Alias kubectl to k
if type -q kubectl
  alias k=kubectl
end
