package net.whaleattack.adjunct.gm.component
{
	import net.whaleattack.adjunct.gm.models.DeckModel;
	import net.whaleattack.gameassistant.GameEvent;
	import net.whaleattack.adjunct.gm.views.Deck;
	import com.danielsheldon.ui.LayoutBox;
	import net.whaleattack.adjunct.gm.models.vo.DeckVO;
	
	import flash.display.Sprite;
	
	public class DeckManager extends Sprite
	{
		
		private var _dm:DeckModel;
		private var _decksContainer:LayoutBox;
		
		
		public function DeckManager()
		{
			super();
			initDecks();
		}
		
		private function initDecks():void
		{
			_dm = new DeckModel();
			_dm.addEventListener(GameEvent.LOADED, onDecksLoaded);
			_dm.source = "decks.xml";
			
		}
		
		private function onDecksLoaded(event:GameEvent):void
		{
			if(!_decksContainer)
			{
				_decksContainer = new LayoutBox();
				addChild(_decksContainer);
			}
			
			for each(var deck:DeckVO in _dm.decks)
			{
				var deckUI:Deck = new Deck();
				deckUI.deck = deck;
				_decksContainer.addChild(deckUI);
			}
		}
	}
}