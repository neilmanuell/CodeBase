/**
 * User: revisual.co.uk
 * Date: 31/05/11
 * Time: 14:16
 */
package revisual.factories.supporting {
import revisual.filters.IFilter;

public class TestFactoryKeyFilter implements IFilter {

    public var name:String = "TestFactoryKeyFilter";
    public var index:int = 1;



    public function filter( ... args ):Boolean {
        const o:Object = args[0];
        return ( o == name || o == index );
    }
}
}
