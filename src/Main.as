package
{
	import Lib.ActionLib;
	import Lib.ItemLib;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author WhiteWings
	 */
	public class Main extends Sprite
	{
		
		public function Main()
		{
			if (!Main.Instance)
				Main.Instance = this;
			Lib.ActionLib.ActionModelInit();
			Lib.ItemLib.ItemModelInit();
			debugInit();
			mainTest();
		}
		
		/**
		 * 初始化测试输出元件
		 */
		public function debugInit():void{
			this.debugText = new TextField();
			this.debugText.height = this.stage.height;
			this.addChild(this.debugText);
		}
		
		/**
		 * 进行单元测试
		 */
		public function mainTest():void
		{
			var mainTest:MainTest = new MainTest();
			mainTest.Test();
		}
		
		public static var Instance:Main;
		
		/**
		 * 输出测试信息
		 * @param	text 待输出的信息文本
		 */
		public function debug(text:String):void
		{
			trace(text);
			this.debugText.appendText("\n".concat(text))
		}
		public var debugText:TextField;
	
	}

}