/// @description parallax e diálogo

// Créditos
if (mouse_x > 5 and mouse_x < 45 and mouse_y > 25 and mouse_y < 35)
	self.creditos = true;
else
	self.creditos = false;

// Tempo
if (global.play and global.tempo > 0.0)
	global.tempo -= 0.015
else {
	self.tituloAlfa -= 0.01;
	if (self.tituloAlfa <= 0.0) self.tituloAlfa = 1.0;
}

if (global.tempo <= 0 and self.dialogoDelay == 0) {
	if (global.pontos > global.recorde) {
		self.dialogoTexto = "Voce bateu o recorde\n de " + string(global.recorde) + " com\n" + string(global.pontos) + " pontos!\nAgora vamos para\na cadeia!"
		global.recorde = global.pontos;
		
		ini_open("save.ini");
		ini_write_real("save_unico", "recorde", global.recorde);
		ini_close();
	} else {
		self.dialogoTexto = "PARE!\nVoce fez " + string(global.pontos) + " pontos!\nAgora vamos para\na cadeia!"
	}
	self.dialogoExibir = "";
	self.dialogoDelay = 400;
	self.dialogoAni = 5;
	
	alarm[1] = 399;
}

// Diálogo
if (global.kills >= 10) {
	var msgs = [
		"Voce tem que parar\ncom isso!",
		"Onde voce arranjou\nessa arma?",
		"O IBAMA vai te pegar!",
		"Maos ao alto!",
		"A natureza vai se vingar!",
		"Tu vai pro xilindro!"
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