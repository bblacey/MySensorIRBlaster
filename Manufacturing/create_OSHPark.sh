#!/bin/bash
#
#  https://www.oshpark.com/guidelines

fabHouse="OSHPark"
kiprjFile="${file##../*.pro/}"
sourceName="${kiprjFile%.*}"
gerberName="MySensorsIRBlaster"
archive="${gerberName}-${fabHouse}-Gerbers.zip"

[ -e "${archive}" ] && rm "${archive}" 

cp *.drl           ${gerberName}-BRD_DRILL.XLN  	# Drill & Holes 	[.XLN]
cp *-Edge_Cuts.gbr ${gerberName}-BRD_EDGE.GKO		# Outline		[.GKO]
cp *-F_Mask.gts    ${gerberName}-TOP_MASK.GTS		# Solder Mask Top	[.GTS]
cp *-B_Mask.gbs    ${gerberName}-BTM_MASK.GBS		# Solder Mask Bottom	[.GBS]
cp *-F_SilkS.gto   ${gerberName}-TOP_SILK.GTO		# Silk Screen Top	[.GTO]
cp *-B_SilkS.gbo   ${gerberName}-BTM_SILK.GBO		# Silk Screen Bottom	[.GBO]
cp *-F_Cu.gtl 	   ${gerberName}-TOP_COPPER.GTL		# Top Layer		[.GTL]
cp *-B_Cu.gbl 	   ${gerberName}-BTM_COPPER.GBL		# Bottom Layer		[.GBL]

zip -m ${archive} ${gerberName}-*.{GTL,GBL,GTS,GBS,GTO,GBO,GKO,XLN} 
