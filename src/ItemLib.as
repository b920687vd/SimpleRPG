package 
{
	/**
	 * ...
	 * @author WhiteWings
	 */
	public class ItemLib 
	{
		
		public function ItemLib() 
		{
			
		}
		
		public static var ItemModel:Vector.<ItemBase>;
		public static function ItemModelInit():void{
			ItemLib.ItemModel = new Vector.<ItemBase>();
			ItemLib.ItemModel[0] = new ItemBase({
				name:"符文蛋",
				actionList:[ActionLib.GetActionById(0)]
			})
		}
		
		public static function CreateItemById(index:uint):ItemBase{
			return ItemLib.ItemModel[index].clone();
		}
		
		public static function CreateItemByName(name:String):ItemBase{
			for (var i:int = 0; i < ItemLib.ItemModel.length; i++ )
			{
				if (ItemLib.ItemModel[i].name == name)
				return ItemLib.ItemModel[i].clone();
			}
			return null;
		}
		
	}

}