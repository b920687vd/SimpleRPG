package GameModel 
{
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author AdamWhite
	 */
	public class ActionCenter 
	{
		
		public function ActionCenter() 
		{
			this.CenterCube = new EventDispatcher()
			this.CenterCube.addEventListener(ActionEvent.ACTION_START, ActionStart)
			this.context = {
				user:{name:"主角"},
				useItem:{name:"未知药水"}
			}
		}
		
		public static var Instance:ActionCenter = new ActionCenter();
		
		public var CenterCube:EventDispatcher = new EventDispatcher();
		public var context:Object;
		
		private function ActionStart(e:ActionEvent){
			if (e.data is String){
				trace("Event str get")
			}else{
				trace("Event func get");
				e.data(this.context);
			}
		}
		
	}

}