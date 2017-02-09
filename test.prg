import "mod_draw";
import "mod_key";
import "mod_map";
import "mod_math";
import "mod_proc";
import "mod_grproc";
import "mod_screen";
import "mod_string";
import "mod_text";
import "mod_file";
import "mod_video";
import "mod_debug";
import "mod_say";
import "mod_sound";
import "mod_wm";
import "mod_rand";
import "mod_path";
import "mod_dir";

CONST

	// configuracion de pantalla
	SCREEN_X = 320;
	SCREEN_Y = 240;
	SCREEN_D = 16;
	SCREEN_S = 2;
	SCREEN_M = 16;
	SCREEN_FPS = 60;
	
END

GLOBAL

	string texto;
	
END

include "keyboard.prg";

BEGIN

	scale_resolution = (SCREEN_X*SCREEN_S) * 10000 + (SCREEN_Y*SCREEN_S);
	set_mode(SCREEN_X, SCREEN_Y, SCREEN_D, SCREEN_M);
	set_fps(SCREEN_FPS,2);

	mouse.graph = load_png("media/cursor.png");
	
	// llamo al teclado para ingresar un texto
	texto = wizkeyboard("fpg/keyboard.fpg", 0,0,0, "Ingrese Texto", 25);
	
	// muestro el texto ingresado en pantalla
	write( 0, SCREEN_X/2, SCREEN_Y/2, 4, texto );
	
	// main loop
	loop
	
		if ( key ( _esc ) or exit_status )
			exit();
		end

		frame;
		
	end
END
