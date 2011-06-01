package revisual.factories {
import revisual.factories.core.ICreatable;
import revisual.factories.core.IProduct;

public class MacroFactory implements ICreatable {

    private var _list:Array;



    private function initiate():void
    {
        initiateFactory();
    }

    protected function initiateFactory():void {}

    public final function create( value:Object = null ):IProduct
    {

        if( list.length == 0 )return new Product( null );
        var n:int = list.length ;
        do {
            const factory:ICreatable = ICreatable( list[--n]);
            const result:Product = Product( factory.create( value ) );

            if ( !result.isNull ) return result;

        }

        while ( n > 0 );

        return result || new Product( null );
    }

    public final function addFactory( value:ICreatable ):void
    {
        list.unshift( value );
    }

    private function get list():Array{
        if ( _list == null ){
            _list = [];
            initiate();
        }
        return _list;
    }
}
}