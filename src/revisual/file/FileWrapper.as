package revisual.file {
import flash.events.Event;
import flash.filesystem.File;

import revisual.file.core.IDirectory;
import revisual.file.core.IFile;

public class FileWrapper implements IFile {

    private var _client:File;

    public function FileWrapper( file:File ) {
        _client = file;
    }

    public function get exists():Boolean {
        return _client.exists;
    }

    public function get isDirectory():Boolean {
        return _client.isDirectory;
    }

    public function get name():String {
        return _client.name;
    }

    public function get type():String {
        return _client.type;
    }

    public function get url():String {
        return _client.url;
    }

    public function set url( value:String ):void {
        _client = new File( value );
    }

    public function get file():File {
        return _client;
    }

    public function createDirectory():void {
        //_client.createDirectory();
    }

    public function resolvePath( path:String ):IFile {
        return new FileWrapper( _client.resolvePath( path ) );
    }

    public function clone():IFile {
        return new FileWrapper( _client );
    }

    public function get nativePath():String {
        return _client.nativePath;
    }

    public function get parent():IFile {
        return wrapFile( _client.parent );
    }

    public function get modificationDate():Date {
        return _client.modificationDate;
    }

    public function get creationDate():Date {
        return _client.creationDate;
    }

    public function browseForDirectory( title:String ):void {
        _client.browseForDirectory( title );
    }

    public function browseForOpen( title:String, typeFilter:Array = null ):void {
        _client.browseForOpen( title, typeFilter );
    }

    public function browseForOpenMultiple( title:String, typeFilter:Array = null ):void {
        _client.browseForOpenMultiple( title, typeFilter );
    }


    public function browseForSave( title:String ):void {
        _client.browseForSave( title );
    }


    public function equals( value:Object ):Boolean {
        switch ( true ) {

            case(value is IDirectory):
                return ( value === this );
                break;

            case(value is IFile):
                return ( value === this || IFile( value ).url == this.url );
                break;

            case(value is File):
                return ( value === this.file || File( value ).url == this.url );
                break;

            case(value is String):
                return ( value == this.url );
                break;

            default:
                return false

        }
    }

    public function addEventListener( type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false ):void {
        _client.addEventListener( type, listener, useCapture, priority, useWeakReference );
    }

    public function removeEventListener( type:String, listener:Function, useCapture:Boolean = false ):void {
        _client.removeEventListener( type, listener, useCapture );
    }

    public function dispatchEvent( event:Event ):Boolean {
        return _client.dispatchEvent( event );
    }

    public function hasEventListener( type:String ):Boolean {
        return _client.hasEventListener( type );
    }

    public function willTrigger( type:String ):Boolean {
        return _client.willTrigger( type );
    }
}
}