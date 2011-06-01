/**
 * User: revisual.co.uk
 * Date: 29/04/11
 * Time: 07:51
 */
package revisual.file {
import flash.filesystem.File;

import revisual.file.core.IDirectory;
import revisual.file.core.IFile;

public class Directory implements IDirectory {

    public static const USER_DIRECTORY:IDirectory = new Directory( File.userDirectory );
    public static const DESKTOP_DIRECTORY:IDirectory = new Directory( File.desktopDirectory );
    public static const DOCUMENTS_DIRECTORY:IDirectory = new Directory( File.documentsDirectory );
    public static const APPLICATION_DIRECTORY:IDirectory = new Directory( File.applicationDirectory );
    public static const APPLICATION_STORAGE_DIRECTORY:IDirectory = new Directory( File.applicationStorageDirectory );

    private var _file:File;
    private var _ifile:IFile;

    public function Directory( file:File ) {
        _file = file;
        _ifile = wrapFile( file );
    }

    public function get file():File {
        return _file;
    }

    public function get ifile():IFile {
        return _ifile;
    }

    public function equals( value:Object ):Boolean {

        switch(true){

            case(value is IDirectory):
                return ( value === this );
            break;

            case(value is String):
            case(value is IFile):
            case(value is File):
                return _ifile.equals( value );
            break;

            default:
            return false

        }
    }
}
}
