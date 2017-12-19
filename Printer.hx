import Sys;
using StringTools;

//Program that prints gibberish
class Printer{
	public static function main(){
		var args = Sys.args();
		var lines:Int = Std.parseInt(args[0]);
		var chars:Int = args.length>1?Std.parseInt(args[1]):10;

		for(i in 0...lines){
			for(v in 0...chars){
				var cc_start = 33;
				var cc_end = 126;
				var col1 = Std.string(Math.round(Math.random()*8));
				var col2 = Std.string(Math.round(Math.random()*8));
				Sys.print('\x1B[3${col1};4${col2}m');
				var c = String.fromCharCode(cc_start+Std.int(Math.random() * (cc_end - cc_start)));
				Sys.print(c);
			}
			Sys.print('\x1B[0m\n');
		}
		Sys.exit(2);
	}
}
