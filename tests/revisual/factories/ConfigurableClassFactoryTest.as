/**
 * User: revisual.co.uk
 * Date: 02/05/11
 * Time: 15:27
 */
package revisual.factories {
import org.flexunit.Assert;

import revisual.factories.supporting.TestFactoryKeyFilter;
import revisual.factories.supporting.TestKeyWithEqualsMethod;
import revisual.factories.supporting.TestProduct;

public class ConfigurableClassFactoryTest {

    private var factory:ConfigurableClassFactory;


    public function setUp( item:Class, key:Object ):void {
        factory = new ConfigurableClassFactory( item, key );
    }

    [After]
    public function tearDown():void {
        factory = null;
    }

    [Test]
    public function retrieve_product_with_correct_key__is_instance_of_class():void {

        const item:Class = TestProduct;
        const key:Object = {};

        setUp( item, key );
        Assert.assertTrue( factory.create( key ).product is TestProduct );

    }

    [Test]
    public function retrieve_product_with_incorrect_key__isNull():void {

        const item:Class = TestProduct;
        const key:Object = {};

        setUp( item, key );
        Assert.assertTrue( factory.create( "" ).isNull );

    }

    [Test]
    public function retrieve_product_with_equals_key_using_index__is_instance_of_class():void {

        const item:Class = TestProduct;
        const key:TestKeyWithEqualsMethod = new TestKeyWithEqualsMethod();

        setUp( item, key );
        Assert.assertTrue( factory.create( key.index ).product is TestProduct );

    }

    [Test]
    public function retrieve_product_with_equals_key_using_name__is_instance_of_class():void {

        const item:Class = TestProduct;
        const key:TestKeyWithEqualsMethod = new TestKeyWithEqualsMethod();

        setUp( item, key );
        Assert.assertTrue( factory.create( key.name ).product is TestProduct );

    }

    [Test]
    public function retrieve_product_with_equals_key_using_key__is_instance_of_class():void {

        const item:Class = TestProduct;
        const key:TestKeyWithEqualsMethod = new TestKeyWithEqualsMethod();

        setUp( item, key );
        Assert.assertTrue( factory.create( key ).product is TestProduct );

    }

    [Test]
    public function retrieve_product_with_equals_key_using_incorrect_key__isNull():void {

        const item:Class = TestProduct;
        const key:TestKeyWithEqualsMethod = new TestKeyWithEqualsMethod();

        setUp( item, key );
        Assert.assertTrue( factory.create(  ).isNull );

    }


    [Test]
    public function retrieve_product_with_filter_key_using_index__is_instance_of_class():void {

        const item:Class = TestProduct;
        const key:TestFactoryKeyFilter = new TestFactoryKeyFilter();

        setUp( item, key );
        Assert.assertTrue( factory.create( key.index ).product is TestProduct );

    }

    [Test]
    public function retrieve_product_with_filter_key_using_name__is_instance_of_class():void {

        const item:Class = TestProduct;
        const key:TestFactoryKeyFilter = new TestFactoryKeyFilter();

        setUp( item, key );
        Assert.assertTrue( factory.create( key.name ).product is TestProduct );

    }

     [Test]
    public function retrieve_product_with_filter_key_using_incorrect_key__isNull():void {

        const item:Class = TestProduct;
        const key:TestFactoryKeyFilter = new TestFactoryKeyFilter();

        setUp( item, key );
        Assert.assertTrue( factory.create(  ).isNull );

    }



    [Test(expects="ArgumentError")]
    public function adding_NULL_as_product_throws_error():void {

        const item:Class = TestProduct;
        const key:Object = {};

        setUp( null, key );

    }

    [Test(expects="ArgumentError")]
    public function adding_NULL_as_key_throws_error():void {

        const item:Class = TestProduct;
        const key:Object = null;

        setUp( item, key );

    }


}
}
