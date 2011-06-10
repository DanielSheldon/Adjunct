package net.whaleattack.adjunct.gm.services
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import net.whaleattack.adjunct.gm.events.SettingsEvent;
	import net.whaleattack.adjunct.gm.models.vo.SettingsVO;
	
	import org.robotlegs.mvcs.Actor;
	
	public class SettingsService extends Actor
	{
		[Inject]
		public var parser:SettingsParser;
		
		private var _settingsVO:SettingsVO;
		private var _loader:URLLoader;
		
		public function SettingsService()
		{
			super();
			
			_loader = new URLLoader();
		}
		
		public function loadSettings(settingsVO:SettingsVO):void
		{
			_settingsVO = settingsVO;
			
			addLoaderEvents();
			_loader.load(new URLRequest("game/settings.xml"));
		}
		
		private function onComplete(event:Event):void
		{
			var settings:SettingsVO = parser.parseSettings(XML(event.target.data), _settingsVO);
			
			dispatch(new SettingsEvent(SettingsEvent.LOADED, settings));
			
			removeLoaderEvents();
		}
		
		private function onError(event:IOErrorEvent):void
		{
			removeLoaderEvents()
		}
		
		private function addLoaderEvents():void
		{
			_loader.addEventListener(Event.COMPLETE, onComplete);
			_loader.addEventListener(IOErrorEvent.IO_ERROR, onError);
			_loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
		}
		
		private function removeLoaderEvents():void
		{
			_loader.removeEventListener(Event.COMPLETE, onComplete);
			_loader.removeEventListener(IOErrorEvent.IO_ERROR, onError);
			_loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
		}
	}
}