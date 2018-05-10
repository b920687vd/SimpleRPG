package GameModel 
{
	import flash.events.EventDispatcher;
	import GameModel.Event.ActionEvent;
	import GameModel.Event.ObjEvent;
	/**
	 * ...
	 * @author AdamWhite
	 */
	public class LogicCenter 
	{
		
		public function LogicCenter() 
		{
			this.cube = new EventDispatcher()
			this.cube.addEventListener(ActionEvent.ACTION_START, ActionStart)
			this.cube.addEventListener(ObjEvent.OBJ_SELECTED, ObjSelected);
			this.context = {
				user:{name:"主角"},
				useItem:{name:"未知药水"}
			}
		}
		
		public static var Instance:LogicCenter = new LogicCenter();
		
		public var cube:EventDispatcher = new EventDispatcher();
		public var context:Object;
		
		private function ActionStart(e:ActionEvent):void{
			if (e.data is String){
				trace("Event str get")
			}else{
				trace("Event func get");
				e.data(this.context);
			}
		}
		
		public function ObjSelected(e:ObjEvent):void{
			this.context.useItem = e.data;
		}
		
	}

}