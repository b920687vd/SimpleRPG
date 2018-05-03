package
{
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
			if (!Main.One)
				Main.One = this;
			ActionLib.ActionModelInit();
			ItemLib.ItemModelInit();
			this.debugText = new TextField();
			this.debugText.height = this.stage.height;
			this.addChild(this.debugText);
			var mainTest = new MainTest();
			trace("asdad")
			mainTest.Test();
		}
		
		public static var One:Main;
		
		public function debug(text:String){
			trace(text);
			this.debugText.text = this.debugText.text.concat("\n", text);
		}
		public var debugText:TextField;
		
	}
	
}