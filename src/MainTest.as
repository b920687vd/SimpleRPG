package
{
	import GameModel.ActionBase;
	
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
		}
		
		public function testActionBase():void
		{
			Main.One.debug("Test Action Base")
			var testAction:GameModel.ActionBase = new GameModel.ActionBase(
				{
					name: "使用",
					action: function(content = null)
					{
						Main.One.debug(content.user.name+"使用了道具:"+content.useItem.name);
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
			Main.One.debug("Test Action Lib")
			var testAction = ActionLib.GetActionById(0);
			testAction.action.apply();
		}
		
		public function testItemBase():void
		{
			//...
		}
		
		public function testItemLib():void{
			//...
		}
	
	}

}