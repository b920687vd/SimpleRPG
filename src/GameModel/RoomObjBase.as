package GameModel 
{
	import GameModel.ActionBase;
	/**
	 * ...
	 * @author AdamWhite
	 */
	public class RoomObjBase 
	{
		
		public function RoomObjBase(data:Object = null) 
		{
			//...
			if (!data)
				return;
			this.brush = data.brush
			if (data.actionList){
				this.actionList = new Vector.<GameModel.ActionBase>();
				for (var i = 0; i < data.actionList.length; i++ ){
					this.actionList.push(new GameModel.ActionBase(data.actionList[i]))
				}
			}
		}
		
		public var brush:String;
		public var model:Object;
		public var actionList:Vector.<GameModel.ActionBase>
	}

}