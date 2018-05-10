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
			this.brush = data.brush;
			this.name = data.name;
			this.model = data.model;
			if (data.actionList){
				this.actionList = new Vector.<GameModel.ActionBase>();
				for (var i:int = 0; i < data.actionList.length; i++ ){
					this.actionList.push(new GameModel.ActionBase(data.actionList[i]))
				}
			}
		}
		
		public var name:String;
		public var brush:String;
		public var model:Object;
		public var actionList:Vector.<GameModel.ActionBase>
		
	}

}