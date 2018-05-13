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
			for (var i:String in actionData)
			{
				if (i == "")
				{
					//...
				}
				{
					this[i] = actionData[i]
				}
			}
		}
		
		public var name:String;
		public var condition:Function;
		public var action:Function;
		
	}

}