package revisual.modular {
import revisual.modular.core.IModule;

public class Module implements IModule {

    private var _injector:IInjector;

    public function get injector():IInjector {
        return _injector || ( _injector = new SwiftSuspendersInjector() );
    }

    public function injectClient( value:IInjector ):void {
        if ( _injector == null )  initiateModule();
        mapClassesToClient( value )
    }


    public function set parentInjector( value:IInjector ):void {
        _injector = value.createChild();
        initiateModule();
    }

     public function dispose():void {
        _injector = null;
    }

    protected function initiateModule():void {
        injector.mapValue( IInjector, injector );

        mapModuleClasses();

    }

    protected function mapModuleClasses():void {

    }

    protected function mapClassesToClient( value:IInjector ):void {

    }






}
}
