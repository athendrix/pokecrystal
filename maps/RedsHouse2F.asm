	const_def 2 ; object constants
	const REDSHOUSE_MEW

RedsHouse2F_MapScripts:
	def_scene_scripts

	def_callbacks

RedsHouse2FN64Script:
	jumptext RedsHouse2FN64Text

RedsHouse2FPCScript:
	jumptext RedsHouse2FPCText

RedsHouseDoll:
	checkevent EVENT_UNLOCK_BONUS_LEGENDARIES
	iftrue RedsHouseMew
	faceplayer
	opentext
	writetext DollText
	waitbutton
	closetext
	end

RedsHouseMew:
	faceplayer
	opentext
	writetext MewText
	cry MEW
	pause 15
	closetext
	setevent EVENT_FOUGHT_MEW
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon MEW, 30
	startbattle
	disappear REDSHOUSE_MEW
	reloadmapafterbattle
	end

MewText:
	text "Mew!"
	done

DollText:
	text "It's a realistic"
	line "looking MEW doll."
	done

RedsHouse2FN64Text:
	text "<PLAYER> played the"
	line "N64."

	para "Better get going--"
	line "no time to lose!"
	done

RedsHouse2FPCText:
	text "It looks like it"
	line "hasn't been used"
	cont "in a long time…"
	done

RedsHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  0, REDS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  3,  5, BGEVENT_READ, RedsHouse2FN64Script
	bg_event  0,  1, BGEVENT_READ, RedsHouse2FPCScript

	def_object_events
	object_event  1, 1, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, RedsHouseDoll, EVENT_FOUGHT_MEW
	
