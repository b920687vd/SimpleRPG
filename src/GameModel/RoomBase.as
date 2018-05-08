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
			this.name = data.name;
			this.bg = data.bg;
			if (data.roomObjList){
				this.roomObjList = new Vector.<GameModel.RoomObjBase>();
				for (var i:int = 0; i < data.roomObjList.length; i++){
					this.roomObjList.push(new RoomObjBase(data.roomObjList[i]))
				}
			}
		}
		public var name:String;
		public var bg:String;
		public var roomObjList:Vector.<RoomObjBase>;
	}

}