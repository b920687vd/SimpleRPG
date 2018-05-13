package GameModel.Event 
{
	import GameModel.ObjItem;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author WhiteWings
	 */
	public class ItemEvent extends Event 
	{
		
		public function ItemEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			
		}
		
		public var data:ObjItem;
		
		public static var ITEM_SELECTED:String = "itemSelected";
		
	}

}