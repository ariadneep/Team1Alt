var dialogue = []
var bed_index = 0

//load_dialogue_bed(dialogue)

// read the bed data
var file_id = file_text_open_read("json_dialogue_bed.txt");
var json_string = "";
while (!file_text_eof(file_id))
    json_string += file_text_readln(file_id);
file_text_close(file_id);
	
dialogue = json_parse(json_string)
show_debug_message(dialogue)
//for debug:
for(i = 0; i < array_length(dialogue); i++)
	show_debug_message(dialogue[i].text + string(dialogue[i].children))

