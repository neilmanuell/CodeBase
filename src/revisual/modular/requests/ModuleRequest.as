package revisual.modular.requests {
import revisual.modular.core.IModuleRequest;
import revisual.modular.signals.ModuleRequestSignal;
import revisual.modular.signals.RequestCallbackSignal;

public class ModuleRequest implements IModuleRequest {

    private var _id:Object;
    private var _moduleRequestSignal:ISignal;
    private var _requestCallbackSignal:ISignal;

    public function get id():Object {
        return _id;
    }

    public function get callback():ISignal {
        return _requestCallbackSignal || ( _requestCallbackSignal = new RequestCallbackSignal());
    }

    [Inject]
    public function set moduleRequestSignal( value:ModuleRequestSignal ):void {
        _moduleRequestSignal = value;
    }

    public function requestData( id:Object ):void {
        _id = id;
        dispatchToModule();
    }

    public function setResults( result:Object ):void {
        callback.dispatch( result );
        dispose();
    }

    public function dispose():void {
        _moduleRequestSignal.removeAll();
        _requestCallbackSignal.removeAll();
        _moduleRequestSignal = null;
        _requestCallbackSignal = null;
        _id = null;
    }

    protected function dispatchToModule():void {
        _moduleRequestSignal.dispatch( this );
    }
}
}
