package net.whaleattack.adjunct.gm.models.vo
{
	public class DeckVO
	{
		public var name:String;
		public var cards:Array;
		
		public function DeckVO()
		{
			cards = [];
		}
		
		public function toString():String
		{
			return "Deck: " + name + " with " + cards.length + " cards";
		}
	}
}