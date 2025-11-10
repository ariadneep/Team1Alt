if(PhoneBool == 0)
{
var l5F757E3A_0 = false;
l5F757E3A_0 = sequence_instance_exists(seq_UI_PhoneDown);
if(l5F757E3A_0)
{
layer_sequence_destroy(PhoneDownVar);
}
	PhoneUpVar = layer_sequence_create("Symbols", 0, 0, seq_UI_PhoneUp);

	PhoneBool = 1;
		show_debug_message(string("Moons Haunted"));
}

else{
	layer_sequence_destroy(PhoneUpVar);
	PhoneDownVar = layer_sequence_create("Symbols", 0, 0, seq_UI_PhoneDown);

	PhoneBool = 0;
	show_debug_message(string("It's Silksong from Hornet"));
}