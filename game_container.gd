extends VBoxContainer

const SLIDES = {
	"start": {
		"label": "You find a dragon",
		"image": "res://images/0.svg",
		"sound": "res://sounds/kalimba.ogg",
		"buttons": {
			0:{
				"text": "Attack the dragon",
				"next": "attack"
			},
			1:{
				"text": "Talk to the dragon",
				"next": "talk"
			}
		}
	},
	"attack": {
		"label": "You attack the dragon, but the dragon shoots fire at you and gets very angry",
		"image": "res://images/attack.svg",
		"sound": "res://sounds/bell.ogg",
		"buttons": {
			0:{
				"text": "Attack the dragon again",
				"next": "attack_again"
			},
			1:{
				"text": "Say sorry to the dragon",
				"next": "say_sorry"
			}
		}
	},
	"attack_again": {
		"label": "You attack the dragon again, and the dragon obliterates you with more fire",
		"image": "res://images/attack_again.svg",
		"sound": "res://sounds/bell.ogg",
		"buttons": {
			0:{
				"text": "Restart",
				"next": "start"
			},
			1:{
				"text": "Restart",
				"next": "start"
			}
		}
	},
	"say_sorry": {
		"label": "You say sorry to the dragon, and the dragon forgives you :)",
		"image": "res://images/say_sorry.svg",
		"sound": "res://sounds/bell.ogg",
		"buttons": {
			0:{
				"text": "Restart",
				"next": "start"
			},
			1:{
				"text": "Restart",
				"next": "start"
			}
		}
	},
	"talk": {
		"label": "The dragon doesn't answer when you talk to him",
		"image": "res://images/talk.svg",
		"sound": "res://sounds/bell.ogg",
		"buttons": {
			0:{
				"text": "Tell the dragon a joke",
				"next": "joke"
			},
			1:{
				"text": "Tell a compliment to the dragon",
				"next": "compliment"
			}
		}
	},
	"joke": {
		"label": "The dragon likes your joke",
		"image": "res://images/joke.svg",
		"sound": "res://sounds/bell.ogg",
		"buttons": {
			0:{
				"text": "Restart",
				"next": "start"
			},
			1:{
				"text": "Restart",
				"next": "start"
			}
		}
	},
	"compliment": {
		"label": "The dragon likes your compliment",
		"image": "res://images/compliment.svg",
		"sound": "res://sounds/bell.ogg",
		"buttons": {
			0:{
				"text": "Restart",
				"next": "start"
			},
			1:{
				"text": "Restart",
				"next": "start"
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
	$TextureRect.texture = load(current_slide.image)
	$HBoxContainer/Button0.text = current_slide.buttons[0].text
	$HBoxContainer/Button1.text = current_slide.buttons[1].text
	$"../AudioStreamPlayer".stream = load(current_slide.sound)
	$"../AudioStreamPlayer".play()


func _on_button_0_pressed():
	set_slide(current_slide.buttons[0].next)

func _on_button_1_pressed():
	set_slide(current_slide.buttons[1].next)
