package net.whaleattack.adjunct.gm.views
{
	import net.whaleattack.adjunct.gm.events.DeckEvent;
	import net.whaleattack.adjunct.gm.events.DeckLoadEvent;
	import net.whaleattack.adjunct.gm.events.SettingsEvent;
	import net.whaleattack.adjunct.gm.models.DeckModel;
	import net.whaleattack.adjunct.gm.models.SettingsModel;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class LoadScreenMediator extends Mediator
	{
		[Inject]
		public var view:LoadScreen;
		
		[Inject]
		public var deckModel:DeckModel;
		
		[Inject]
		public var settingsModel:SettingsModel;
		
		override public function onRegister():void
		{
			// TODO: Should be passed the url instead of hardcoded
			eventDispatcher.dispatchEvent(new SettingsEvent(SettingsEvent.LOAD, "game/settings.xml"));
			
			addContextListener(SettingsEvent.LOADED, onSettings);
		}
		
		private function onSettings(event:SettingsEvent):void
		{
			addContextListener(DeckEvent.LOADED, onDeck);
			addContextListener(DeckEvent.ERROR, onDeck);
			
			loadNextDeck();
		}
		
		private function onDeck(event:DeckEvent):void
		{
			trace(event.deck);
			
			if(event.type != DeckEvent.ERROR)
			{
				deckModel.addDeck(event.deck);
			}
			
			loadNextDeck();
		}
		
		private function loadNextDeck():void
		{
			var source:String = settingsModel.getNextDeck();
			
			if(source != "")
			{
				loadDeck(source);
			}else{
				contextView.addChild(new Table());
				contextView.removeChild(view);
			}
		}
		
		private function loadDeck(deck:String):void
		{
			eventDispatcher.dispatchEvent(new DeckLoadEvent(DeckLoadEvent.LOAD, settingsModel.settingsVO.sourceDirectory + deck));
		}
	}
}