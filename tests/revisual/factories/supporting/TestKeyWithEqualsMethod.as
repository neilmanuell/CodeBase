/**
 * User: revisual.co.uk
 * Date: 31/05/11
 * Time: 14:16
 */
package revisual.factories.supporting {

public class TestKeyWithEqualsMethod {

    public var name:String = "TestKeyWithEqualsMethod";
    public var index:int = 1;

    public function equals( value:Object ):Boolean {
        if( value == null ) return false;
        if( value == index )return true;
        if( value.toString() == name )return true;
        return ( value === this);
    }
}
}
