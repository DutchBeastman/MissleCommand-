package 
{
 import flash.display.MovieClip;
 import flash.display.SimpleButton;
 import flash.display.Sprite;
 import flash.display.StageScaleMode;
 import flash.display.StageDisplayState;
 import flash.events.Event;
 import flash.events.MouseEvent;
 import flash.utils.Timer;
 import flash.events.TimerEvent;
 import flash.events.TextEvent;
 import flash.text.TextField;
 import flash.text.TextFormat;
 /**
  * ...
  * @author Fabian Verkuijlen
  */
 public class Main extends Sprite
	{
		
	private var scoretext:TextField = new TextField;
	private var scoreTimer:Timer;
	private var score = new int;
	private var fullscreen:Fullscreen = new Fullscreen();
	private var textfont:TextFormat = new TextFormat;
	
		//aanmaken van de game
	public var random:Number;
	public static var _allMeteooren:Array = [];
	public static var _allBullets:Array = [];
	public var spawnTimer:Timer;
	public var cartimer:Timer;
	public var tower1:Tower = new Tower();
	public var tower2:Tower = new Tower();
	public var tower3:Tower = new Tower();
	public var shootingTowerX:Number;
	public var shootingTowerY:Number;
	public var BGScreen:Beginscreen = new Beginscreen();
	public function Main():void
	{
		addEventListener(Event.ADDED_TO_STAGE, initGame);
		
		
	}

	private function initGame(e:Event) : void 
	{
		BGScreen.addEventListener(Beginscreen.START, init)
		addChild(BGScreen);
		BGScreen.x = 300;
		BGScreen.y = 150;
		addChild(fullscreen);
		//De button zelf die alles kan aanroepen.
		fullscreen.addEventListener(MouseEvent.CLICK, goFull);
		fullscreen.x = 600;
		fullscreen.y = 0;
		
	}
	
	
	
	//zorg dat het fullscreen event word uitgevoerd.
	function goFull(event:MouseEvent):void {
	setFullScreen();
	}
	//laad het full screen event in.
	function setFullScreen():void {
	if (stage.displayState == StageDisplayState.NORMAL) {
	stage.displayState = StageDisplayState.FULL_SCREEN;
	stage.scaleMode = StageScaleMode.NO_SCALE;
	} else {
		stage.displayState = StageDisplayState.NORMAL;
		}
	}

	private function init(e:Event):void
	{
		
		addChild(tower1);
		addChild(tower2);
		addChild(tower3);

		tower1.x = 100;
		tower2.x = 500;
		tower3.x = 900;

		tower1.y = stage.stageHeight - 100;
		tower2.y = stage.stageHeight - 100;
		tower3.y = stage.stageHeight - 100;
		
		stage.addEventListener(Event.ENTER_FRAME, loop);
		stage.addEventListener(MouseEvent.CLICK, mouseClick);
		cartimer = new Timer((Math.random() * 1000 * Math.random()) + 3000, 0);
		cartimer.addEventListener(TimerEvent.TIMER, spawnCar);
		cartimer.start();
		spawnTimer = new Timer((Math.random() * 1000) + 2000, 0);
		spawnTimer.addEventListener(TimerEvent.TIMER, spawnMeteoor);
		spawnTimer.start();
		scoreTimer = new Timer( 200 , 0);
		scoreTimer.addEventListener(TimerEvent.TIMER, TellScore);
		scoreTimer.start();
		
	}
	
		private function TellScore(e:Event) :void
		{
		score ++;
		scoretext.defaultTextFormat = textfont;
		textfont.size = 50;
		}
	
	private function spawnCar(e:TimerEvent):void 
	{
		
		var carfactory : CarFactory = new CarFactory();
		var randomNumber : int = Math.random() * 20;
		var cars : Cars = carfactory.MakeCar(randomNumber);
		addChild(cars);
	
	}
	//Kogel spawning.
	private function mouseClick(e:MouseEvent):void 
	{
		var newBullet : Bullet = new Bullet();
		_allBullets.push(newBullet);
		addChild(newBullet);

		random = Math.random();
		if (random > 0.7)
		{
			shootingTowerX = tower1.x;
			shootingTowerY = tower1.y;
			newBullet.rotation = tower1.cannonloop.rotation;
			newBullet.x = tower1.x;
			newBullet.y = tower1.y;
		}else if (random > 0.4 && random < 0.7)
		{
			shootingTowerX = tower2.x;
			shootingTowerY = tower2.y;
			newBullet.rotation = tower2.cannonloop.rotation;
			newBullet.x = tower2.x;
			newBullet.y = tower2.y;
		}else if (random < 0.4)
		{
			shootingTowerX = tower3.x;
			shootingTowerY = tower3.y;
			newBullet.rotation = tower3.cannonloop.rotation;
			newBullet.x = tower3.x;
			newBullet.y = tower3.y;
		}
		// Kogels die  spawnen op de towers 
		var gx:Number =  shootingTowerX - mouseX ;
		var gy:Number =  shootingTowerY - mouseY;
		var RadiansB:Number = Math.atan2(gy, gx);
		var DegreesB:Number = RadiansB * 180 / Math.PI;
		newBullet.angle = RadiansB;
	}
	private function spawnMeteoor(e:Event) :void
	{
		var newMeteoor : SteenFactory = new SteenFactory();
		_allMeteooren.push(newMeteoor);
		newMeteoor.x = Math.random() * 1000;
		newMeteoor.y =  50;
		addChild(newMeteoor);
		
	}
	private function loop(e:Event):void
		{
		scoretext.text = score;
		
			
		var stenen : Steen;
		var item : Bullet;
		var k : int = _allMeteooren.length;
		var l : int = _allBullets.length;
		
		for (var i:int = l-1; i >=0; i--) 
		{
			_allBullets[i].update();
			if (_allBullets[i].x < 0 || _allBullets[i].x > stage.stageWidth || _allBullets[i].y < 0 || _allBullets[i].y > stage.stageHeight)
			{
				removeChild(_allBullets[i]);
				_allBullets.splice(i, 1);
				
			}
		}
		
		for (var j:int = k -1 ; j >= 0; j--) 
		{
			l = _allBullets.length;
			_allMeteooren[j].x += Math.floor(Math.random() *  2);
			_allMeteooren[j].y +=Math.floor(Math.random() * 10);
			if (_allMeteooren[j].x < 0 || _allMeteooren[j].x > stage.stageWidth || _allMeteooren[j].y  > stage.stageHeight)
			{
				removeChild(_allMeteooren[j])
				_allMeteooren.splice(j, 1);
			}	
			for (var i:int = l - 1; i >= 0; i--) {
				//_allBullets[i].update();
			
				if (_allBullets[i].hitTestObject(_allMeteooren[j]))
				{
					removeChild(_allMeteooren[j])
					_allMeteooren.splice(j, 1);
					removeChild(_allBullets[i]);
					_allBullets.splice(i, 1);
					break;
				}
			}
		}
		
		}

	}

}