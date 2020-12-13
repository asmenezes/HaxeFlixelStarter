package;
class FSM
{
    public var stack = [];

    public function new()
    {
        stack = [];
    }

    public function update()
    {
        var activeState = getCurrentState();
        if(activeState != null){
        activeState();
    }}
    public function popState(){
      return stack.pop();
    }
    public function pushState(newState){
      if(getCurrentState() != newState){
        stack.push(newState);
      }
    }
    public function getCurrentState(){
      return stack.length > 0 ? stack[stack.length - 1]: null;
    }
}
