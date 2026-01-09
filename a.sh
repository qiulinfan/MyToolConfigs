dir="$1"

if [ -z "$dir" ]; then
  dir="."
fi

touch "$dir/untitled.txt"
