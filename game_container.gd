extends VBoxContainer

const SLIDES = {
	"start": {
		"label": "Choose an option",
		"buttons": {
			0:{
				"text": "Option a",
				"next": "a"
			},
			1:{
				"text": "Option b",
				"next": "b"
			}
		}
	},
	"a": {
		"label": "You chose option a",
		"buttons": {
			0:{
				"text": "Option a",
				"next": "a"
			},
			1:{
				"text": "Option b",
				"next": "b"
			}
		}
	},
	"b": {
		"label": "You chose option b",
		"buttons": {
			0:{
				"text": "Option a",
				"next": "a"
			},
			1:{
				"text": "Option b",
				"next": "b"
			}
		}
	}
}

var current_slide

func _ready():
	set_slide("start")

func set_slide(slide: String) -> void:
	current_slide = SLIDES[slide]
	$Label.text = current_slide.label
	$HBoxContainer/Button0.text = current_slide.buttons[0].text
	$HBoxContainer/Button1.text = current_slide.buttons[1].text


func _on_button_0_pressed():
	set_slide(current_slide.buttons[0].next)

func _on_button_1_pressed():
	set_slide(current_slide.buttons[1].next)
