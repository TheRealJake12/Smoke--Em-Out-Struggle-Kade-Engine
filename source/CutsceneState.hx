package;
import flixel.*;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.FlxCamera;
import openfl.Lib;

class CutsceneState extends MusicBeatState
{

	var zoom:Float = -1;

	var video:MP4Handler = new MP4Handler();
	
	override public function create():Void 
	{
		if
			FlxG.camera.fade(FlxColor.BLACK, 0.8, true);
			if (PlayState.storyWeek == 5)
				video.playMP4(Paths.video('CutsceneFinal'), new StoryMenuState());
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}
	
	public function endIt(e:FlxTimer=null){
		trace("ENDING");
		FlxG.switchState(new PlayState());
	}
	
}




//==============================================================
// I have no idea what im doing I just copied rando shit here
//==============================================================

public function Cutscene video();
{  
    if (PlayState.songStart);
    var video:MP4Handler = new MP4Handler();

    if (curSong == 'nerves')
    var video:MP4Handler = new MP4Handler();

    video.playMP4(Paths.video('dies'));
    video.finishCallback = function()
    {
        LoadingState.loadAndSwitchState(new PlayState());
    }
}
