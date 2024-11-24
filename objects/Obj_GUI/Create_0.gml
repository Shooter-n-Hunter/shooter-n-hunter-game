/// @description Insert description here
// You can write your code in this editor
global.play = true;
global.pontos = 0;
global.municao = 10;
global.tempo = 30;
global.kills = 0;
global.onda = 1;
global.vidas = 3;

self.dialogoTexto = "Nao atire nos animais!";
self.dialogoExibir = "";
self.dialogoDelay = 0;
self.dialogoAni = 5;

background_map = ds_map_create();
for (var i=0; i<5; i++)
	background_map[? layer_get_id("Bg_fundo_" + string(i + 1))] = 1.0 - (0.1 * i);
for (var i=4; i<9; i++)
	background_map[? layer_get_id("Bg_fundo_" + string(i + 1))] = 0.5;
	
background_map[? layer_get_id("Bg_fundo_9")] = 0.0;

alarm[0] = 60;