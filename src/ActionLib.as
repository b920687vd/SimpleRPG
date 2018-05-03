package 
{
	/**
	 * ...
	 * @author WhiteWings
	 */
	public class ActionLib 
	{
		
		public function ActionLib() 
		{
			
		}
		
		public static var ActionModel:Vector.<ActionBase>;
		public static function ActionModelInit():void{
			ActionLib.ActionModel = new Vector.<ActionBase>();
			ActionLib.ActionModel[0] = new ActionBase({
				name:"使用",
				action:function(content = null)
					{
						if(content)
						Main.One.debug(content.user.name+"使用了道具:" + content.useItem.name);
						else
						Main.One.debug("有人使用了道具")
					}
			})
		}
		
		public static function GetActionById(index:uint):ActionBase{
			return ActionLib.ActionModel[index];
		}
		
		public static function GetActionByName(name:String):ActionBase{
			for (var i:int = 0; i < ActionLib.ActionModel.length; i++ )
			{
				if (ActionLib.ActionModel[i].name == name)
				return ActionLib.ActionModel[i];
			}
			return null;
		}
		
	}

}