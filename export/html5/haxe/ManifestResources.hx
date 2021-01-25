package;


import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:sizei822251y4:typey5:MUSICy2:idy41:assets%2Fmusic%2FMandatory%20Overtime.mp3y9:pathGroupaR4hy7:preloadtgoy4:pathy36:assets%2Fmusic%2Fmusic-goes-here.txtR0zR1y4:TEXTR3R8R6tgoR0i5567529R1R2R3y30:assets%2Fmusic%2FSoliloquy.mp3R5aR10hR6tgoR0i33254R1y5:SOUNDR3y27:assets%2Fsounds%2Fshoot.wavR5aR12hR6tgoR0i40736R1R11R3y28:assets%2Fsounds%2Fpickup.wavR5aR13hR6tgoR7y36:assets%2Fsounds%2Fsounds-go-here.txtR0zR1R9R3R14R6tgoR0i12058R1R11R3y28:assets%2Fsounds%2Fselect.wavR5aR15hR6tgoR7y24:assets%2Fmaps%2Fmap2.tmxR0i4948R1R9R3R16R6tgoR7y25:assets%2Fmaps%2Fitems.tsxR0i3632R1R9R3R17R6tgoR7y42:assets%2Fmaps%2FplatformPack_tilesheet.pngR0i65327R1y5:IMAGER3R18R6tgoR7y30:assets%2Fmaps%2Fmap2_Items.csvR0i1800R1R9R3R20R6tgoR7y33:assets%2Fmaps%2Fmap2_Entities.csvR0i1797R1R9R3R21R6tgoR7y28:assets%2Fmaps%2Fmap2_Map.csvR0i1649R1R9R3R22R6tgoR7y24:assets%2Fdata%2Fmap2.tmxR0i12359R1R9R3R23R6tgoR7y28:assets%2Fdata%2FmapItems.csvR0i451R1R9R3R24R6tgoR7y23:assets%2Fdata%2Fmap.tmxR0i331R1R9R3R25R6tgoR7y23:assets%2Fdata%2Fmap.csvR0i380R1R9R3R26R6tgoR7y31:assets%2Fimages%2FCharSheet.pngR0i30550R1R19R3R27R6tgoR7y31:assets%2Fimages%2FTileSheet.pngR0i10035R1R19R3R28R6tgoR7y35:assets%2Fimages%2FTileSheetLong.pngR0i55983R1R19R3R29R6tgoR7y33:assets%2Fimages%2FEnemySheet1.pngR0i45049R1R19R3R30R6tgoR7y31:assets%2Fimages%2FGreenDoor.pngR0i3021R1R19R3R31R6tgoR7y34:assets%2Fimages%2FEnemySheet1.jsonR0i3912R1R9R3R32R6tgoR7y28:assets%2Fimages%2FSquare.pngR0i12450R1R19R3R33R6tgoR7y36:assets%2Fimages%2FTileSheetLong.jsonR0i17277R1R9R3R34R6tgoR7y29:assets%2Fimages%2FTile001.pngR0i3528R1R19R3R35R6tgoR7y42:assets%2Fimages%2FplatformPack_item014.pngR0i2302R1R19R3R36R6tgoR7y36:assets%2Fimages%2FTileSheetLong1.pngR0i55654R1R19R3R37R6tgoR7y34:assets%2Fimages%2FMonster_Walk.pngR0i10809R1R19R3R38R6tgoR7y41:assets%2Fimages%2FPink_Monster_Walk_6.pngR0i1426R1R19R3R39R6tgoR7y37:assets%2Fimages%2FbackgroundEmpty.pngR0i9444R1R19R3R40R6tgoR7y31:assets%2Fimages%2FitemSheet.pngR0i9629R1R19R3R41R6tgoR7y29:assets%2Fimages%2FDiamond.pngR0i10630R1R19R3R42R6tgoR0i39706R1R2R3y28:flixel%2Fsounds%2Fflixel.mp3R5aR43y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR0i2114R1R2R3y26:flixel%2Fsounds%2Fbeep.mp3R5aR45y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR0i33629R1R11R3R44R5aR43R44hgoR0i5794R1R11R3R46R5aR45R46hgoR0i15744R1y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR3y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR0i29724R1R47R48y36:__ASSET__flixel_fonts_monsterrat_ttfR3y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR7y33:flixel%2Fimages%2Fui%2Fbutton.pngR0i519R1R19R3R53R6tgoR7y36:flixel%2Fimages%2Flogo%2Fdefault.pngR0i3280R1R19R3R54R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_mandatory_overtime_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_soliloquy_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_shoot_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_pickup_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_select_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_maps_map2_tmx extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_maps_items_tsx extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_maps_platformpack_tilesheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_maps_map2_items_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_maps_map2_entities_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_maps_map2_map_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_map2_tmx extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_mapitems_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_map_tmx extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_map_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_charsheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_tilesheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_tilesheetlong_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemysheet1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_greendoor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemysheet1_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_square_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_tilesheetlong_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_tile001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_platformpack_item014_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_tilesheetlong1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_monster_walk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_pink_monster_walk_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_backgroundempty_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_itemsheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_diamond_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/music/Mandatory Overtime.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_mandatory_overtime_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/music/Soliloquy.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_soliloquy_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/shoot.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_shoot_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/pickup.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_pickup_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/select.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_select_wav extends haxe.io.Bytes {}
@:keep @:file("assets/maps/map2.tmx") @:noCompletion #if display private #end class __ASSET__assets_maps_map2_tmx extends haxe.io.Bytes {}
@:keep @:file("assets/maps/items.tsx") @:noCompletion #if display private #end class __ASSET__assets_maps_items_tsx extends haxe.io.Bytes {}
@:keep @:image("assets/maps/platformPack_tilesheet.png") @:noCompletion #if display private #end class __ASSET__assets_maps_platformpack_tilesheet_png extends lime.graphics.Image {}
@:keep @:file("assets/maps/map2_Items.csv") @:noCompletion #if display private #end class __ASSET__assets_maps_map2_items_csv extends haxe.io.Bytes {}
@:keep @:file("assets/maps/map2_Entities.csv") @:noCompletion #if display private #end class __ASSET__assets_maps_map2_entities_csv extends haxe.io.Bytes {}
@:keep @:file("assets/maps/map2_Map.csv") @:noCompletion #if display private #end class __ASSET__assets_maps_map2_map_csv extends haxe.io.Bytes {}
@:keep @:file("assets/data/map2.tmx") @:noCompletion #if display private #end class __ASSET__assets_data_map2_tmx extends haxe.io.Bytes {}
@:keep @:file("assets/data/mapItems.csv") @:noCompletion #if display private #end class __ASSET__assets_data_mapitems_csv extends haxe.io.Bytes {}
@:keep @:file("assets/data/map.tmx") @:noCompletion #if display private #end class __ASSET__assets_data_map_tmx extends haxe.io.Bytes {}
@:keep @:file("assets/data/map.csv") @:noCompletion #if display private #end class __ASSET__assets_data_map_csv extends haxe.io.Bytes {}
@:keep @:image("assets/images/CharSheet.png") @:noCompletion #if display private #end class __ASSET__assets_images_charsheet_png extends lime.graphics.Image {}
@:keep @:image("assets/images/TileSheet.png") @:noCompletion #if display private #end class __ASSET__assets_images_tilesheet_png extends lime.graphics.Image {}
@:keep @:image("assets/images/TileSheetLong.png") @:noCompletion #if display private #end class __ASSET__assets_images_tilesheetlong_png extends lime.graphics.Image {}
@:keep @:image("assets/images/EnemySheet1.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemysheet1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/GreenDoor.png") @:noCompletion #if display private #end class __ASSET__assets_images_greendoor_png extends lime.graphics.Image {}
@:keep @:file("assets/images/EnemySheet1.json") @:noCompletion #if display private #end class __ASSET__assets_images_enemysheet1_json extends haxe.io.Bytes {}
@:keep @:image("assets/images/Square.png") @:noCompletion #if display private #end class __ASSET__assets_images_square_png extends lime.graphics.Image {}
@:keep @:file("assets/images/TileSheetLong.json") @:noCompletion #if display private #end class __ASSET__assets_images_tilesheetlong_json extends haxe.io.Bytes {}
@:keep @:image("assets/images/Tile001.png") @:noCompletion #if display private #end class __ASSET__assets_images_tile001_png extends lime.graphics.Image {}
@:keep @:image("assets/images/platformPack_item014.png") @:noCompletion #if display private #end class __ASSET__assets_images_platformpack_item014_png extends lime.graphics.Image {}
@:keep @:image("assets/images/TileSheetLong1.png") @:noCompletion #if display private #end class __ASSET__assets_images_tilesheetlong1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Monster_Walk.png") @:noCompletion #if display private #end class __ASSET__assets_images_monster_walk_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Pink_Monster_Walk_6.png") @:noCompletion #if display private #end class __ASSET__assets_images_pink_monster_walk_6_png extends lime.graphics.Image {}
@:keep @:image("assets/images/backgroundEmpty.png") @:noCompletion #if display private #end class __ASSET__assets_images_backgroundempty_png extends lime.graphics.Image {}
@:keep @:image("assets/images/itemSheet.png") @:noCompletion #if display private #end class __ASSET__assets_images_itemsheet_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Diamond.png") @:noCompletion #if display private #end class __ASSET__assets_images_diamond_png extends lime.graphics.Image {}
@:keep @:file("/home/user/haxelib/flixel/4,8,1/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("/home/user/haxelib/flixel/4,8,1/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("/home/user/haxelib/flixel/4,8,1/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:file("/home/user/haxelib/flixel/4,8,1/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("/home/user/haxelib/flixel/4,8,1/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("/home/user/haxelib/flixel/4,8,1/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
