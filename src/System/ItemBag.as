package System 
{
	import GameModel.ObjItem;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author AdamWhite
	 */
	public class ItemBag 
	{
		
		public function ItemBag() 
		{
			//...
			this._itemDict = new Dictionary();
		}
		
		private var _itemDict:Dictionary;
		
		/**
		 * 向背包中添加物品
		 * @param	item
		 * @return
		 */
		public function addItem(item:ObjItem):int{
			//...
			if (!hasItem(item.name))
			{
				_itemDict[item.name] = new Vector.<GameModel.ObjItem>();
			}
			var itemList:Vector.<ObjItem> = _itemDict[item.name]
			itemList.push(item);
			return itemList.length;
		}
		
		/**
		 * 获得指定名称的所有物品
		 * @param	itemName
		 * @return
		 */
		public function getItemList(itemName:String):Vector.<GameModel.ObjItem>{
			//...
			if (!hasItem(itemName))
				return null;
			return _itemDict[itemName];
		}
		
		/**
		 * 移除指定名称指定编号的物品
		 * @param	itemName
		 * @param	index
		 * @return
		 */
		public function removeItem(itemName:String,index:int):int{
			//...
			if (!hasItem(itemName))
				return 0;
			var itemList:Vector.<ObjItem> = getItemList(itemName);
			itemList.splice(index, 1);
			
			if (itemList.length == 0)
				_itemDict[itemName] = null;
			
			return itemList.length;
		}
		
		/**
		 * 检测背包中是否有指定名称的物品
		 * @param	itemName
		 * @return
		 */
		public function hasItem(itemName:String):Boolean{
			//...
			if (_itemDict[itemName])
				return true;
			return false;
		}
		
		/**
		 * 获得指定名称物品的数量
		 * @param	itemName
		 * @return
		 */
		public function getItemNum(itemName:String):int{
			if (!hasItem(itemName))
				return 0;
			var itemList:Vector.<ObjItem> = getItemList(itemName);
			return itemList.length;
		}
		
		/**
		 * 获得所有物品的数据队列
		 */
		public function getTotalBag():Vector.<ObjItem>{
			//...
			var itembag:Vector.<ObjItem> = new Vector.<GameModel.ObjItem>();
			for (var i:String in this._itemDict){
				itembag = itembag.concat(_itemDict[i]);
			}
			return itembag;
		}
		
		/**
		 * 获得背包内物品的总数量
		 * @return
		 */
		public function getBagNum():int{
			return getTotalBag.length;
		}
		
	}

}