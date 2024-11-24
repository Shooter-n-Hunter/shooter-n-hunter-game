/// @description Insert description here
// You can write your code in this editor
if (self.velocidadeInicial < 0 and x < 0)
	instance_destroy(self);
if (self.velocidadeInicial > 0 and x > room_width)
	instance_destroy(self);