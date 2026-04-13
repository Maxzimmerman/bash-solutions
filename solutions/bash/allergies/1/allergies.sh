#!/usr/bin/env bash
declare -A allergies=(
  [eggs]=1
  [peanuts]=2
  [shellfish]=4
  [strawberries]=8
  [tomatoes]=16
  [chocolate]=32
  [pollen]=64
  [cats]=128
)

ordered=(eggs peanuts shellfish strawberries tomatoes chocolate pollen cats)

score=$1    # ← was command=$1
command=$2  # ← was score=$2
item=$3

case "$command" in
  allergic_to)                          # ← was "allergicTo"
    value=${allergies[$item]}
    if (( value && (score & value) )); then
      echo "true"
    else
      echo "false"
    fi
    ;;
  list)
    result=()
    for allergen in "${ordered[@]}"; do
      value=${allergies[$allergen]}
      if (( score & value )); then
        result+=("$allergen")
      fi
    done
    echo "${result[*]}"   # prints all elements space-separated on one line
    ;;
  *)
    echo "Usage: $0 [allergic_to|list] <score> [allergen]"
    exit 1
    ;;
esac