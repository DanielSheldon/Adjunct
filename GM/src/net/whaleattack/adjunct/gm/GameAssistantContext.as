package net.whaleattack.adjunct.gm
{
	import flash.display.DisplayObjectContainer;
	
	import net.whaleattack.adjunct.gm.models.DeckModel;
	import net.whaleattack.adjunct.gm.services.DeckParser;
	import net.whaleattack.adjunct.gm.services.DeckService;
	import net.whaleattack.adjunct.gm.services.SettingsParser;
	import net.whaleattack.adjunct.gm.services.SettingsService;
	import net.whaleattack.adjunct.gm.views.Deck;
	import net.whaleattack.adjunct.gm.views.DeckMediator;
	import net.whaleattack.adjunct.gm.views.Table;
	import net.whaleattack.adjunct.gm.views.TableMediator;
	
	import org.robotlegs.mvcs.Context;
	
	public class GameAssistantContext extends Context
	{
		public function GameAssistantContext(contextView:DisplayObjectContainer=null)
		{
			super(contextView);
		}
		
		override public function startup():void
		{
			injector.mapSingleton(DeckModel);
			injector.mapSingleton(SettingsService);
			injector.mapSingleton(SettingsParser);
			injector.mapSingleton(DeckService);
			injector.mapSingleton(DeckParser);
			
			mediatorMap.mapView(Deck, DeckMediator);
			mediatorMap.mapView(Table, TableMediator);
			
			contextView.addChild(new Table());
		}
	}
}