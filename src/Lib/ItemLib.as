package Lib 
{
	import GameModel.ObjItem;
	import Lib.ActionLib;
	/**
	 * ...
	 * @author WhiteWings
	 */
	public class ItemLib 
	{
		
		public function ItemLib() 
		{
			
		}
		
		public static var ItemModel:Vector.<GameModel.ObjItem>;
		public static function ItemModelInit():void{
			ItemLib.ItemModel = new Vector.<GameModel.ObjItem>();
			ItemLib.ItemModel[0] = new GameModel.ObjItem({
				name:"符文蛋",
				actionList:[Lib.ActionLib.GetActionById(0)]
			})
		}
		
		public static function CreateItemById(index:uint):GameModel.ObjItem{
			return ItemLib.ItemModel[index].clone();
		}
		
		public static function CreateItemByName(name:String):GameModel.ObjItem{
			for (var i:int = 0; i < ItemLib.ItemModel.length; i++ )
			{
				if (ItemLib.ItemModel[i].name == name)
				return ItemLib.ItemModel[i].clone();
			}
			return null;
		}
		
	}

}