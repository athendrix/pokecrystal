const_value set 2
	const REDSHOUSE_MEW

RedsHouse2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

MapRedsHouse2FSignpost0Script:
	jumptext UnknownText_0x19b050

MapRedsHouse2FSignpost1Script:
	jumptext UnknownText_0x19b087

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

UnknownText_0x19b050:
	text "<PLAYER> played the"
	line "N64."

	para "Better get going--"
	line "no time to lose!"
	done

UnknownText_0x19b087:
	text "It looks like it"
	line "hasn't been used"
	cont "in a long time…"
	done

RedsHouse2F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $0, $7, 3, REDS_HOUSE_1F

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 5, 3, SIGNPOST_READ, MapRedsHouse2FSignpost0Script
	signpost 1, 0, SIGNPOST_READ, MapRedsHouse2FSignpost1Script

.PersonEvents:
	db 1
	person_event SPRITE_FAIRY, 1, 1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, RedsHouseDoll, EVENT_FOUGHT_MEW
