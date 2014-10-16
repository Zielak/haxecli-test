
package ;

import sys.io.File;
import sys.io.FileInput;

class Main 
{
    private static var _input:String;
    private static var _arg:Array<String>;
    private static var _filename:String;

    private static var _file:FileInput;

    public static function main():Void
    {
        _arg = Sys.args();
        _filename = _arg[0];

        // Good parameter?
        if( _filename.length <= 0 )
        {
            Sys.println("Stop messing around, give me something.");
            Sys.exit(2);
        }

        // File exists?
        if( !sys.FileSystem.exists(_filename) )
        {
            Sys.println("File doesn't exist, bro.");
            Sys.exit(1);
        }

        // Gogo
        _file = File.read( _filename, false );

        try
        {
            var str:String = "";
            while( !_file.eof() )
            {
                if(!_file.eof()) str = _file.readLine();
                if(str.length>0)
                {
                    Sys.println( str );
                }
            }
        }
        catch(e:haxe.io.Eof)
        {
            Sys.println("Looks like EOF.");
        }

        _file.close();


        // Done.
        Sys.println("I think I'm done, go check it.");
        _input = Sys.stdin().readLine();
        
    }


}
