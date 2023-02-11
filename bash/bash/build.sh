#!/bin/bash
set -e

cd `dirname $BASH_SOURCE`
start=$(date +%s)

output="pp-docker-compose"
echo "begin build"
echo " - 0.sh"
cat src/0.sh > "$output"
chmod a+x "$output"
echo "Command='$output'" >> "$output"

files=(
    var
    project
    main
)

for file in "${files[@]}";do
    echo " - $file.sh"
    echo '

'>> "$output"

    echo "#### BEGIN $file.sh ### ">> "$output"
    cat "src/$file.sh" >> "$output"
    echo >> "$output"
    echo "#### END $file.sh ### ">> "$output"
done

end=$(date +%s)
echo "all build success, used $((end-start))s"
