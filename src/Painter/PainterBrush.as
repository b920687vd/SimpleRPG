package Painter 
{
	import Main;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.filesystem.File;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	import flash.events.Event;
	/**
	 * ...
	 * @author Adam White
	 */
	public class PainterBrush 
	{
		
		public function PainterBrush() 
		{
			
		}
		
		public static var Brush:Dictionary = new Dictionary();
		private static var brushLoadedList:Dictionary = new Dictionary();
		private static var brushLoaderDict:Dictionary = new Dictionary();
		private static var LoadedCallbackDict:Dictionary = new Dictionary();
		
		/**
		 * 加载笔刷文件
		 * @param	path
		 * @param	callback
		 */
		public static function LoadBrush(path:String,callback:Function = null,extraJson:String = null):void
		{
			loadBrushFile(extraJson?path:(path+".png"),"pic")
			loadBrushFile(extraJson?extraJson:(path+".json"),"json")
			
			LoadedCallbackDict[path] = callback;
			brushLoadedList[path] = new Array();
		}
		
		/**
		 * 加载单个笔刷文件
		 * todo:可能会扩充或转移至文件管理功能模块
		 * @param	path
		 * @param	type
		 */
		private static function loadBrushFile(path:String, type:String ):void{
			var filePath:File = File.applicationDirectory;
			Main.Instance.debug(filePath.url);
			var picPath:File = filePath.resolvePath(path)
			var brush_request:URLRequest = new URLRequest(picPath.nativePath);
			
			var brush_loader:*;
			if (type == "pic" || type == "music")
			{
				brush_loader = new Loader();
				brush_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, brushPicLoaded);
			}else if (type == "json" || type == "text"){
				brush_loader = new URLLoader();
				brush_loader.addEventListener(Event.COMPLETE, brushConfigLoaded);
			}
			brush_loader.load(brush_request);
			brushLoaderDict[brush_loader] = path;
		}
		
		/**
		 * 获取指定源，类型和状态的笔刷集
		 * @param	source
		 * @param	type
		 * @param	status
		 * @return
		 */
		public static function GetBrush(source:String,type:String = null,status:String = null):Vector.<BitmapData>
		{
			//...
			var askedBrush:Vector.<BitmapData> = Brush[source.concat("-", type, "-", status)];
			if (!askedBrush)
				return null;
			return askedBrush
		}
		
		/**
		 * 笔刷图片加载完成后的处理函数
		 * @param	e
		 */
		private static function brushPicLoaded(e:Event):void
		{
			var loader:Loader = e.target.loader as Loader;
			var path:String = brushLoaderDict[loader];
			
			Main.Instance.debug("Load Brush Pic Complete " + path);
			
			var loaded_arr:Array = brushLoadedList[path];
			var loaded_bmdata:BitmapData = new BitmapData(loader.width, loader.height, true, 0x00000000);
			loaded_bmdata.draw(loader, null, null, null, null, false);
			loaded_arr.push(loaded_bmdata);
			if (loaded_arr.length < 2)
				return;
			brushData(loaded_arr[1], loaded_arr[0]);
			if (LoadedCallbackDict[path])
				LoadedCallbackDict[path](e);
		}
		
		/**
		 * 笔刷设置加载完成后的处理函数
		 * @param	e
		 */
		private static function brushConfigLoaded(e:Event):void
		{
			var loader:URLLoader = e.target as URLLoader;
			var path:String = brushLoaderDict[loader];
			
			Main.Instance.debug("Load Brush Config Complete " + path);
			
			var loaded_arr:Array = brushLoadedList[path];
			var loaded_data:Object = JSON.parse(loader.data);
			loaded_arr.push(loaded_data);
			if (loaded_arr.length < 2)
				return;
			brushData(loaded_arr[0], loaded_arr[1]);
			if (LoadedCallbackDict[path])
				LoadedCallbackDict[path](e);
		}
		
		/**
		 * 切分笔刷整图，收纳入笔刷列表
		 * @param	bmdata
		 * @param	config_data
		 */
		private static function brushData(bmdata:BitmapData, config_data:Object):void
		{
			//Main.instance.addChild(new Bitmap(bmdata));
			var config_list:Array = config_data.list;
			for each(var config:Object in config_list)
			{
				Main.Instance.debug("dataing "+config.box_width+" "+config.box_height);
				var bmArr:Vector.<BitmapData> = new Vector.<BitmapData>();
				var bmClip:BitmapData = new BitmapData(config.box_width, config.box_height, true, 0x00000000);
				
				for (var i:int = 0; i < config.num; i++ )
				{
					bmClip.fillRect(bmClip.rect, 0x00000000);
					bmClip.copyPixels(bmdata, new Rectangle(config.begin_x + i * config.box_width, config.begin_y, config.box_width, config.box_height), new Point(), null, null, true);
					//bmClip.copyPixels(bmdata,new Rectangle(0,0,250,165),new Point(0,0),null,null,true);
					//Main.instance.addChild(new Bitmap(bmClip.clone()));
					bmArr.push(bmClip.clone());
				}
				Brush[config.source.concat("-", config.type, "-", config.status)] = bmArr;
			}
		}
	}

}