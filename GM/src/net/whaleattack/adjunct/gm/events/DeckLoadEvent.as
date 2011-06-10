package net.whaleattack.adjunct.gm.events
{
	import flash.events.Event;
	
	public class DeckLoadEvent extends Event
	{
		public static const LOAD:String = "DeckLoadEvent.load";
		
		private var _source:String;
		public function get source():String
		{
			return _source;
		}
		
		public function DeckLoadEvent(type:String, source:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_source = source;
		}
		
		override public function clone():Event
		{
			return new DeckLoadEvent(type, source, bubbles, cancelable);
		}
	}
}