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
BEDROCK_LOGOS=$(cat <<- EOF
alma=\e[38;2;0;52;102m\e[0m
alpine=\e[38;2;13;89;127m\e[0m
aosc=\e[38;2;15;74;118m\e[0m
arch=\e[38;2;23;147;209m\e[0m
artix=\e[38;2;16;160;204m\e[0m
centos=\e[38;2;147;34;121m\e[0m
chimera=
crux=
debian=\e[38;2;215;10;83m\e[0m
devuan=\e[38;2;15;107;97m\e[0m
exherbo=
fedora=\e[38;2;11;87;164m\e[0m
gentoo=\e[38;2;84;72;122m\e[0m
kiss=
mageia=\e[38;2;60;110;180m\e[0m
manjaro=\e[38;2;53;191;92m\e[0m
nixos=\e[38;2;77;111;183m\e[0m
opensuse=\e[38;2;115;186;37m\e[0m
openwrt=
puppy=\e[38;2;61;106;156m\e[0m
redhat=\e[38;2;204;0;0m\e[0m
rocky=\e[38;2;16;185;129m\e[0m
slackware=\e[38;2;53;181;229m\e[0m
solus=\e[38;2;82;148;226m\e[0m
ubuntu=\e[38;2;233;84;32m\e[0m
void=\e[38;2;71;128;97m\e[0m
bedrock=(BRL)
EOF
)

bedrock-check() {
	if which brl > /dev/null; then
	STRATA_LIST=$(brl list)
	STRATA_STRING="Strata: "
	for STRATUM in $STRATA_LIST; do
		LOGO=$(echo "$BEDROCK_LOGOS" | grep -e "$STRATUM" | cut -d= -f2)
		if [ "$LOGO" == "" ]; then LOGO=""; fi
		STRATA_STRING=$(echo "$STRATA_STRING $LOGO $STRATUM")
	done
		echo -e "$STRATA_STRING"
	
	fi
}

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
	OPT=$(echo "$LOGOS" | grep -e "$ARG2" | head -n 1)
	echo "$OPT:$CONF" > $STATEFILE
	echo "[sdgfetch] selected logo: $OPT"
		;;
	setconf)
	OPT=$(echo "$CONFS" | grep -e "$ARG2" | head -n 1)
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
	"bedrock-check")
		bedrock-check
		;;
	"")
		fastfetch -l $LOGO_DIR/$LOGO -c $CONF_DIR/$CONF
		bedrock-check
		;;
	"distro")
		fastfetch -c $CONF_DIR/$CONF
		bedrock-check
		;;
	"distro-themed")
		fastfetch -c $CONF_DIR/$CONF --logo-color-1 magenta --logo-color-2 bright_cyan --logo-color-3 blue --logo-color-4 bright_cyan --logo-color-5 bright_cyan --logo-color-6 bright_blue --logo-color-7 bright_magenta
		bedrock-check
		;;
	"none")
		fastfetch -l none -c $CONF_DIR/$CONF
		bedrock-check
		;;
					 
	*)
		OPT=$(echo "$LOGOS" | grep -e "$ARG")
		if [ "$OPT" != "" ]; then
			fastfetch -l $LOGO_DIR/$OPT -c $CONF_DIR/$CONF
			bedrock-check
		else
			fastfetch -l $ARG -c $CONF_DIR/$CONF
			bedrock-check
		fi
		;;
esac
