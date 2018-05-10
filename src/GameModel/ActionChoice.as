package GameModel 
{
	import flash.display.DisplayObject;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import GameModel.Event.ActionEvent;
	
	/**
	 * ...
	 * @author AdamWhite
	 */
	public class ActionChoice extends SimpleButton 
	{
		
		public function ActionChoice(upState:DisplayObject,action:*) 
		{
			super(upState, upState, upState, upState);
			this.action = action;
			this.addEventListener(MouseEvent.CLICK,this.pushAction)
		}
		
		public function pushAction(e:MouseEvent):void{
			var newActionEvent:ActionEvent = new ActionEvent(ActionEvent.ACTION_START);
			newActionEvent.data = this.action;
			LogicCenter.Instance.cube.dispatchEvent(newActionEvent)
		}
		
		public var action:*;
		
	}

}