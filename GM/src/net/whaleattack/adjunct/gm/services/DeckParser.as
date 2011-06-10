package net.whaleattack.adjunct.gm.services
{
	import net.whaleattack.adjunct.gm.models.vo.CardVO;
	import net.whaleattack.adjunct.gm.models.vo.DeckVO;

	public class DeckParser
	{
		public function DeckParser()
		{
		}
		
		public function parseDeck(deck:XML):DeckVO
		{
			var deckVO:DeckVO = new DeckVO();
			
			deckVO.name = deck.@name;
			
			for each(var card:XML in deck.card)
			{
				var cardVO:CardVO = new CardVO();
				cardVO.title = card.@title;
				cardVO.content = card.content;
				
				deckVO.cards.push(cardVO);
			}
			
			return deckVO;
		}
	}
}