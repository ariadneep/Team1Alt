this_graph = [{
	"index": 0, 
	"text": "sample text",
	"children": [],
	"is_active": true,
	"speaker": "",
	"mood": "",
	}]
current_index = 0
is_choice = false
curr_choice_index = 0
key = this_graph[current_index].speaker + this_graph[current_index].mood
//grab from correct event index 0