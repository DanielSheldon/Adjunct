package net.whaleattack.adjunct.gm.models
{
	import net.whaleattack.adjunct.gm.models.vo.DeckVO;
	
	import org.robotlegs.mvcs.Actor;

	public class DeckModel extends Actor
	{
		private var _decks:Vector.<DeckVO>;
		
		public function DeckModel()
		{
			_decks = new Vector.<DeckVO>;
		}
		
		public function addDeck(deck:DeckVO):void
		{
			_decks.push(deck);
		}

	}
}