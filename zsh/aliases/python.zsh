ruff-fix-file() { uv run ruff check --fix "$@" && uv run ruff format "$@"; }

ruff-fix() {
  local files=($(git diff --name-only --diff-filter=ACM HEAD | grep '\.py$'))
  if [[ ${#files[@]} -eq 0 ]]; then
    echo "No changed Python files."
    return 0
  fi
  uv run ruff check --fix "${files[@]}" && uv run ruff format "${files[@]}"
}
