package GameModel 
{
	/**
	 * ...
	 * @author WhiteWings
	 */
	public class ActionBase 
	{
		
		public function ActionBase(actionData:Object = null) 
		{
			if (actionData){
				this.name = actionData.name;
				this.action = actionData.action;
			}
		}
		
		public var name:String;
		public var condition:Function;
		public var action:Function;
		
	}

}