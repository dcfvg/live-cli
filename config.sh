source function.sh 


# gui config
# rpia=10.10.100.12
# # rpib=pi@192.168.0.
# rpic=10.10.100.13
# rpid=10.10.100.14
# rpie=10.10.100.15
# rpif=192.168.0.14

# rpis=($rpif)

# amandiers
rpia=10.10.100.12
rpib=10.10.100.20
rpic=10.10.100.14
rpid=10.10.100.15

# rpie=10.10.100.15
rpif=10.10.100.19

rpis=($rpia $rpib $rpic $rpid $rpie $rpif)
rpistrans=($rpia $rpib $rpic $rpid)

cli="~/Scripts/custom/live-cli"
content="$cli/content/"

# sudo nmap -sn 10.10.100.0/24
