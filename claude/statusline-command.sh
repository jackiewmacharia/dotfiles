#!/bin/bash
# Claude Code statusLine: robbyrussell-style prompt plus usage details.
input=$(cat)
j() { printf '%s' "$input" | jq -r "$1 // empty" 2>/dev/null; }

# Abbreviate token counts: 950 -> 950, 12345 -> 12.3k, 1000000 -> 1M
fmt() {
  awk -v n="$1" 'BEGIN {
    if (n >= 1000000) { s = sprintf("%.1f", n / 1000000); sub(/\.0$/, "", s); print s "M" }
    else if (n >= 1000) { s = sprintf("%.1f", n / 1000); sub(/\.0$/, "", s); print s "k" }
    else print n + 0
  }'
}

dir=$(j '.workspace.current_dir // .cwd')
[ -z "$dir" ] && dir=$PWD

# robbyrussell part
out=$(printf '\033[32m➜\033[0m  \033[34m%s\033[0m' "$(basename "$dir")")
br=$(git -C "$dir" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null || git -C "$dir" --no-optional-locks rev-parse --short HEAD 2>/dev/null)
if [ -n "$br" ]; then
  out="$out $(printf '\033[35;1mgit:(\033[0;33m%s\033[35;1m)\033[0m' "$br")"
  [ -n "$(git -C "$dir" --no-optional-locks status --porcelain 2>/dev/null)" ] && out="$out $(printf '\033[33m✗\033[0m')"
fi

# usage details (each part omitted when its field is missing)
parts=("$(printf '\033[1;33m%s\033[0m' "$(/bin/date +%H:%M:%S)")")

model=$(j '.model.display_name')
model=$(printf '%s' "$model" | sed -E 's/ *\([^)]*context\)$//')
[ -n "$model" ] && parts+=("$(printf '\033[35m\033[1m%s\033[0m' "$model")")

tin=$(j '.context_window.total_input_tokens')
tout=$(j '.context_window.total_output_tokens')
io=""
[ -n "$tin" ] && io="in $(fmt "$tin")"
[ -n "$tout" ] && io="${io:+$io }out $(fmt "$tout")"

size=$(j '.context_window.context_window_size')
pct=$(j '.context_window.used_percentage')
if [ -n "$size" ]; then
  # tokens currently in context (current_usage when available, else total input)
  cur=$(j '.context_window.current_usage | select(type == "object") | (.input_tokens // 0) + (.cache_creation_input_tokens // 0) + (.cache_read_input_tokens // 0)')
  [ -z "$cur" ] && cur=$tin
  [ -n "$cur" ] && ctx="$(fmt "$cur")/$(fmt "$size")" || ctx="limit $(fmt "$size")"
  cc=32
  if [ -n "$pct" ]; then
    p=$(printf '%.0f' "$pct"); [ "$p" -gt 100 ] && p=100
    # color steps green -> yellow -> orange -> red (256-color)
    if   [ "$p" -ge 90 ]; then cc="38;5;196"
    elif [ "$p" -ge 75 ]; then cc="38;5;208"
    elif [ "$p" -ge 60 ]; then cc="38;5;214"
    elif [ "$p" -ge 45 ]; then cc="38;5;184"
    elif [ "$p" -ge 30 ]; then cc="38;5;112"
    else cc="38;5;41"; fi
    # smooth bar: 16 cells, eighth-block precision, on a dark track
    width=16
    eighths=$(( p * width * 8 / 100 ))
    full=$(( eighths / 8 )); rem=$(( eighths % 8 ))
    partials=(" " "▏" "▎" "▍" "▌" "▋" "▊" "▉")
    bar=""
    for ((i = 0; i < full; i++)); do bar="${bar}█"; done
    used=$full
    if [ "$used" -lt "$width" ]; then bar="${bar}${partials[$rem]}"; used=$((used + 1)); fi
    for ((i = used; i < width; i++)); do bar="${bar} "; done
    ctx="$(printf '\033[%s;48;5;237m%s\033[0m' "$cc" "$bar") \033[${cc}m${ctx}\033[0m"
  fi
  parts+=("$(printf '%b' "$ctx")")
fi

cost=$(j '.cost.total_cost_usd')
[ -n "$cost" ] && parts+=("$(printf '\033[33m$%.2f\033[0m' "$cost")")

# Normalize a reset value (epoch seconds, or ISO 8601 string) to epoch seconds.
to_epoch() {
  case "$1" in
    '') return ;;
    *[!0-9.]*)
      local s="${1%%.*}"; s="${s%Z}"; s="${s%%+*}"
      TZ=UTC /bin/date -j -f '%Y-%m-%dT%H:%M:%S' "$s" +%s 2>/dev/null ;;
    *) printf '%.0f' "$1" ;;
  esac
}

five=$(j '.rate_limits.five_hour.used_percentage')
week=$(j '.rate_limits.seven_day.used_percentage')
five_at=$(to_epoch "$(j '.rate_limits.five_hour.resets_at')")
week_at=$(to_epoch "$(j '.rate_limits.seven_day.resets_at')")
# Small, muted bar for rate limits: thin line, 8 cells, no background.
mini() {
  local p w=8 f i b=""
  p=$(printf '%.0f' "$1"); [ "$p" -gt 100 ] && p=100
  f=$(( (p * w + 50) / 100 )); [ "$p" -gt 0 ] && [ "$f" -eq 0 ] && f=1
  local c="38;5;67"; [ "$p" -ge 75 ] && c="38;5;173"; [ "$p" -ge 90 ] && c="38;5;167"
  for ((i = 0; i < f; i++)); do b="${b}━"; done
  b="\033[${c}m$b\033[38;5;238m"
  for ((i = f; i < w; i++)); do b="${b}━"; done
  printf '%s\033[0m' "$b"
}
rl=""
if [ -n "$five" ]; then
  rl="\033[38;5;245m5h\033[0m $(mini "$five") \033[38;5;245m$(printf '%.0f' "$five")%"
  [ -n "$five_at" ] && rl="$rl \033[1m$(/bin/date -r "$five_at" +%H:%M 2>/dev/null)\033[22m"
  rl="$rl\033[0m"
fi
if [ -n "$week" ]; then
  w="\033[38;5;245m7d\033[0m $(mini "$week") \033[38;5;245m$(printf '%.0f' "$week")%"
  [ -n "$week_at" ] && w="$w \033[1m$(/bin/date -r "$week_at" '+%a %H:%M' 2>/dev/null)\033[22m"
  rl="${rl:+$rl  }$w\033[0m"
fi
[ -n "$rl" ] && parts+=("$(printf '%b' "$rl")")

if [ ${#parts[@]} -gt 0 ]; then
  line=""
  sep=$(printf ' \033[38;5;246m│\033[0m ')
  for p in "${parts[@]}"; do line="${line:+$line$sep}$p"; done
  out="$line
$out"
fi

printf '%s' "$out"
