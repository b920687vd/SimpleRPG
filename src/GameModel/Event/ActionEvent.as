package GameModel.Event 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author AdamWhite
	 */
	public class ActionEvent extends Event 
	{
		
		public function ActionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			
		}
		
		public static var ACTION_START:String = "actionStart";
		public var data:*;
		
	}

}