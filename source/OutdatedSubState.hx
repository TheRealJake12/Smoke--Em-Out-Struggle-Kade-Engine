package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;

class OutdatedSubState extends MusicBeatState
{
	public static var leftState:Bool = false;

	public static var needVer:String = "IDFK LOL";
	public static var currChanges:String = "dk";

	private var bgColors:Array<String> = ['#314d7f', '#4e7093', '#70526e', '#594465'];
	private var colorRotation:Int = 1;

	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('garAlley/garStage', 'shared'));
		bg.scale.x *= 1.55;
		bg.scale.y *= 1.55;
		bg.screenCenter();
		bg.antialiasing = FlxG.save.data.antialiasing;
		add(bg);

		var txt:FlxText = new FlxText(0, 0, FlxG.width,
			"I am once again saying\nthis is unofficial"
			 + "\n\nPress ESC for to continue",
			32);

		if (MainMenuState.nightly != "")
			txt.text = "You are on\n"
				+ MainMenuState.kadeEngineVer
				+ "\nWhich is a PRE-RELEASE BUILD!"
				+ "\n\nReport all bugs to the author of the pre-release.\nSpace/Escape ignores this.";

		txt.setFormat("VCR OSD Mono", 32, FlxColor.fromRGB(200, 200, 200), CENTER);
		txt.borderColor = FlxColor.BLACK;
		txt.borderSize = 3;
		txt.borderStyle = FlxTextBorderStyle.OUTLINE;
		txt.screenCenter();
		add(txt);
	}
	override function update(elapsed:Float)
	{
		if (controls.ACCEPT && MainMenuState.nightly == "")
		{
			fancyOpenURL("https://kadedev.github.io/Kade-Engine/changelogs/changelog-" + needVer);
		}
		else if (controls.ACCEPT)
		{
			leftState = true;
			FlxG.switchState(new MainMenuState());
		}
		if (controls.BACK)
		{
			leftState = true;
			FlxG.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
}
