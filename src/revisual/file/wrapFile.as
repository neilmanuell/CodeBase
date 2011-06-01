package revisual.file {
import flash.filesystem.File;

import revisual.file.core.IDirectory;
import revisual.file.core.IFile;

public function wrapFile( file:Object ):IFile {
    if ( file is IFile )return IFile( file );
    else if ( file is File ) return new FileWrapper( File( file ) );
    else if ( file is IDirectory )return  IDirectory( file ).ifile;
    else if ( file is String )return  new FileWrapper( new File( file.toString() ) );
    else return null;
}
}