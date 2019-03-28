package Lib
{
	import GameModel.ActionBase;
	import System.LogicCenter;
	import GameModel.Event.ActionClassEvent;
	
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
		
		public static function ActionModelInit():void
		{
			ActionLib.ActionModel = new Vector.<GameModel.ActionBase>();
			ActionLib.ActionModel[0] = new GameModel.ActionBase({name: "吃掉", action: function(content:Object = null):void
			{
				if (content)
				{
					//治疗生命值，数值等于使用物品的营养值 nutrition * 物品的质量 quality
					Main.Instance.debug(content.user.name + "吃掉了" + content.useItem.name);
					heal(content.useItem.nutrition*content.useItem.quality);
				}
				else
					Main.Instance.debug("有人吃掉了道具")
			}})
		}
		
		public static function GetActionById(index:uint):GameModel.ActionBase
		{
			return ActionLib.ActionModel[index];
		}
		
		public static function GetActionByName(name:String):GameModel.ActionBase
		{
			for (var i:int = 0; i < ActionLib.ActionModel.length; i++)
			{
				if (ActionLib.ActionModel[i].name == name)
					return ActionLib.ActionModel[i];
			}
			return null;
		}
		
		public static function heal(num:int):void{
			//...
			LogicCenter.Instance.gameNum.life += num
			if (LogicCenter.Instance.gameNum.life > LogicCenter.Instance.gameNum.maxLife)
				LogicCenter.Instance.gameNum.life = LogicCenter.Instance.gameNum.maxLife;
			var healAction:ActionClassEvent = new ActionClassEvent(ActionClassEvent.HEAL);
			healAction.data = {num:num};
			LogicCenter.Instance.cube.dispatchEvent(healAction)
		}
		
		public static function getItem(item:String):void{
			//...
		}
	
	}

}