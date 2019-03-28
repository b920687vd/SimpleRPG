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
			//超类方法可以获得数据
			super(itemData);
		}
		
		public function clone():ObjItem{
			var cloneItem:ObjItem = new ObjItem();
			cloneItem.name = this.name;
			cloneItem.brush = this.brush;
			cloneItem.model = JSON.parse(JSON.stringify(this.model));
			cloneItem.actionList = new Vector.<GameModel.ActionBase>();
			for (var i:int = 0; i < this.actionList.length; i++ ){
				cloneItem.actionList[i] = this.actionList[i];
			}
			return cloneItem;
		}
	}

}