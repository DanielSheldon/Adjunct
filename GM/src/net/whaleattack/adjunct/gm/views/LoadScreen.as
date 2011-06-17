package net.whaleattack.adjunct.gm.views
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class LoadScreen extends Sprite
	{
		public function LoadScreen()
		{
			super();
			updateUI();
		}
		
		private function updateUI():void
		{
			var tf:TextField = new TextField();
			tf.text = "Loading";
			
			addChild(tf);
		}
	}
}