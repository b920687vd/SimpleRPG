package GameModel 
{
	import GameModel.ActionBase;
	/**
	 * ...
	 * @author WhiteWings
	 */
	public class ObjItem extends ObjBase
	{
		
		public function ObjItem(itemData:Object = null)
		{
			super(itemData)
		}
		
		public function clone():ObjItem{
			var cloneItem:ObjItem = new ObjItem();
			cloneItem.name = this.name;
			cloneItem.actionList = new Vector.<GameModel.ActionBase>();
			for (var i:int = 0; i < this.actionList.length; i++ ){
				cloneItem.actionList[i] = this.actionList[i];
			}
			return cloneItem;
		}
	}

}