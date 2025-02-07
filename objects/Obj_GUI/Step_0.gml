/// @description parallax e diálogo
x = mouse_x;
y = mouse_y;

// Tempo
if (global.play)
	global.tempo -= 0.015
else {
	self.tituloAlfa -= 0.01;
	if (self.tituloAlfa <= 0.0) self.tituloAlfa = 1.0;
}
if (global.tempo <= 0) {
	self.dialogoTexto = "PARE!"
	self.dialogoExibir = "";
	self.dialogoDelay = 240;
	self.dialogoAni = 5;
	global.play = false;
}

// Diálogo
if (global.kills >= 10) {
	var msgs = [
		"Voce tem que parar\ncom isso!",
		"Onde voce arranjou\nessa arma?",
		"O IBAMA vai te pegar!",
		"Maos ao alto!",
		"A natureza vai se vingar!",
		"Tu vai pro xilindró!"
	]
	self.dialogoTexto = msgs[random(array_length(msgs))];
	self.dialogoExibir = "";
	self.dialogoDelay = 240;
	self.dialogoAni = 5;
	global.onda += 1;
	global.kills = 0;
}

if (self.dialogoDelay > 0) {
	if (string_length(self.dialogoTexto) > 0 and self.dialogoDelay % 2 == 0) {
		self.dialogoExibir += string_char_at(self.dialogoTexto, 1);
		self.dialogoTexto = string_delete(self.dialogoTexto, 0, 1);
	}
	if (self.dialogoAni > 0)
		self.dialogoAni -= 0.3;
	self.dialogoDelay -= 1;
	
	if (self.dialogoDelay == 17)
		self.dialogoAni = 5;
}

// Parallax
var _cx = camera_get_view_x(view_camera[0]);
var _xspd = 3 * (keyboard_check(vk_right) - keyboard_check(vk_left));
_cx += _xspd
camera_set_view_pos(view_camera[0], _cx, 0);

var _b = ds_map_find_first(background_map);
repeat(ds_map_size(background_map)) {
	layer_x(_b, background_map[? _b] * _cx);
    _b = ds_map_find_next(background_map, _b);
}