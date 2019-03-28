package System 
{
	/**
	 * ...
	 * @author AdamWhite
	 */
	public dynamic class GameNum 
	{
		
		public function GameNum() 
		{
			//...
			NumInit();
		}
		
		/**
		 * 初始化系统变量
		 * @param	data 可选初始参数
		 */
		public function NumInit(data:Object = null):void{
			life = data?data.life:90;
			maxLife = data?data.maxLife:90;
			gold = data?data.gold:99;
			itemNum = data?data.itemNum:0;
			reputation = data?data.reputation:0;
		}
		
		public var life:int;
		public var maxLife:int;
		public var gold:int;
		public var itemNum:int;
		public var reputation:int;
		
	}

}