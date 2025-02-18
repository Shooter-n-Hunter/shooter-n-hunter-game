/// @description textos e diálogos
font_enable_effects(Fon_titulo, true, {
	outlineEnable: true,
	outlineDistance: 2,
	outlineColour: c_black	
});
font_enable_effects(Fon_GUI, true, {
	outlineEnable: true,
	outlineDistance: 1,
	outlineColour: c_black	
});
if (!global.play) {
	draw_set_color(c_white);
	draw_set_font(Fon_titulo);
	draw_text(50, 50, "Shoot & Hunter")
	
	draw_set_font(Fon_GUI);
	if (self.creditos) draw_set_color(c_red)
	draw_text(50, 120, "Creditos")
	draw_set_color(c_white);
	
	if (!self.creditos) {
		draw_set_alpha(sin(self.tituloAlfa));
		draw_text(view_wport[0]/2 - 100, view_hport[0] - 80, "Atire em qualquer lugar")
		draw_set_alpha(1.0);
	}
	
	if (self.creditos) {
		var _margin_txt = 30;
		var _cor_y_txt =  view_hport[0] - 60;
		draw_text(50, _cor_y_txt - (_margin_txt * 6), "Pesquisa: Elismar Silva dos Santos")
		draw_text(50, _cor_y_txt - (_margin_txt * 5), "Programacao e som: Ewerton Matheus Bezerra Ramos")
		draw_text(50, _cor_y_txt - (_margin_txt * 4), "Pesquisa e codigo: Kaio Eduardo Matos De Souza")
		draw_text(50, _cor_y_txt - (_margin_txt * 3), "Pesquisa: Karine Figueredo de Macedo")
		draw_text(50, _cor_y_txt - (_margin_txt * 2), "Sprites e backgrounds: Sarah Souza Dantas")
		draw_text(50, _cor_y_txt - (_margin_txt * 1), "Pesquisa: Thiago Augusto De Faria Pena")
	}
	
	draw_text(50, view_hport[0] - 40, "UDF - 2024")
} else {
	var pad_x = 10;
	var pad_y = 10;

	draw_set_color(c_white);
	draw_set_font(Fon_GUI);
	draw_text(pad_x, pad_y, "Recorde: " + string(global.recorde));
	draw_text(pad_x, pad_y + 20, "Pontos: " + string(global.pontos));

	if (global.tempo > 5)
		draw_text(pad_x, pad_y + 40, "Tempo: " + string(round(global.tempo)));
	else if ((global.tempo * 100) % 2 < 1)
		draw_text(pad_x, pad_y + 40, "Tempo: " + string(round(global.tempo)));
	
	// Guarda florestal e diálogo
	if (self.dialogoDelay > 0) {
		var diw = 300;
		var dih = 150;
		var dix = view_wport[0] - diw - 10;
		var diy = view_hport[0] - dih - 30 + (sin(self.dialogoAni) * 10);
		
		draw_set_color(c_white);
		draw_triangle(dix, diy + 20, dix, diy + 40, dix - 10, diy + 30, 0);
		draw_roundrect_color(dix, diy, dix + diw, diy + dih, c_white, c_white, 0);
		
		font_enable_effects(Fon_GUI, false);
		draw_set_color(c_black);
		draw_set_font(Fon_GUI);
		draw_text(dix + 15, diy + 15, self.dialogoExibir);
		draw_sprite_ext(Spr_guarda, 0, dix - 50, diy - 80, 4, 4, 0, c_white, 1);
	}
}