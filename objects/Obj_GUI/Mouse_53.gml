/// @description começar jogo
if (!global.play){
	global.play = true;
	self.dialogoTexto = "Nao atire nos animais\ncom o botao esquerdo e\nnem recarregue seu tiro\ncom o botao direito!";
	self.dialogoExibir = "";
	self.dialogoDelay = 400;
	self.dialogoAni = 5;
	
	alarm[0] = 60;
}