/**
 * User: revisual.co.uk
 * Date: 02/05/11
 * Time: 16:18
 */
package revisual.factories.supporting {
import revisual.factories.core.ICreatable;
import revisual.factories.core.IProduct;
import revisual.factories.Product;

public class StubFactoryForTestingMacroFactory implements ICreatable {

    private var _item:Object;
    private var _key:Object;

    public function StubFactoryForTestingMacroFactory( item:Object, key:Object = null ) {
        _item = item;
        _key = key;
    }

    public function create( value:Object = null ):IProduct {
        if ( _key == null || value == _key )
            return new Product( _item );
        else
            return new Product( null );
    }
}
}
