package GameModel
{
	
	/**
	 * ...
	 * @author WhiteWings
	 */
	public class ObjBase
	{
		
		public function ObjBase(data:Object = null)
		{
			//...
			if (!data)
				return;
			for (var n:String in data)
			{
				if (n == "actionList")
				{
					this.actionList = new Vector.<GameModel.ActionBase>();
					for (var i:int = 0; i < data.actionList.length; i++)
					{
						this.actionList.push(new GameModel.ActionBase(data.actionList[i]))
					}
				}
				else
				{
					this[n] = data[n]
				}
			}
		}
		
		public var name:String;
		public var brush:String;
		public var model:Object;
		public var actionList:Vector.<GameModel.ActionBase>
	
	}

}