
package revisual.modular.core {
public interface IModule {

    function set parentInjector( value:IInjector ):void
    function injectClient( value:IInjector ):void;
    function dispose():void;
}
}