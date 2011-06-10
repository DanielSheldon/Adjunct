package net.whaleattack.adjunct.gm.events
{
	import flash.events.Event;
	
	import net.whaleattack.adjunct.gm.models.vo.SettingsVO;
	
	public class SettingsEvent extends Event
	{
		public static const LOADED:String = "SettingsEvent.loaded";
		
		private var _settings:SettingsVO;
		public function get settings():SettingsVO
		{
			return _settings;
		}
		
		public function SettingsEvent(type:String, results:SettingsVO, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_settings = results;
		}
		
		override public function clone():Event
		{
			return new SettingsEvent(type, settings, bubbles, cancelable);
		}
	}
}