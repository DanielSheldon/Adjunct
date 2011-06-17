package net.whaleattack.adjunct.gm.controllers
{
	import net.whaleattack.adjunct.gm.events.SettingsEvent;
	import net.whaleattack.adjunct.gm.services.SettingsService;
	
	import org.robotlegs.mvcs.Command;
	
	public class LoadSettingsCommand extends Command
	{
		[Inject]
		public var event:SettingsEvent;
		
		[Inject]
		public var service:SettingsService;
		
		override public function execute():void
		{
			service.loadSettings(event.source);
		}
	}
}