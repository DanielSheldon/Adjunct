package net.whaleattack.adjunct.gm
{
	import flash.display.DisplayObjectContainer;
	
	import net.whaleattack.adjunct.gm.controllers.LoadDeckCommand;
	import net.whaleattack.adjunct.gm.controllers.LoadSettingsCommand;
	import net.whaleattack.adjunct.gm.events.DeckLoadEvent;
	import net.whaleattack.adjunct.gm.events.SettingsEvent;
	import net.whaleattack.adjunct.gm.models.DeckModel;
	import net.whaleattack.adjunct.gm.models.SettingsModel;
	import net.whaleattack.adjunct.gm.services.DeckParser;
	import net.whaleattack.adjunct.gm.services.DeckService;
	import net.whaleattack.adjunct.gm.services.SettingsParser;
	import net.whaleattack.adjunct.gm.services.SettingsService;
	import net.whaleattack.adjunct.gm.views.Deck;
	import net.whaleattack.adjunct.gm.views.DeckMediator;
	import net.whaleattack.adjunct.gm.views.LoadScreen;
	import net.whaleattack.adjunct.gm.views.LoadScreenMediator;
	import net.whaleattack.adjunct.gm.views.Table;
	import net.whaleattack.adjunct.gm.views.TableMediator;
	
	import org.robotlegs.mvcs.Context;
	
	public class AdjunctContext extends Context
	{
		public function AdjunctContext(contextView:DisplayObjectContainer=null)
		{
			super(contextView);
		}
		
		override public function startup():void
		{
			injector.mapSingleton(DeckModel);
			injector.mapSingleton(SettingsModel);
			
			injector.mapSingleton(SettingsService);
			injector.mapSingleton(SettingsParser);
			
			injector.mapSingleton(DeckService);
			injector.mapSingleton(DeckParser);
			
			commandMap.mapEvent(SettingsEvent.LOAD, LoadSettingsCommand);
			commandMap.mapEvent(DeckLoadEvent.LOAD, LoadDeckCommand);
			
			
			mediatorMap.mapView(LoadScreen, LoadScreenMediator);
			mediatorMap.mapView(Deck, DeckMediator);
			mediatorMap.mapView(Table, TableMediator);
			
			contextView.addChild(new LoadScreen());
		}
	}
}