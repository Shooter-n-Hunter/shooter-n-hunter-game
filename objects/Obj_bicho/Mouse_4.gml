/// @description tomando tiro
if (global.estaCarregado and self.vida > 0 and global.tempo > 0) {
	self.vida -= 1;
	self.tempoDano = 60;
	
	switch (self.tipo) {
		case 0:
			sprite_index = Spr_sarue_dano;
			break;
		case 1:
			sprite_index = Spr_maritaca_dano;
			break;
		case 2:
			sprite_index = Spr_tatu_dano;
			break;
		case 3:
			sprite_index = Spr_capivara_dano;
			break;
		case 4:
			sprite_index = Spr_lobo;
			break;
		default:
			sprite_index = Spr_maritaca_dano;
			break;
	}

	if (self.vida <= 0) {
		global.pontos += self.ponto;
		global.tempo += 1;
		global.kills += 1;
		var p = instance_create_depth(x - (sprite_width/2), y, 0, Obj_pontos);
		with (p) {
			ponto = other.ponto;
		}
		vspeed = -0.5;
	}
	alarm[2] = 60;
}