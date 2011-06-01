package revisual.file.filters
{
import revisual.file.core.IFile;
import revisual.filters.IFilter;

public class ImageFileFilter implements IFilter
{

    public function filter( ... args ):Boolean
    {
        var file:IFile = IFile( args[0] );
        return (
                file.type.toLowerCase() == ".jpg" ||
                file.type.toLowerCase() == ".png" ||
                file.type.toLowerCase() == ".gif"
                );
    }
}
}