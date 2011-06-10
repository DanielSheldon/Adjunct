package net.whaleattack.adjunct.gm.views
{
	import flash.events.MouseEvent;
	
	import net.whaleattack.adjunct.gm.models.DeckModel;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class DeckMediator extends Mediator
	{
		[Inject]
		public var view:Deck;
		
		public function DeckMediator()
		{
		}
		
		override public function onRegister():void
		{
			eventMap.mapListener(view, MouseEvent.CLICK, onClick);
		}
		
		private function onClick(event:MouseEvent):void
		{
			
		}
	}
}