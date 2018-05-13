package GameModel 
{
	/**
	 * ...
	 * @author AdamWhite
	 */
	public class RoomBase 
	{
		
		public function RoomBase(data:Object = null) 
		{
			//...
			if (!data)
				return;
			this.name = data.name?data.name:"";
			this.bg = data.bg?data.bg:"";
			if (data.roomObjList){
				this.roomObjList = new Vector.<GameModel.ObjRoom>();
				for (var i:int = 0; i < data.roomObjList.length; i++){
					this.roomObjList.push(new ObjRoom(data.roomObjList[i]))
				}
			}
		}
		public var name:String;
		public var bg:String;
		public var roomObjList:Vector.<ObjRoom>;
	}

}