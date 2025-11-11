if(!phone_is_visible) {
	
	if(sequence_instance_exists(seq_UI_PhoneDown))
		layer_sequence_destroy(phone_seq_down);
		
	phone_seq_up = layer_sequence_create("Symbols", 0, 0, seq_UI_PhoneUp);
	phone_is_visible = true;
} else {
	layer_sequence_destroy(phone_seq_up);
	phone_seq_down = layer_sequence_create("Symbols", 0, 0, seq_UI_PhoneDown);
	phone_is_visible = false;
}