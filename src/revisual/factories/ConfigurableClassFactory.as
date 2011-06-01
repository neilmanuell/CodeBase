/**
 * User: revisual.co.uk
 * Date: 02/05/11
 * Time: 16:18
 */
package revisual.factories {
import revisual.factories.core.ICreatable;
import revisual.factories.core.IProduct;
import revisual.filters.IFilter;

public class ConfigurableClassFactory implements ICreatable {

    private var _item:Class;
    private var _key:Object;

    public function ConfigurableClassFactory( item:Class, key:Object ) {

        if( item == null )throw new ArgumentError("factory class item can not be null");
        if( key == null )throw new ArgumentError("factory class key can not be null");

        _item = item;
        _key = key;

    }

    public function create( value:Object = null ):IProduct {

       if( _key is IFilter) {
           return getProduct( IFilter(_key).filter(value) );
       }

       if( _key.hasOwnProperty("equals")){
           return getProduct( _key.equals( value ) );
       }

        return getProduct(_key == value );
    }

    private function getProduct( equals:Boolean ):IProduct{
        return ( equals ) ? new Product( new _item ) : new Product( null );
    }
}
}
