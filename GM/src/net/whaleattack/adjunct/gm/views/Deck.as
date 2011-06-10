package net.whaleattack.adjunct.gm.views
{
	import net.whaleattack.adjunct.gm.models.vo.DeckVO;
	
	import flash.display.Sprite;
	
	import libs.DeckBase;
	
	public class Deck extends DeckBase
	{
		private var _deck:DeckVO;
		
		public function Deck()
		{
			super();
		}

		private function initUI():void
		{
			tfLabel.text = deck.name;
		}
		
		
		public function get deck():DeckVO
		{
			return _deck;
		}

		public function set deck(value:DeckVO):void
		{
			_deck = value;
			initUI();
		}

	}
}