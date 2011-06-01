package revisual.file.core {
import flash.events.IEventDispatcher;
import flash.filesystem.File;

public interface IFile extends IEventDispatcher {

    function get exists():Boolean

    function get isDirectory():Boolean

    function get name():String

    function get type():String

    function get url():String

    function set url( value:String ):void

    function get file():File

    function get nativePath():String

    function get modificationDate():Date;

    function get creationDate():Date;

    function get parent():IFile;

    function resolvePath( path:String ):IFile;

    function clone():IFile;

    function createDirectory():void

    function browseForDirectory( title:String ):void;

    function browseForOpen( title:String, typeFilter:Array = null ):void;

    function browseForOpenMultiple( title:String, typeFilter:Array = null ):void;

    function browseForSave( title:String ):void

    function equals( value:Object ):Boolean;

}
}