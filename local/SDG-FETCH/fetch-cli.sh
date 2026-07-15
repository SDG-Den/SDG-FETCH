#!/bin/bash

ARG="$1"
ARG2="$2"

LOGO_DIR="$HOME/.local/fetch/logos"
CONF_DIR="$HOME/.local/fetch/conf"

STATEFILE="$HOME/.config/sdgfetch.state"

LOGO_CATS=$(ls "$LOGO_DIR" -1)
CONF_CATS=$(ls "$CONF_DIR" -1)

LOGOS=""
CONFS=""

for LOGOCAT in $LOGO_CATS; do
	OPTS=$(ls "$LOGO_DIR/$LOGOCAT" -1)
	for OPT in $OPTS; do
		LOGOS="$LOGOS
$LOGOCAT/$OPT"
	done
done

for CONFCAT in $CONF_CATS; do
	OPTS=$(ls "$CONF_DIR/$CONFCAT" -1)
	for OPT in $OPTS; do
		CONFS="$CONFS
$CONFCAT/$OPT"
	done
done

LOGO=$(cat $STATEFILE | cut -d: -f1)
CONF=$(cat $STATEFILE | cut -d: -f2)

# done enumerating options

case $ARG in
	config)
	SELECTEDLOGO=$(echo "$LOGOS" | fzf --layout=reverse \
	--preview-window=right:70% \
	--prompt='Select a logo:' \
	--preview-label='Preview:' \
	--preview="bat $LOGO_DIR/{}")

	SELECTEDCONF=$(echo "$CONFS" | fzf --layout=reverse \
	--preview-window=down:70% \
	--color='pointer:green' \
	--prompt='Select a config style: ' \
	--preview-label='Preview:' \
	--preview='bash -c "fastfetch --disable-linewrap 1 -l none -c ~/.local/fetch/conf/{}"')
	echo "$SELECTEDLOGO:$SELECTEDCONF" > $STATEFILE
	echo "[sdgfetch] selected logo: $SELECTEDLOGO"
	echo "[sdgfetch] selected config: $SELECTEDCONF"
		;;
	setlogo)
	OPT=$(echo "$LOGOS" | grep -e "$ARG2")
	echo "$OPT:$CONF" > $STATEFILE
	echo "[sdgfetch] selected logo: $OPT"
		;;
	setconf)
	OPT=$(echo "$CONFS" | grep -e "$ARG2")
	echo "$LOGO:$OPT" > $STATEFILE
	echo "[sdgfetch] selected configuration: $OPT"
		;;
	listlogo)
	echo "[sdgfetch] available logo's:"
	echo "$LOGOS"
		;;
	listconf)
	echo "[sdgfetch] available configurations:"
	echo "$CONFS"
		;;
	convert)
		echo "converting file $ARG2"
		filename=$(basename -- "$ARG2")
		filename_noext="${filename%.*}"
		mkdir -p "$LOGO_DIR/convert"
		outfile="$LOGO_DIR/convert/$filename_noext"
		jp2a --height=22 --colors --background=dark $ARG2 > $outfile
		echo "file converted to $outfile"
		;;
	help)
		echo "[sdgfetch]"
		echo ""
		echo "commands:"
		echo "sdgfetch - runs sdgfetch"
		echo "sdgfetch <distro> - runs sdgfetch with the specified distribution logo"
		echo "sdgfetch <logoname> - runs sdgfetch with the specified logo (uses grep matching)"
		echo "sdgfetch none - runs sdgfetch without a logo"
		echo "sdgfetch distro - runs sdgfetch with your current distro"
		echo "sdgfetch distro-themed - runs sdgfetch with your current distro, themed to your matugen scheme"
		echo ""
		echo "sdgfetch config - runs the interactive configuration tui"
		echo "sdgfetch listlogo - lists available logo's"
		echo "sdgfetch listconf - lists available configurations"
		echo "sdgfetch setlogo <logoname> - sets the logo (uses grep matching)"
		echo "sdgfetch setconf <configname> - sets the configuration (uses grep matching)"
		echo ""
		echo "sdgfetch convert <imagefile> - converts the target image to a formatted ascii"
		echo "sdgfetch help - shows this list" 
		;;
	"")
		fastfetch -l $LOGO_DIR/$LOGO -c $CONF_DIR/$CONF
		;;
	"distro")
		fastfetch -c $CONF_DIR/$CONF
		;;
	"distro-themed")
		fastfetch -c $CONF_DIR/$CONF --logo-color-1 magenta --logo-color-2 bright_cyan --logo-color-3 blue --logo-color-4 bright_cyan --logo-color-5 bright_cyan --logo-color-6 bright_blue --logo-color-7 bright_magenta
		;;
	"none")
		fastfetch -l none -c $CONF_DIR/$CONF
		;;
					 
	*)
		OPT=$(echo "$LOGOS" | grep -e "$ARG")
		if [ "$OPT" != "" ]; then
			fastfetch -l $LOGO_DIR/$OPT -c $CONF_DIR/$CONF
		else
			fastfetch -l $ARG -c $CONF_DIR/$CONF
		fi
		;;
esac
