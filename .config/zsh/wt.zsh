function wt() {
  # set -xv
  if ! __wt_inGit; then
    # set +xv
    return 1
  fi

  if [[ $# -eq 0 ]]; then
    __wt_list
    # set +xv
    return 1
  fi

  # eval WT_TREE_ROOT=${WT_TREE_ROOT:-.worktrees}
  eval WT_TREE_ROOT=${WT_TREE_ROOT:-.wt}

  case "$1" in
    ls|list)
      __wt_list
      ;;

    new)
      __wt_new $2
      wt $2
      ;;

    rm|remove)
      __wt_remove $2
      ;;

    clean)
      __wt_clean
      ;;

    cd)
      __wt_cd_tree $2
      ;;

    *)
      __wt_cd_tree $1
      ;;
  esac
  # set +xv
}

__wt_inGit() {
  if ! git rev-parse --git-dir &>/dev/null; then
    echo "Not in a git repository"
    return 1
  fi
}

__wt_list() {
  git worktree list $*
}

__wt_base_list() {
  __wt_list --porcelain | rg 'worktree '
}

__wt_base_list_dirs() {
  __wt_base_list | cut -d ' ' -f2- | tail -n +2
}

__wt_list_branches() {
  for l in $(__wt_list | cut -d '[' -f2-); do
    echo ${l%?}
  done
}

__wt_list_names() {
  main_dir=$(__wt_main_dir)
  for l in $(__wt_base_list_dirs); do
    echo ${${l//$main_dir/}//\/${WT_TREE_ROOT}\//}
  done
}

__wt_cd_tree() {
  target_dir=$(__wt_target_dir $1)
  if [[ ! -n $target_dir ]]; then
    echo "No worktree for $1"
    return 1
  fi
  cd "$target_dir"
}

__wt_target_dir() {
  __wt_base_list | rg -m1 "$1" | cut -d ' ' -f2-
}

__wt_isBranch() {
  if git rev-parse --branch $1 &>/dev/null; then
    return 0
  else
    return 1
  fi
}

__wt_main_dir() {
  __wt_base_list | head -1 | cut -d ' ' -f2-
}

__wt_tree_root() {
  echo $(__wt_main_dir)/$WT_TREE_ROOT
}

__wt_new() {
  if __wt_isBranch "$1"; then
    git worktree add --guess-remote "$(__wt_tree_root)/$1" "$1"
  else
    git worktree add --guess-remote -b "$1" "$(__wt_tree_root)/$1"
  fi
}

__wt_remove() {
  git worktree remove $1
}

__wt_clean() {
  cd $(__wt_main_dir)
  for n in $(__wt_list_names); do
    __wt_remove $n
  done
  rm -rf $WT_TREE_ROOT
}
