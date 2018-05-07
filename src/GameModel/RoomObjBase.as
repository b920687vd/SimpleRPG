package GameModel 
{
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
		}
		
		public var brush:String;
		
	}

}