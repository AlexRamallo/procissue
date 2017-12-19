echo "Compiling neko.hxml ...";
haxe neko.hxml;
echo "Running g++ through runner.n with the following flags:";
echo "====================================================";
GCCARGS="$(g++ -Q --help=warning | sed -e 's/^\s*\(\-\S*\)\s*\[\w*\]/\1 /gp;d' | tr -d '\n')"
echo $GCCARGS
echo "====================================================";
haxe neko.hxml;neko runner.n g++ test/main.cpp -Wall -Wextra $GCCARGS
