package net.whaleattack.adjunct.gm.controllers
{
	import net.whaleattack.adjunct.gm.events.DeckLoadEvent;
	import net.whaleattack.adjunct.gm.services.DeckService;
	
	import org.robotlegs.mvcs.Command;
	
	public class LoadDeckCommand extends Command
	{
		[Inject]
		public var event:DeckLoadEvent;
		
		[Inject]
		public var service:DeckService;
		
		override public function execute():void
		{
			service.loadDeck(event.source);
		}
	}
}