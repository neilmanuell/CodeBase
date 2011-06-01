/**
 * User: revisual.co.uk
 * Date: 29/04/11
 * Time: 07:49
 */
package revisual.file.core {
import flash.filesystem.File;

public interface IDirectory {
    function get file():File;

    function get ifile():IFile;

    function equals( value:Object ):Boolean;
}
}
