fx_version 'adamant'

author 'Florent_jqs'
description 'Crosshair developped by Florent_jqs'
game 'gta5'

version '1.0.0'

lua54 'yes'

client_scripts {
    "config.lua",
    "client/*.lua",
}

ui_page "html/index.html"
files {
	"html/index.html",
	"html/*.js",
	"html/*.css",
	"html/img/*.png",
	"html/img/*.gif",
	"html/img/*.jpg",
	"html/img/*.webp",
}



escrow_ignore {
    "config.lua",
}