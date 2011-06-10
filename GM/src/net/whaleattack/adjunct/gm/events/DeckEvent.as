package net.whaleattack.adjunct.gm.events
{
	import flash.events.Event;
	
	import net.whaleattack.adjunct.gm.models.vo.DeckVO;
	
	public class DeckEvent extends Event
	{
		public static const LOADED:String = "DeckEvent.loaded";
		
		private var _deck:DeckVO;
		public function get deck():DeckVO
		{
			return _deck;
		}
		
		public function DeckEvent(type:String, deck:DeckVO, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_deck = deck;
		}
		
		override public function clone():Event
		{
			return new DeckEvent(type, deck, bubbles, cancelable);
		}
	}
}