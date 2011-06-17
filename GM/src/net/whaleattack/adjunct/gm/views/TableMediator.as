package net.whaleattack.adjunct.gm.views
{
	import net.whaleattack.adjunct.gm.events.DeckEvent;
	import net.whaleattack.adjunct.gm.events.DeckLoadEvent;
	import net.whaleattack.adjunct.gm.events.SettingsEvent;
	import net.whaleattack.adjunct.gm.models.DeckModel;
	import net.whaleattack.adjunct.gm.models.vo.SettingsVO;
	import net.whaleattack.adjunct.gm.services.DeckService;
	import net.whaleattack.adjunct.gm.services.SettingsService;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class TableMediator extends Mediator
	{
		[Inject]
		public var view:Table;
		
		[Inject]
		public var settingsService:SettingsService;
		
		[Inject]
		public var deckServce:DeckService;
		
		[Inject]
		public var deckModel:DeckModel;
		
		public function TableMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
		}
	}
}