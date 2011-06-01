/**
 * User: revisual.co.uk
 * Date: 02/05/11
 * Time: 15:27
 */
package revisual.factories {
import org.flexunit.Assert;

import revisual.factories.Product;

import revisual.factories.core.IProduct;

public class IProductTest {
    private var product:IProduct;

    public function setUp( payload:Object ):void {
        product = new Product( payload );
    }

    [After]
    public function tearDown():void {
        product = null
    }

    [Test]
    public function if_null_payload_is_passed_in_constructor_payload_property_returns_true():void {
        setUp( null );
        Assert.assertNull( product.product );
    }

    [Test]
    public function if_payload_is_null_isNull_returns_true():void {
        setUp( null );
        Assert.assertTrue( product.isNull );
    }

    [Test]
    public function if_payload_instance_is_passed_in_constructor__payload_property_is_strictly_equal():void {
        const item:Object = {};
        setUp( item );
        Assert.assertStrictlyEquals( item, product.product );
    }

    [Test]
    public function isNull_returns_false_if_payload_is_not_null():void {
        const item:Object = {};
        setUp( item );
        Assert.assertFalse( product.isNull );
    }
}
}
