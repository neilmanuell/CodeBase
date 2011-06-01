package revisual.file {
import revisual.file.core.IFile;
import revisual.filters.IFilter;

public function wrapFiles( files:Array, filter:IFilter = null ):Array {
    var a:Array = [];
    for each ( var o:Object in files ) {
        var f:IFile = wrapFile( o );
        if ( filter == null || filter != null && filter.filter( f ) )
            a.push( f );

    }

    return a;
}
}