/**
 * User: revisual.co.uk
 * Date: 29/04/11
 * Time: 08:08
 */
package revisual.file {
import revisual.file.core.IFile;
import revisual.file.Directory;

import flexunit.framework.Assert;

import revisual.file.wrapFiles;

public class wrapFilesTest {


    [Test]
    public function wraps_assorted_types_in_IFile():void {
        const toWrap:Array =
              [
                  Directory.APPLICATION_DIRECTORY,
                  Directory.APPLICATION_STORAGE_DIRECTORY.file,
                  Directory.DESKTOP_DIRECTORY.ifile,
                  "file:///c:/test"
              ];

        const expected:Array =
              [
                  Directory.APPLICATION_DIRECTORY.file.url,
                  Directory.APPLICATION_STORAGE_DIRECTORY.file.url,
                  Directory.DESKTOP_DIRECTORY.file.url,
                  "file:///c:/test"
              ];

        const got:Array = wrapFiles( toWrap );

        Assert.assertEquals( expected.length, got.length );

        for ( var i:int = 0; i < expected.length; i++ ) {
            var ifile:IFile = got[i] as IFile;
            var expectedURL:String = expected[i];
            Assert.assertEquals( expectedURL, ifile.file.url );


        }

    }


}
}
