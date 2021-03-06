package Painter
{
	import GameModel.ActionBase;
	import System.LogicCenter;
	import GameModel.ActionChoice;
	import GameModel.Event.ActionEvent;
	import GameModel.Event.ObjEvent;
	import GameModel.RoomBase;
	import GameModel.ObjRoom;
	import Lib.UIFormat;
	import Painter.PainterBrush;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author AdamWhite
	 */
	public class StageBoard extends Sprite
	{
		
		public function StageBoard()
		{
			super();
			this.roomBg = new Bitmap();
			this.stageBg = new Bitmap();
			this.objBtnView = new Sprite();
			this.nameFiled = new TextField();
			this.menuView = new Sprite();
			this.menuLineList = new Vector.<flash.display.SimpleButton>();
			this.objBtnList = new Vector.<flash.display.SimpleButton>();
			
			this.nameFiled.width = 400;
			this.nameFiled.y = 10;
			this.nameFiled.mouseEnabled = false;
			this.nameFiled.defaultTextFormat = UIFormat.TipTextFormat;
			
			this.numLifeField = new TextField();
			this.numLifeField.width = 100;
			this.numLifeField.y = 120;
			this.numLifeField.mouseEnabled = false;
			this.numLifeField.defaultTextFormat = UIFormat.numFormat;
			
			this.numMoneyField = new TextField();
			this.numMoneyField.width = 100;
			this.numMoneyField.y = 175;
			this.numMoneyField.mouseEnabled = false;
			this.numMoneyField.defaultTextFormat = UIFormat.numFormat;
			
			this.numItemField = new TextField();
			this.numItemField.width = 100;
			this.numItemField.y = 230;
			this.numItemField.mouseEnabled = false;
			this.numItemField.defaultTextFormat = UIFormat.numFormat;
			
			this.numPeopleField = new TextField();
			this.numPeopleField.width = 100;
			this.numPeopleField.y = 285;
			this.numPeopleField.mouseEnabled = false;
			this.numPeopleField.defaultTextFormat = UIFormat.numFormat;
			
			this.addChild(this.roomBg);
			this.addChild(this.stageBg);
			this.addChild(this.objBtnView);
			this.addChild(this.nameFiled);
			this.addChild(this.numItemField);
			this.addChild(this.numLifeField);
			this.addChild(this.numMoneyField);
			this.addChild(this.numPeopleField);
			//...
		}
		
		public function PicRefresh():void
		{
			this.roomBg.bitmapData
		}
		
		public var stageBg:Bitmap;
		public var roomBg:Bitmap;
		
		public var nameFiled:TextField;
		public var numLifeField:TextField;
		public var numMoneyField:TextField;
		public var numItemField:TextField;
		public var numPeopleField:TextField;
		
		public var objBtnView:Sprite;
		public var objList:Vector.<GameModel.ObjRoom>;
		
		public var menuView:Sprite;
		public var menuLineList:Vector.<SimpleButton>
		
		public var objBtnList:Vector.<SimpleButton>;
		
		public function drawObjBtn(obj:ObjRoom):SimpleButton
		{
			var objBrush:Vector.<BitmapData> = PainterBrush.GetBrush(obj.brush, "0", "0");
			var objBtn:SimpleButton = new SimpleButton(new Bitmap(objBrush[2]),new Bitmap(objBrush[1]),new Bitmap(objBrush[3]),new Bitmap(objBrush[3]));
			//...
			return objBtn;
		}
		
		public function drawEnterRoom(room:RoomBase):void{
			//...
			drawBgUI(room)
			if (room.roomObjList)
				drawObjBtnList(room.roomObjList);
		}
		
		public function drawBgUI(room:RoomBase){
			this.stageBg.bitmapData = PainterBrush.GetBrush("pic/stageBoard","0","0")[0];
			this.roomBg.bitmapData =  PainterBrush.GetBrush(room.bg, "0", "0")[0];
			this.nameFiled.text = room.name;
			this.numItemField.text = LogicCenter.Instance.gameNum.itemNum.toString();
			this.numLifeField.text = LogicCenter.Instance.gameNum.life+"/"+LogicCenter.Instance.gameNum.maxLife;
			this.numMoneyField.text = LogicCenter.Instance.gameNum.gold.toString();
			this.numPeopleField.text = LogicCenter.Instance.gameNum.reputation.toString();
		}
		
		public function updateUINum(){
			this.numItemField.text = LogicCenter.Instance.gameNum.itemNum.toString();
			this.numLifeField.text = LogicCenter.Instance.gameNum.life+"/"+LogicCenter.Instance.gameNum.maxLife;
			this.numMoneyField.text = LogicCenter.Instance.gameNum.gold.toString();
			this.numPeopleField.text = LogicCenter.Instance.gameNum.reputation.toString();
		}
		
		public function drawObjBtnList(objList:Vector.<GameModel.ObjRoom>):void{
			this.objList = objList;
			for (var i:int = 0; i < objList.length; i++ ){
				this.objBtnList.push(drawObjBtn(objList[i]))
				this.objBtnView.addChild(this.objBtnList[i]);
				this.objBtnList[i].x = 130 + 100 * i;
				this.objBtnList[i].y = 330;
				this.objBtnList[i].addEventListener(MouseEvent.CLICK, selectObjBtn);
			}
		}
		
		public function selectObjBtn(e:MouseEvent){
			var btn:SimpleButton = e.currentTarget as SimpleButton;
			var objEvent:ObjEvent = new ObjEvent(ObjEvent.OBJ_SELECTED);
			objEvent.data = this.objList[this.objBtnList.indexOf(btn)]
			LogicCenter.Instance.cube.dispatchEvent(objEvent);
			showObjBtnMenu(btn)
		}
		
		public function showObjBtnMenu(btn:SimpleButton):void{
			var obj:ObjRoom = this.objList[this.objBtnList.indexOf(btn)];
			showMenuByList(obj.actionList, new Point(btn.x+btn.width/2, btn.y+btn.height/2));
			LogicCenter.Instance.cube.addEventListener(ActionEvent.ACTION_START, hideObjBtnMenu);
		}
		
		public function hideObjBtnMenu(e:ActionEvent):void{
			this.removeChild(this.menuView);
			LogicCenter.Instance.cube.removeEventListener(ActionEvent.ACTION_START, hideObjBtnMenu);
		}
		
		public function showMenuByList(actionList:Vector.<ActionBase>,point:Point):void{
			if (!actionList)
				return;
			for (var i:int = 0; i < actionList.length; i++ ){
				var newLine:SimpleButton = drawMenuLine(actionList[i]);
				this.menuLineList.push(newLine)
				this.menuView.addChild(newLine);
				newLine.y = i * 35;
			}
			this.addChild(this.menuView);
			this.menuView.x = point.x;
			this.menuView.y = point.y;
		}
		
		public function drawMenuLine(action:ActionBase):SimpleButton{
			var btnShape:BitmapData = PainterBrush.GetBrush("menuLine","0","0")[0];
			var btnSprite:Sprite = new Sprite();
			var btnName:TextField = new TextField();
			btnName.defaultTextFormat = UIFormat.numFormat;
			btnName.text = action.name;
			btnName.width = 100;
			btnSprite.addChild(new Bitmap(btnShape));
			btnSprite.addChild(btnName);
			var actionLi:ActionChoice = new ActionChoice(btnSprite,action.action)
			return actionLi;
		}
		
		public function dispose():void
		{
			//...
		}
	
	}

}