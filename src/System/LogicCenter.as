package System 
{
	import GameModel.ActionContent;
	import GameModel.MapBase;
	import flash.events.EventDispatcher;
	import GameModel.Event.ActionEvent;
	import GameModel.Event.ObjEvent;
	import GameModel.Event.ItemEvent;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author AdamWhite
	 */
	public class LogicCenter 
	{
		
		public function LogicCenter() 
		{
			this.cube = new EventDispatcher()
			this.cube.addEventListener(ActionEvent.ACTION_START, _actionStart)
			this.cube.addEventListener(ObjEvent.OBJ_SELECTED, _objSelected);
			this.context = new ActionContent({
				user:{name:"主角"},
				useItem:{name:"未知药水"}
			})
			this.gameNum = new GameNum();
		}
		
		public static var Instance:LogicCenter = new LogicCenter();
		
		public var cube:EventDispatcher = new EventDispatcher();
		/**
		 * 事件上下文
		 */
		public var context:ActionContent;
		
		public var gameNum:GameNum;
		public var itemBag:ItemBag;
		
		private function _actionStart(e:ActionEvent):void{
			if (e.data is String){
				trace("Event str get")
				
			}else{
				trace("Event func get");
				e.data(this.context);
			}
		}
		
		private function _objSelected(e:ObjEvent):void{
			this.context.useItem = e.data;
		}
		
		private function _itemSelected(e:ItemEvent):void{
			this.context.useItem = e.data;
		}
	}

}