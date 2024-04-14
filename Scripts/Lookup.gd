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
	FAKE_SKULL
}

var nameLookup = {
	ItemName.SKULL: "Skull of a black cat",
	ItemName.DIRT: "Gravejard Dirt",
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

var imageLookup = {
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
	ItemName.NONE: preload("res://Sprites/Items/Question.png"),
	ItemName.FAKE_SKULL: preload("res://Sprites/Items/black cat skull.png")
}

enum DrawingName {
	D11,D12,D13,D14,
	D21,D22,D23,D24,
	D31,D32,D33,D34,
	D41,D42,D43,D44
}

var recipePaimon = Recipe.new(
	[DrawingName.D11, DrawingName.D12, DrawingName.D13, DrawingName.D14],
	[ItemName.NONE, ItemName.NONE, ItemName.DIRT, ItemName.YARROW, ItemName.NONE, ItemName.NONE], 
	Deamon.new(
		[Dialog.new("123", null), Dialog.new("456", null)],
		null,
		preload("res://Sprites/Anim/Paimon.tres")
	),
	preload("res://Sprites/test1.png")
)

var recipeAsmodeus = Recipe.new(
	[DrawingName.D21, DrawingName.D22, DrawingName.D23, DrawingName.D24],
	[ItemName.SKULL, ItemName.NONE, ItemName.NONE, ItemName.COAL, ItemName.VIRGIN, ItemName.NONE],
	Deamon.new(
		[Dialog.new("123", null)],
		null,
		null
	),
	preload("res://Sprites/test1.png")
)

var lilithRecipe = Recipe.new(
	[DrawingName.D31, DrawingName.D32, DrawingName.D33, DrawingName.D34],
	[ItemName.SALT, ItemName.RUBY, ItemName.FEATHER, ItemName.NONE, ItemName.LILY, ItemName.FOOT],
	Deamon.new(
		[Dialog.new("123", null)],
		null,
		null
	),
	preload("res://Sprites/test1.png")
)

var luciferRecipe = Recipe.new(
	[DrawingName.D41, DrawingName.D42, DrawingName.D43, DrawingName.D44],
	[ItemName.HAIR, ItemName.HORN, ItemName.SKIN, ItemName.SIN, ItemName.SHARD, ItemName.APPLE],
	Deamon.new(
		[Dialog.new("123", null)],
		null,
		null
	),
	preload("res://Sprites/test1.png")
)

var recipes = [recipePaimon, recipeAsmodeus, lilithRecipe, luciferRecipe]
