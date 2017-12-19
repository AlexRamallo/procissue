import Sys;
import sys.io.Process;

/*
  Program that launches a sys.io.Process with the given command and arguments,
  reads the input from stdout and stderr one line at a time using `getLine`,
  and prints it out using Sys.println
*/
class Runner{
	public static function main(){
		Sys.println('Started runner');
		var sargs = Sys.args();
		
		var cmd = sargs[0];
		var args = sargs.splice(1, sargs.length - 1);
		
		Sys.println('Running command "$cmd" ...');
		var proc = new Process(cmd, args);
		
		Sys.println('started');	

		function readAll(inp){
			var eof = false;
			var ln = "";
			var ct = 0;
			while(!eof){
				try{
					//cmd.sh invocation will hang here
					ln = inp.readLine();
				}catch(e:Dynamic){
					eof = true;
				}
				ct++;
				Sys.println('  [$ct] READ: $ln');
			}
		}
		readAll(proc.stdout);
		readAll(proc.stderr);
		var ec = proc.exitCode(true);
		Sys.println('exit code == $ec');
		proc.close();
		
		Sys.println('... done');
	}
}
