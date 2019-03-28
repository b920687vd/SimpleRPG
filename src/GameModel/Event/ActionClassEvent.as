package GameModel.Event 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author AdamWhite
	 */
	public class ActionClassEvent extends Event 
	{
		
		public function ActionClassEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
		}
		
		public static const HEAL:String = "heal";
		
		public var data:*;
		
	}

}