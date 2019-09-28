package;

import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
using flixel.util.FlxSpriteUtil;
import flixel.ui.FlxBar;
import flixel.addons.ui.FlxUIBar;


class HUD extends FlxTypedGroup<FlxSprite> {
    var heroHealthBar:FlxUIBar;
    var heroHealthBarStyle:FlxBarStyle = {
        borderColor: null,
        chunkSize: null,
        emptyColors: null,
        emptyImgSrc: null,
        filledColor: FlxColor.RED, 
        filledColors: null,
        emptyColor: FlxColor.GRAY,
        filledImgSrc: null,
        gradRotation: null
    };

    public function new() {
        super();

        heroHealthBar = new FlxUIBar(0, 0, LEFT_TO_RIGHT, 64, 4, PlayState.HERO, "health", 0, 500, false);
        heroHealthBar.set_style(heroHealthBarStyle);

        add(heroHealthBar);
    }

    override public function update(elapsed:Float):Void {
        heroHealthBar.x = PlayState.HERO.x - PlayState.HERO.width / 2;
        heroHealthBar.y = PlayState.HERO.y - 8;
        super.update(elapsed);
    }
}