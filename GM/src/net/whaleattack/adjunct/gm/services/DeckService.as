package net.whaleattack.adjunct.gm.services
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import net.whaleattack.adjunct.gm.events.DeckEvent;
	import net.whaleattack.adjunct.gm.models.vo.DeckVO;
	
	import org.robotlegs.mvcs.Actor;
	
	public class DeckService extends Actor
	{
		[Inject]
		public var _parser:DeckParser;
		
		public function DeckService()
		{
			super();
		}
		
		public function loadDeck(source:String):void
		{
			var loader:URLLoader = new URLLoader();
			addLoaderEvents(loader);
			loader.load(new URLRequest("game/" + source));
		}
		
		private function onComplete(event:Event):void
		{
			var deck:DeckVO = _parser.parseDeck(XML(event.target.data));
			dispatch(new DeckEvent(DeckEvent.LOADED, deck));
			
			removeLoaderEvents(URLLoader(event.target));
		}
		
		private function onError(event:IOErrorEvent):void
		{
			removeLoaderEvents(URLLoader(event.target))
		}
		
		private function addLoaderEvents(loader:URLLoader):void
		{
			loader.addEventListener(Event.COMPLETE, onComplete);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onError);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
		}
		
		private function removeLoaderEvents(loader:URLLoader):void
		{
			loader.removeEventListener(Event.COMPLETE, onComplete);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, onError);
			loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
		}
	}
}