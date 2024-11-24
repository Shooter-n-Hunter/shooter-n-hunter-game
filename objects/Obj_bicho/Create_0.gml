/// @description Insert description here
// You can write your code in this editor
self.velocidadeInicial = 0;
self.tempoEsconder = 20;
self.tempoEspera = 120;
self.tempoDano = 0;

self.vida = 0;
self.ponto = 0;

var tipRng = 1 + round(global.onda/2)
if (tipRng > 5) tipRng = 5;

var velRng = global.onda;

self.tipo = round(random_range(0,tipRng));
switch (self.tipo) {
	case 0:
		sprite_index = Spr_sarue_movendo;
		x = random_range(0, room_width);
		y = room_height - 50;
		self.velocidadeInicial = 0;
		self.vida = 1;
		self.ponto = 100;
		alarm[0] = self.tempoEsconder;
		break;
	case 1:
		sprite_index = Spr_maritaca_movendo;
		if (round(random(2)) == 0) {
			x = -sprite_width;
			self.velocidadeInicial = round(random_range(1,velRng))/2;
		} else {
			x = room_width + sprite_width;
			self.velocidadeInicial = round(random_range(-velRng,1))/2;
		}
		y = random_range(0, room_height - 80);
		self.vida = 1;
		self.ponto = 200;
		break;
	case 2:
		sprite_index = Spr_tatu_movendo;
		image_xscale = -1;
		if (round(random(2)) == 0) {
			x = -sprite_width;
			self.velocidadeInicial = round(random_range(1,velRng))/2;
		} else {
			x = room_width + sprite_width;
			self.velocidadeInicial = round(random_range(-velRng,1))/2;
		}
		y = room_height - 50;
		self.vida = 2;
		self.ponto = 300;
		break;
	case 3:
		sprite_index = Spr_capivara_aparecer;
		x = random_range(0, room_width);
		y = room_height - 50;
		if (round(random(2)) == 0) image_xscale = 1 else image_xscale = -1;
		self.tempoEsconder = 20;
		self.tempoEspera = 240;
		self.vida = 3;
		self.ponto = 500;
		alarm[0] = self.tempoEsconder;
		break;
	case 4:
		sprite_index = Spr_lobo;
		x = random_range(0, room_width);
		y = room_height - 50;
		self.velocidadeInicial = round(random_range(-2,2));
		self.tempoEsconder = 20;
		self.tempoEspera = 120;
		self.vida = 3;
		self.ponto = 1000;
		alarm[0] = self.tempoEsconder;
		break;
	default:
		sprite_index = Spr_maritaca_movendo;
		break;
}

hspeed = self.velocidadeInicial;
if (hspeed < 0) {
	if (self.tipo == 2)
		image_xscale = 1;
	else
		image_xscale = -1;
}