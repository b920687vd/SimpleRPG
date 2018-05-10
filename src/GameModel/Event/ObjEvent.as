package GameModel.Event 
{
	import GameModel.ObjRoom;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author WhiteWings
	 */
	public class ObjEvent extends Event 
	{
		
		public function ObjEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			
		}
		
		public var data:ObjRoom;
		
		public static var OBJ_SELECTED:String = "objSelected";
		
	}

}