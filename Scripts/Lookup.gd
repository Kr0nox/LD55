extends Node

enum ItemName {
	SKULL,
	DIRT,
	YARROW,
	COAL,
	VIRGIN,
	APPLE,
	RUBY,
	FEATHER,
	LILY,
	FOOT,
	HAIR,
	HORN,
	SKIN,
	SHARD,
	SIN,
	SALT,
	NONE,
	FAKE_SKULL,
	DIAMOND,
	EMERALD
}

const nameLookup = {
	ItemName.SKULL: "Skull of a black cat",
	ItemName.DIRT: "Graveyard Dirt",
	ItemName.YARROW: "Yarrow Flowers",
	ItemName.COAL: "Coal",
	ItemName.VIRGIN: "Blood of a virgin",
	ItemName.APPLE: "Apple",
	ItemName.RUBY: "Ruby",
	ItemName.FEATHER: "Feather of a crow",
	ItemName.LILY: "Fire Lily",
	ItemName.FOOT: "Rabbits foot",
	ItemName.HAIR: "Hair of Lilith",
	ItemName.HORN: "Goat horn",
	ItemName.SKIN: "Snake skin",
	ItemName.SHARD: "Shard of a star",
	ItemName.SIN: "Blood of a sin",
	ItemName.SALT: "66 grains of salt",
	ItemName.NONE: ""
}

const imageLookup = {
	ItemName.SKULL: preload("res://Sprites/Items/black cat skull.png"),
	ItemName.DIRT: preload("res://Sprites/Items/bottle of graveyard dirt.png"),
	ItemName.YARROW: preload("res://Sprites/Items/yarrow flower.png"),
	ItemName.COAL: preload("res://Sprites/Items/coal.png"),
	ItemName.VIRGIN: preload("res://Sprites/Items/bottle of virgin blood.png"),
	ItemName.APPLE: preload("res://Sprites/Items/apple.png"),
	ItemName.RUBY: preload("res://Sprites/Items/ruby.png"),
	ItemName.FEATHER: preload("res://Sprites/Items/crow feather.png"),
	ItemName.LILY: preload("res://Sprites/Items/fire lily.png"),
	ItemName.FOOT: preload("res://Sprites/Items/rabbits foot.png"),
	ItemName.HAIR: preload("res://Sprites/Items/lillith hair.png"),
	ItemName.HORN: preload("res://Sprites/Items/goat horn.png"),
	ItemName.SKIN: preload("res://Sprites/Items/snake skin.png"),
	ItemName.SHARD: preload("res://Sprites/Items/star shard.png"),
	ItemName.SIN: preload("res://Sprites/Items/bottle of sin blood.png"),
	ItemName.SALT: preload("res://Sprites/Items/bottle of 66 salt grains.png"),
	ItemName.NONE: preload("res://Sprites/fragezeichen.png"),
	ItemName.FAKE_SKULL: preload("res://Sprites/Items/black cat skull.png"),
	ItemName.DIAMOND: preload("res://Sprites/Items/diamond.png"),
	ItemName.EMERALD: preload("res://Sprites/Items/emerald.png")
}

enum DrawingName {
	D11,D12,D13,D14,
	D21,D22,D23,D24,
	D31,D32,D33,D34,
	D41,D42,D43,D44
}

const nunBust = preload("res://Sprites/Player/bust.png")
const paimonBust = preload("res://Sprites/Deamons/Paimon/bust.png")
const asmodeusBust = preload("res://Sprites/Deamons/Asmodeus/bust.png")
const lilithBust = preload("res://Sprites/Deamons/Lilith/bust.png")
const luciferBust = preload("res://Sprites/Deamons/Lucifer/bust.png")
const hintBust = preload("res://Sprites/fragezeichen stein.png")
var intro: Array[Dialog] = [
	Dialog.new("The time has come.", nunBust),
	Dialog.new("It is time to free the dark lord from his cage.", nunBust),
	Dialog.new("But first I have to get my hands on some ingredients.", nunBust),
	Dialog.new("Paimon, a demon of knowledge, might help me.", nunBust),
	Dialog.new("I'll find some information on how to summon him in my notebook. (Open it with F)", nunBust)
]
var bookOpened: Array[Dialog] = [
	Dialog.new("Seems like I did not write down the complete ritual.", nunBust),
	Dialog.new("Maybe I can find the missing pieces in the southern library.", nunBust),
	Dialog.new("Close the book by pressing F again.", hintBust)
]
var pageEntered: Array[Dialog] = [
	Dialog.new("Pick up the page by clicking E.", hintBust)
]
var bothPagesPickedUp: Array[Dialog] = [
	Dialog.new("Now I can see the whole ritual (ingredients and drawing) in my book.", nunBust),
	Dialog.new("The yarrow flower should be planted in my flower bed to the east.", nunBust),
	Dialog.new("The graveyard is in the west.", nunBust),
	Dialog.new("Pick both up with E and place them in the right bowls (see book) using E.", hintBust),
	Dialog.new("To draw the circle, stand in the area and press E.", hintBust)
]
var dialogPaimon: Array[Dialog] = [
	Dialog.new("Hello child.", paimonBust),
	Dialog.new("To summon the lord, you will need some help.", paimonBust),
	Dialog.new("A sin must offer you their gift. Asmodeus should do well.", paimonBust),
	Dialog.new("Here is what I can offer you:", paimonBust),
	Dialog.new("To find the skull, you must know what killed it.", paimonBust),
	Dialog.new("To find the blood, see where you killed them.", paimonBust),
	Dialog.new("At last, I will give you this gift.", paimonBust),
	Dialog.new("Now go and read about the new ritual.", paimonBust)
]
var dialogAsmodeus: Array[Dialog] = [
	Dialog.new("So you want to bring back Lucifer?", asmodeusBust),
	Dialog.new("Well for that you need Lucifers first.", asmodeusBust),
	Dialog.new("Lilith.", asmodeusBust),
	Dialog.new("To summon her, get all ingredients:", asmodeusBust),
	Dialog.new("One thing you will need fresh from your flying friend.", asmodeusBust),
	Dialog.new("For the luck charm, well, try your luck.", asmodeusBust),
	Dialog.new("The other ingredients you can find yourself.", asmodeusBust),
	Dialog.new("The demon Paimon said I needed something from you. A gift, lord.", nunBust),
	Dialog.new("A yes. I see.", asmodeusBust),
	Dialog.new("Take this. It is a precious  bottle. Don't lose it.", asmodeusBust)
]
var dialogLilith: Array[Dialog] = [
	Dialog.new("Good child.", lilithBust),
	Dialog.new("You have nearly done it.", lilithBust),
	Dialog.new("Soon he will walk the earth once again.", lilithBust),
	Dialog.new("His fruit you will need ripe and fresh.", lilithBust),
	Dialog.new("One thing you take from his head.", lilithBust),
	Dialog.new("And the snake you sacrificed yesterday might be handy.", lilithBust),
	Dialog.new("At last take this strand of my hair.", lilithBust),
	Dialog.new("Now go and do your work.", lilithBust)
]
var dialogLucifer: Array[Dialog] = [
	Dialog.new("My lord. Welcome back.", nunBust),
	Dialog.new("I freed you, so you can end this world.", nunBust),
	Dialog.new("Baaaaahhhh", luciferBust),
	Dialog.new("...? ...?", nunBust),
	Dialog.new("Baaahhh, Baaah, Baaaaaaahhhh!", luciferBust),
	Dialog.new("What?... Is that...", nunBust),
	Dialog.new("...a GOAT?!?!??!?", nunBust),
	Dialog.new("Baaaaaahhh.", luciferBust)
]

var recipePaimon = Recipe.new(
	[DrawingName.D11, DrawingName.D12, DrawingName.D13, DrawingName.D14],
	[ItemName.NONE, ItemName.NONE, ItemName.DIRT, ItemName.YARROW, ItemName.NONE, ItemName.NONE], 
	Deamon.new(
		dialogPaimon,
		Item.new(ItemName.SHARD),
		preload("res://Sprites/Anim/Paimon.tres")
	),
	preload("res://Sprites/Circle/paimon sigil.png"),
	preload("res://Sprites/Circle/paimon small sigil.png")
)

var recipeAsmodeus = Recipe.new(
	[DrawingName.D21, DrawingName.D22, DrawingName.D23, DrawingName.D24],
	[ItemName.SKULL, ItemName.NONE, ItemName.NONE, ItemName.COAL, ItemName.VIRGIN, ItemName.NONE],
	Deamon.new(
		dialogAsmodeus,
		Item.new(ItemName.SIN),
		preload("res://Sprites/Anim/asmodeus.tres")
	),
	preload("res://Sprites/Circle/asmodeus sigil.png"),
	preload("res://Sprites/Circle/asmodeus small sigil.png")
)

var lilithRecipe = Recipe.new(
	[DrawingName.D31, DrawingName.D32, DrawingName.D33, DrawingName.D34],
	[ItemName.SALT, ItemName.RUBY, ItemName.FEATHER, ItemName.NONE, ItemName.LILY, ItemName.FOOT],
	Deamon.new(
		dialogLilith,
		Item.new(ItemName.HAIR),
		preload("res://Sprites/Anim/lilith.tres")
	),
	preload("res://Sprites/Circle/lillith sigil.png"),
	preload("res://Sprites/Circle/lillith small sigil.png")
)

var luciferRecipe = Recipe.new(
	[DrawingName.D41, DrawingName.D42, DrawingName.D43, DrawingName.D44],
	[ItemName.HAIR, ItemName.HORN, ItemName.SKIN, ItemName.SIN, ItemName.SHARD, ItemName.APPLE],
	Deamon.new(
		dialogLucifer,
		null,
		preload("res://Sprites/Anim/lucifer.tres")
	),
	preload("res://Sprites/Circle/lucifer sigil.png"),
	preload("res://Sprites/Circle/lucifer small sigil.png")
)

var recipes = [recipePaimon, recipeAsmodeus, lilithRecipe, luciferRecipe]

