cleanup.sh &&

folder="src"
output="src"

# build *.z files
args=()
while IFS= read -r -d '' file; do
    base="${file%.*}"
    rel="${file#$folder/}"
    outdir="$output/$(dirname "$rel")"
    mkdir -p "$outdir"
    out="$outdir/$(basename "${base}").py"
    args+=("$file" "$out")
done < <(find "$folder" -type f -name "*.z" -print0)
z --lang py --verbose "${args[@]}"