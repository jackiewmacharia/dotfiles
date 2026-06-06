SHELL_NAME=$(basename $SHELL)
source <(kubectl completion $SHELL_NAME)

# Context switching
alias kcc='kubectl config get-contexts'
alias kctx='kubectx'
alias kns='kubens'

# Core
alias k='kubectl'
alias kg='kubectl get'
alias kd='kubectl delete'
alias ke='kubectl edit'
alias kl='kubectl logs'
alias klf='kubectl logs -f'

# Apply/delete from file
alias kaf='kubectl apply -f'
alias kdf='kubectl delete -f'

# Pods
alias kgp='kubectl get pods'
alias kgpw='watch kubectl get pods'
alias kdsp='kubectl describe pods'
alias kdp='kubectl delete pod'
alias keit='kubectl exec -it --'
alias ktp='kubectl top pods'

# Deployments
alias kgd='kubectl get deployments'
alias kgdw='watch kubectl get deployments'
alias kdsd='kubectl describe deployments'

# Services
alias kgs='kubectl get services'
alias kdss='kubectl describe services'

# Other resources
alias kgns='kubectl get namespaces'
alias kgn='kubectl get nodes'
alias ktn='kubectl top nodes'
alias kgev='kubectl get events'
alias kgcm='kubectl get configmaps'
alias kgsc='kubectl get secrets'
alias kgj='kubectl get jobs'
