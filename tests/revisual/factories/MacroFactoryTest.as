/**
 * User: revisual.co.uk
 * Date: 02/05/11
 * Time: 15:27
 */
package revisual.factories {
import org.flexunit.Assert;

import revisual.factories.core.ICreatable;
import revisual.factories.supporting.StubFactoryForTestingMacroFactory;

public class MacroFactoryTest {

    private var factory:MacroFactory;

    [Before]
    public function setUp():void {
        factory = new MacroFactory();
    }

    [After]
    public function tearDown():void {
        factory = null
    }

    [Test]
    public function if_no_child_factories_registered_returns_null_IProduct():void {
        Assert.assertTrue( factory.create().isNull );
    }

    [Test]
    public function productive_factory__product_returned_isNotNull():void {
        const thingOne:Object = {};
        const factoryOne:ICreatable = new StubFactoryForTestingMacroFactory( thingOne );
        factory.addFactory( factoryOne );
        Assert.assertFalse( factory.create().isNull );
    }

    [Test]
    public function productive_factory__payload_returned_is_strictlyEqual_to_expected_value():void {
        const thingOne:Object = {};
        const factoryOne:ICreatable = new StubFactoryForTestingMacroFactory( thingOne );
        factory.addFactory( factoryOne );
        Assert.assertStrictlyEquals( thingOne, factory.create().product );
    }

    [Test]
    public function nonproductive_factory__product_returned_isNull():void {
        const factoryOne:ICreatable = new StubFactoryForTestingMacroFactory( null );
        factory.addFactory( factoryOne );
        Assert.assertTrue( factory.create().isNull );
    }

    [Test]
    public function productive_factory__retrieve_product_with_correct_key():void {
        const keyOne:Object = {};
        const thingOne:Object = {};
        const factoryOne:ICreatable = new StubFactoryForTestingMacroFactory( thingOne, keyOne );
        factory.addFactory( factoryOne );
        Assert.assertStrictlyEquals( thingOne, factory.create( keyOne ).product );
    }

    [Test]
    public function productive_factory__retrieve_product_with_incorrect_key():void {
        const keyOne:Object = {};
        const thingOne:Object = {};
        const factoryOne:ICreatable = new StubFactoryForTestingMacroFactory( thingOne, keyOne );
        factory.addFactory( factoryOne );
        Assert.assertTrue( factory.create( "" ).isNull );
    }

    [Test]
    public function two_productive_factories__retrieve_first_product_with_correct_key():void {

        const keyOne:Object = {};
        const thingOne:Object = {};
        const factoryOne:ICreatable = new StubFactoryForTestingMacroFactory( thingOne, keyOne );

        const keyTwo:Object = {};
        const thingTwo:Object = {};
        const factoryTwo:ICreatable = new StubFactoryForTestingMacroFactory( thingTwo, keyTwo );

        factory.addFactory( factoryOne );
        factory.addFactory( factoryTwo );

        Assert.assertStrictlyEquals( thingOne, factory.create( keyOne ).product );
    }

     [Test]
    public function two_productive_factories__retrieve_second_product_with_correct_key():void {
        const keyOne:Object = {};
        const thingOne:Object = {};
        const factoryOne:ICreatable = new StubFactoryForTestingMacroFactory( thingOne, keyOne );

        const keyTwo:Object = {};
        const thingTwo:Object = {};
        const factoryTwo:ICreatable = new StubFactoryForTestingMacroFactory( thingTwo, keyTwo );

        factory.addFactory( factoryOne );
        factory.addFactory( factoryTwo );

        Assert.assertStrictlyEquals( thingTwo, factory.create( keyTwo ).product );
    }

     [Test]
    public function two_productive_factories__retrieve_product_with_incorrect_key_isNull():void {
        const keyOne:Object = {};
        const thingOne:Object = {};
        const factoryOne:ICreatable = new StubFactoryForTestingMacroFactory( thingOne, keyOne );

        const keyTwo:Object = {};
        const thingTwo:Object = {};
        const factoryTwo:ICreatable = new StubFactoryForTestingMacroFactory( thingTwo, keyTwo );

        factory.addFactory( factoryOne );
        factory.addFactory( factoryTwo );
        Assert.assertTrue( factory.create( "" ).isNull );
    }

}
}
