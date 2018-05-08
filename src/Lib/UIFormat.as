package Lib
{
	import flash.text.TextFormat;

	public class UIFormat
	{
		public function UIFormat()
		{
			
		}
		
		public static var ButtonFormat:TextFormat = new TextFormat("微软雅黑",40,0xFFFFFF,false,null,null,null,null,"center");
		public static var numFormat:TextFormat = new TextFormat("微软雅黑 light",16,0xFFFFFF,false,null,null,null,null,"center")
		public static var TipTextFormat:TextFormat = new TextFormat("微软雅黑 light",36,0x000000,false,null,null,null,null,"center");
		public static var TextAreaFormat:TextFormat = new TextFormat("微软雅黑",40,0xFFFFFF,false,null,null,null,null,"left",null,null,null,4);
	}
}