LINES=100
COLS=50
echo "compiling neko.hxml ...";
echo "running printer through runner.n with $LINES lines and $COLS chars per line";
neko runner.n neko printer.n $LINES $COLS
