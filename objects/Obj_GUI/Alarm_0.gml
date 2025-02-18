/// @description criar bicho
if (global.play) {
	instance_create_depth(0, 0, 0, Obj_bicho);
	var tempoGerar = 60 - (global.onda * 5)
	if (tempoGerar < 10) tempoGerar = 10;
	alarm[0] = tempoGerar;
}