package
{
	import flash.display.Sprite;
	
	import net.whaleattack.adjunct.gm.GameAssistantContext;
	import net.whaleattack.adjunct.gm.component.DeckManager;
	
	[SWF(width='550', height='400')]
	public class Main extends Sprite
	{
		private var _gac:GameAssistantContext;
		
		public function Main()
		{
			_gac = new GameAssistantContext(this);
		}
	}
}