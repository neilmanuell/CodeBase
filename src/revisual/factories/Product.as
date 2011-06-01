/**
 * Created by IntelliJ IDEA.
 * User: revisual.co.uk
 * Date: 11/01/11
 * Time: 12:40
 * To change this template use File | Settings | File Templates.
 */
package revisual.factories {
import revisual.factories.core.IProduct;

public class Product implements IProduct {

    private var _payload:Object;

    public function Product( payload:Object = null )
    {
        _payload = payload;
    }

    public function get product():Object
    {
        return _payload;
    }


    public function get isNull():Boolean
    {
        return ( _payload == null );
    }

}
}
