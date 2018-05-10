package
{
	import GameModel.ActionBase;
	import Lib.ActionLib;
	import Painter.PainterBrush;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author WhiteWings
	 */
	public class MainTest
	{
		
		public function MainTest()
		{
			//...
		}
		
		public function Test():void{
			trace("Main Test Start")
			testActionBase();
			testActionLib();
			testItemBase();
			testItemLib();
			testRoomBase();
		}
		
		public function testActionBase():void
		{
			Main.Instance.debug("Test Action Base")
			var testAction:GameModel.ActionBase = new GameModel.ActionBase(
				{
					name: "使用",
					action: function(content:Object = null):void
					{
						Main.Instance.debug(content.user.name+"使用了道具:"+content.useItem.name);
					}
				}
			)
			testAction.action({
				user:{name:"主角"},
				useItem:{name:"未知药水"}
			}
			);
		}
		
		public function testActionLib():void
		{
			//...
			Main.Instance.debug("Test Action Lib")
			var testAction:ActionBase = Lib.ActionLib.GetActionById(0);
			testAction.action.apply();
		}
		
		public function testItemBase():void
		{
			//...
		}
		
		public function testItemLib():void{
			//...
		}
		
		public function testRoomBase():void{
			//...
			PainterBrush.LoadBrush("pic/systemColl")
			PainterBrush.LoadBrush("pic/stageOne", testActionLoaded);
		}
		
		public function testActionLoaded(e:Event):void{
			PainterBrush.LoadBrush("pic/action", testBrushLoaded);
		}
		public function testBrushLoaded(e:Event):void{
			var stageRoom:StageBoard = new StageBoard();
			Main.Instance.addChild(stageRoom);
			stageRoom.drawEnterRoom(new GameModel.RoomBase({name:"废弃城堡 - 岩石大厅", bg:"bg1", roomObjList:[
			{name:"钱袋",brush:"button-action-money",actionList:[{name: "使用",
					action: function(content:Object = null):void
					{
						Main.Instance.debug(content.user.name+"使用了道具:"+content.useItem.name);
					}},
					{name: "吃掉",
					action: function(content:Object = null):void
					{
						Main.Instance.debug(content.user.name+"使用了道具:"+content.useItem.name);
					}},
					{name: "投掷",
					action: function(content:Object = null):void
					{
						Main.Instance.debug(content.user.name+"使用了道具:"+content.useItem.name);
					}}]},
			{brush:"button-action-attack"},
			{brush:"button-action-info"},
			{brush:"button-action-force"},
			{brush:"button-action-level"},
			{brush:"button-action-work"}]}))
		}
	
		
	}

}