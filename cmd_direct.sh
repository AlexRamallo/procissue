echo "Running g++ in shell with the following flags:";
echo "====================================================";
GCCARGS="$(g++ -Q --help=warning | sed -e 's/^\s*\(\-\S*\)\s*\[\w*\]/\1 /gp;d' | tr -d '\n')"
echo $GCCARGS
echo "====================================================";
g++ test/main.cpp -Wall -Wextra $GCCARGS
