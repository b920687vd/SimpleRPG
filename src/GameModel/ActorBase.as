package GameModel 
{
	/**
	 * ...
	 * @author WhiteWings
	 */
	public class ActorBase 
	{
		
		public function ActorBase(data:Object = null) 
		{
			super();
			for (var i:String in data){
				this[i] = data[i]
			}
		}
		
		public var name:String;
		public var model:Object;
		
	}

}