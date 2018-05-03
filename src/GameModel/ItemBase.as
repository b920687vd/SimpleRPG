package GameModel 
{
	import GameModel.ActionBase;
	/**
	 * ...
	 * @author WhiteWings
	 */
	public class ItemBase 
	{
		
		public function ItemBase(itemData = null)
		{
			this.name = itemData.name;
			
		}
		
		public var name:String;
		public var icon:String;
		public var model:Object;
		public var actionList:Vector.<GameModel.ActionBase>
		public function clone():ItemBase{
			var cloneItem:ItemBase = new ItemBase();
			cloneItem.name = this.name;
			cloneItem.actionList = new Vector.<GameModel.ActionBase>();
			for (var i:int = 0; i < this.actionList.length; i++ ){
				cloneItem.actionList[i] = this.actionList[i];
			}
			return cloneItem;
		}
	}

}