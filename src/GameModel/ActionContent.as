package GameModel
{
	
	/**
	 * ...
	 * @author WhiteWings
	 */
	public dynamic class ActionContent
	{
		
		public function ActionContent(data:Object = null)
		{
			super();
			for (var i:String in data)
			{
				if (i == "user")
				{
					this.user = new ActorBase(data.user);
				}
				else if (i == "useItem")
				{
					this.useItem = new ObjBase(data.useItem);
				}
				else
				{
					this[i] = data[i]
				}
			}
		}
		
		public var user:ActorBase;
		public var useItem:ObjBase;
	
	}

}