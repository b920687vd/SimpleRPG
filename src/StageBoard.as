package
{
	import GameModel.RoomBase;
	import GameModel.RoomObjBase;
	import flash.display.Bitmap;
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
			var objBtn:SimpleButton = new SimpleButton();
			//...
			return objBtn;
		}
		
		public function drawEnterRoom(room:RoomBase){
			//...
		}
		
		public function drawObjBtnList(objList:Vector.<GameModel.RoomObjBase>):void{
			for (var i:int = 0; i < objList.length; i++ ){
				this.objBtnList.push(drawObjBtn(objList[i]))
				this.addChild(this.objBtnList[i]);
				this.objBtnList[i].x = 30 + 100 * i;
				this.objBtnList[i].y = 300;
			}
		}
		
		public function dispose():void
		{
			//...
		}
	
	}

}