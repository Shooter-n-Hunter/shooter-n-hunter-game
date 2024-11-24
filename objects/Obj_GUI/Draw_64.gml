/// @description textos e diálogos
font_enable_effects(Fon_GUI, true, {
	outlineEnable: true,
	outlineDistance: 1,
	outlineColour: c_black	
});
if (!global.play) {
	draw_set_color(c_white);
	draw_set_font(Fon_GUI);
	draw_text(50, 50, "Shoot & Hunter")
	draw_text(50, view_hport[0] - 80, "Atire em qualquer lugar")
	draw_text(50, view_hport[0] - 30, "UDF - 2024")
} else {
	var pad_x = 10;
	var pad_y = 10;

	draw_set_color(c_white);
	draw_set_font(Fon_GUI);
	draw_text(pad_x, pad_y, "Pontos: " + string(global.pontos));
	draw_text(pad_x, pad_y + 20, "Vidas: " + string(global.vidas));

	if (global.tempo > 5)
		draw_text(pad_x, pad_y + 40, "Tempo: " + string(round(global.tempo)));
	else if ((global.tempo * 100) % 2 < 1)
		draw_text(pad_x, pad_y + 40, "Tempo: " + string(round(global.tempo)));
	
	// Guarda florestal e diálogo
	if (self.dialogoDelay > 0) {
		var diw = 300;
		var dih = 150;
		var dix = view_wport[0] - diw - 10;
		var diy = view_hport[0] - dih - 30 + (sin(self.dialogoAni) * 5);
		draw_roundrect_color(dix, diy, dix + diw, diy + dih, c_white, c_white, 0);
		font_enable_effects(Fon_GUI, false);
		draw_set_color(c_black);
		draw_set_font(Fon_GUI);
		draw_text(dix + 15, diy + 15, self.dialogoExibir);
		draw_sprite_ext(Spr_guarda, 0, dix - 50, diy - 80, 4, 4, 0, c_white, 1);
	}
}