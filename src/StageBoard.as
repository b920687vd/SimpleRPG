package
{
	import GameModel.RoomBase;
	import GameModel.RoomObjBase;
	import Painter.PainterBrush;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	
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
			this.addChild(this.roomBg);
			this.addChild(this.stageBg);
			this.objBtnList = new Vector.<flash.display.SimpleButton>();
			//...
		}
		
		public function PicRefresh():void
		{
			this.roomBg.bitmapData
		}
		
		public var stageBg:Bitmap;
		public var roomBg:Bitmap;
		public var objBtnList:Vector.<SimpleButton>;
		
		public function drawObjBtn(obj:RoomObjBase):SimpleButton
		{
			var objBrush:Vector.<BitmapData> = PainterBrush.GetBrush(obj.brush, "0", "0");
			var objBtn:SimpleButton = new SimpleButton(new Bitmap(objBrush[0]),new Bitmap(objBrush[1]),new Bitmap(objBrush[2]),new Bitmap(objBrush[3]));
			//...
			return objBtn;
		}
		
		public function drawEnterRoom(room:RoomBase):void{
			//...
			this.stageBg.bitmapData = PainterBrush.GetBrush("stageBoard","0","0")[0];
			this.roomBg.bitmapData =  PainterBrush.GetBrush(room.bg, "0", "0")[0];
			if (room.roomObjList)
				drawObjBtnList(room.roomObjList);
		}
		
		public function drawObjBtnList(objList:Vector.<GameModel.RoomObjBase>):void{
			for (var i:int = 0; i < objList.length; i++ ){
				this.objBtnList.push(drawObjBtn(objList[i]))
				this.addChild(this.objBtnList[i]);
				this.objBtnList[i].x = 30 + 100 * i;
				this.objBtnList[i].y = 430;
			}
		}
		
		public function dispose():void
		{
			//...
		}
	
	}

}