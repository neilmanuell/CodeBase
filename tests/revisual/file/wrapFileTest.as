/**
 * User: revisual.co.uk
 * Date: 29/04/11
 * Time: 08:08
 */
package revisual.file {
import revisual.file.core.IFile;
import revisual.file.Directory;

import flexunit.framework.Assert;

import revisual.file.wrapFile;

public class wrapFileTest {


    [Test]
    public function wraps_File_in_IFile():void {
        const ifile:IFile = wrapFile( Directory.APPLICATION_DIRECTORY.file );
        Assert.assertStrictlyEquals( Directory.APPLICATION_DIRECTORY.file, ifile.file  );
    }

    [Test]
    public function wrapping_IFile_returns_instance_passed():void {
        const ifile:IFile = wrapFile( Directory.APPLICATION_DIRECTORY.ifile );
        Assert.assertStrictlyEquals( Directory.APPLICATION_DIRECTORY.ifile, ifile  );
    }

    [Test]
    public function wrapping_IDirectory_returns_its_ifile_property():void {
        const ifile:IFile = wrapFile( Directory.APPLICATION_DIRECTORY );
        Assert.assertStrictlyEquals( Directory.APPLICATION_DIRECTORY.ifile, ifile  );
    }

    [Test]
    public function wrapping_null_returns_null():void {
        const ifile:IFile = wrapFile( null );
        Assert.assertNull( ifile  );
    }

    [Test]
    public function wrapping_String_assumes_URL_and_returns_IFile():void {
       const url:String =  "file:///c:/test";
        const ifile:IFile = wrapFile( url );
        Assert.assertEquals( url, ifile.file.url  );
    }


}
}
