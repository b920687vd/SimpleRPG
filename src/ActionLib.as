package 
{
	import GameModel.ActionBase;
	/**
	 * ...
	 * @author WhiteWings
	 */
	public class ActionLib 
	{
		
		public function ActionLib() 
		{
			
		}
		
		public static var ActionModel:Vector.<GameModel.ActionBase>;
		public static function ActionModelInit():void{
			ActionLib.ActionModel = new Vector.<GameModel.ActionBase>();
			ActionLib.ActionModel[0] = new GameModel.ActionBase({
				name:"使用",
				action:function(content:Object = null):void
					{
						if(content)
						Main.One.debug(content.user.name+"使用了道具:" + content.useItem.name);
						else
						Main.One.debug("有人使用了道具")
					}
			})
		}
		
		public static function GetActionById(index:uint):GameModel.ActionBase{
			return ActionLib.ActionModel[index];
		}
		
		public static function GetActionByName(name:String):GameModel.ActionBase{
			for (var i:int = 0; i < ActionLib.ActionModel.length; i++ )
			{
				if (ActionLib.ActionModel[i].name == name)
				return ActionLib.ActionModel[i];
			}
			return null;
		}
		
	}

}