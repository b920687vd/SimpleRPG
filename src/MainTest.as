package
{
	import GameModel.ActionBase;
	import GameModel.MapBase;
	import GameModel.ObjItem;
	import GameModel.RoomBase;
	import System.ItemBag;
	import Lib.ActionLib;
	import Painter.PainterBrush;
	import Painter.StageBoard;
	import flash.events.Event;
	import flash.utils.Dictionary;
	
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
			testMapBase();
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
			var bag:ItemBag = new ItemBag();
			bag.addItem(new ObjItem({name:"钱袋",brush:"button-action-money",actionList:[
					{name: "吃掉",
					action: function(content:Object = null):void
					{
						Main.Instance.debug(content.user.name+"使用了道具:"+content.useItem.name);
					}},
					{name: "投掷",
					action: function(content:Object = null):void
					{
						Main.Instance.debug(content.user.name+"使用了道具:"+content.useItem.name);
					}}]}))
			bag.addItem(new ObjItem({name:"炸弹",brush:"button-action-money",actionList:[
					{name: "吃掉",
					action: function(content:Object = null):void
					{
						Main.Instance.debug(content.user.name+"使用了道具:"+content.useItem.name);
					}},
					{name: "投掷",
					action: function(content:Object = null):void
					{
						Main.Instance.debug(content.user.name+"使用了道具:"+content.useItem.name);
					}}]}))
			bag.addItem(new ObjItem({name:"钱袋",brush:"button-action-money",actionList:[
					{name: "吃掉",
					action: function(content:Object = null):void
					{
						Main.Instance.debug(content.user.name+"使用了道具:"+content.useItem.name);
					}},
					{name: "投掷",
					action: function(content:Object = null):void
					{
						Main.Instance.debug(content.user.name+"使用了道具:"+content.useItem.name);
					}}]}))
			trace("————————————————————————————————————————")
			trace("Test Bag")
			trace(bag.getTotalBag().join("|"));
		}
		
		public function testItemLib():void{
			//...
		}
		
		public function testRoomBase():void{
			//...
			PainterBrush.LoadBrush("pic/systemColl");
			PainterBrush.LoadPicAsBrush("pic/bg1");
			PainterBrush.LoadPicAsBrush("pic/stageBoard",_testActionLoaded);
			//PainterBrush.LoadBrush("pic/stageOne", _testActionLoaded);
		}
		
		private function _testActionLoaded(e:Event):void{
			PainterBrush.LoadBrush("pic/action", _testBrushLoaded);
		}
		
		private function _testBrushLoaded(e:Event):void{
			var stageRoom:Painter.StageBoard = new Painter.StageBoard();
			Main.Instance.addChild(stageRoom);
			stageRoom.drawEnterRoom(new GameModel.RoomBase({name:"废弃城堡 - 岩石大厅", bg:"pic/bg1", roomObjList:[
			{name:"钱袋",brush:"button-action-money",actionList:[
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
		
		public function testMapBase():void{
			var mapA:MapBase = new MapBase();
			mapA.addRoom(new RoomBase());
			mapA.addRoom(new RoomBase());
			mapA.addRoom(new RoomBase());
			mapA.addRoom(new RoomBase());
			var mapB:MapBase = new MapBase();
			mapB.addRoom(new RoomBase());
			mapB.addRoom(new RoomBase());
			
			mapA.link(0, 1);
			mapA.link(0, 3);
			
			mapB.link(0, 1);
			
			trace(mapA.adjList.join("||"));
			trace(mapB.adjList.join("||"));
			
			var mapC:MapBase = MapBase.linkMap(mapA, mapB, 1, 1);
			
			trace(mapC.roomList);
			trace(mapC.adjList.join("||"));
		}
	
		
	}

}