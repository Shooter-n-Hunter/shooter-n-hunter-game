/// @description texto
font_enable_effects(Fon_pontos, true, {
	outlineEnable: true,
	outlineDistance: 1,
	outlineColour: c_black	
});
draw_set_color(c_white);
draw_set_font(Fon_pontos);
draw_set_alpha(image_alpha);
draw_text(x - 10, y, self.ponto);
draw_set_alpha(1);

if (self.estaSumindo)
	image_alpha -= 0.02;
if (image_alpha <= 0.0)
	instance_destroy(self);