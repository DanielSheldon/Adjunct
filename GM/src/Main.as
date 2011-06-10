package
{
	import flash.display.Sprite;
	
	import net.whaleattack.adjunct.gm.AdjunctContext;
	
	[SWF(width='550', height='400')]
	public class Main extends Sprite
	{
		private var _gac:AdjunctContext;
		
		public function Main()
		{
			_gac = new AdjunctContext(this);
		}
	}
}