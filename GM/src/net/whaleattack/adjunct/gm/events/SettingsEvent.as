package net.whaleattack.adjunct.gm.events
{
	import flash.events.Event;
	
	import net.whaleattack.adjunct.gm.models.vo.SettingsVO;
	
	public class SettingsEvent extends Event
	{
		public static const LOADED:String = "SettingsEvent.loaded";
		public static const LOAD:String = "SettingsEvent.load";
		
		private var _source:String;
		public function get source():String
		{
			return _source;
		}
		
		public function SettingsEvent(type:String, source:String=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_source = source;
		}
		
		override public function clone():Event
		{
			return new SettingsEvent(type, source, bubbles, cancelable);
		}
	}
}