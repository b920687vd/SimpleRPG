package GameModel
{
	import flash.geom.Point;
	
	/**
	 * 
	 * ...
	 * @author WhiteWings
	 */
	public class MapBase
	{
		public function MapBase()
		{
			//...
			this.roomList = new Vector.<GameModel.RoomBase>();
			this.adjList = new Vector.<Vector.<int>>();
		}
		
		public var roomList:Vector.<RoomBase>;
		public var adjList:Vector.<Vector.<int>>;
		
		/**
		 * 向顶点列表中添加新房间
		 * @param	room
		 */
		public function addRoom(room:RoomBase){
			this.roomList.push(room);
			this.adjList.push(new Vector.<int>());
		}
		
		/**
		 * 将两个房间相连
		 * 建立对应邻接表
		 * @param	rA
		 * @param	rB
		 */
		public function link(rA:int, rB:int)
		{
			//...
			var adjA:Vector.<int> = adjList[rA];
			var adjB:Vector.<int> = adjList[rB];
			if (adjA.indexOf(rB) ==-1){
				adjA.push(rB);
			}
			if (adjB.indexOf(rA) ==-1){
				adjB.push(rA);
			}
		}
		
		/**
		 * 将两张地图（地区）以两个点为连接点连接为一张新地图并返回
		 * @param	mapA
		 * @param	mapB
		 * @param	rA
		 * @param	rB
		 * @return
		 */
		public static function linkMap(mapA:MapBase, mapB:MapBase, rA:int, rB:int):MapBase{
			var linkedMap:MapBase = new MapBase();
			linkedMap.roomList = mapA.roomList.concat(mapB.roomList);
			var currAdjLine:Vector.<int>
			for (var i:int = 0; i < mapB.adjList.length; i++ ){
				currAdjLine = mapB.adjList[i];
				for (var k:int = 0; k < currAdjLine.length; k++ ){
					currAdjLine[k] += mapA.roomList.length;
				}
			}
			linkedMap.adjList = mapA.adjList.concat(mapB.adjList);
			linkedMap.link(rA,rB+mapA.roomList.length)
			return linkedMap;
		}
	
	}

}