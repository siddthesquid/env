#!/usr/bin/bash

##############
# FORMATTING #
##############

declare -A ps1_format

ps1_format[normal]=0
ps1_format[bold]=1
ps1_format[dim]=2
ps1_format[underlined]=4
ps1_format[inverted]=7
ps1_format[hidden]=8

ps1_format[fg_default]=39
ps1_format[fg_black]=30
ps1_format[fg_red]=31
ps1_format[fg_green]=32
ps1_format[fg_yellow]=33
ps1_format[fg_blue]=34
ps1_format[fg_purple]=35
ps1_format[fg_cyan]=36
ps1_format[fg_light_gray]=37
ps1_format[fg_dark_gray]=90
ps1_format[fg_light_red]=91
ps1_format[fg_light_green]=92
ps1_format[fg_light_yellow]=93
ps1_format[fg_light_blue]=94
ps1_format[fg_light_purple]=95
ps1_format[fg_light_cyan]=96
ps1_format[fg_white]=97

ps1_format[bg_default]=49
ps1_format[bg_black]=40
ps1_format[bg_red]=41
ps1_format[bg_green]=42
ps1_format[bg_yellow]=43
ps1_format[bg_blue]=44
ps1_format[bg_purple]=45
ps1_format[bg_cyan]=46
ps1_format[bg_light_gray]=47
ps1_format[bg_dark_gray]=100
ps1_format[bg_light_red]=101
ps1_format[bg_light_green]=102
ps1_format[bg_light_yellow]=103
ps1_format[bg_light_blue]=104
ps1_format[bg_light_purple]=105
ps1_format[bg_light_cyan]=106
ps1_format[bg_white]=107

ps1_get_format_code(){
	[[ $# -eq 1 ]] || { echo "ps1_get_format_code: must supply value"; return 1; }
	echo ${ps1_format[$1]}
}

ps1_encode_style(){
	style_code="\033[0"
	for format in $@; do
		style_code="$style_code;$(ps1_get_format_code $format)"
	done
	echo -e "\001${style_code}m\002"
}

ps1_reset_style(){
	ps1_encode_style normal
}

ps1_divider(){
	echo -e $'\ue0b0'
}
