package
{
	
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
		
		public function Test(){
			trace("Main Test Start")
			testActionBase();
			testActionLib();
			testItemBase();
			testItemLib();
		}
		
		public function testActionBase()
		{
			Main.One.debug("Test Action Base")
			var testAction:ActionBase = new ActionBase(
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
		
		public function testActionLib()
		{
			//...
			Main.One.debug("Test Action Lib")
			var testAction = ActionLib.GetActionById(0);
			testAction.action.apply();
		}
		
		public function testItemBase()
		{
			//...
		}
		
		public function testItemLib(){
			//...
		}
	
	}

}