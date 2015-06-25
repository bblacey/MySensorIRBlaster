#!/bin/bash
#
#  http://smart-prototyping.com/Prototyping-Services/Electronic-Prototyping/PCB-Prototyping.html

kiprjFile="${file##../*.pro/}"
sourceName="${kiprjFile%.*}"
gerberName="MySensorsIRBlaster"
archive="${gerberName}-Gerbers.zip"

[ -e "${archive}" ] && rm "${archive}" 

cp *.drl           ${gerberName}-BRD_DRILL.TXT  	# Drill & Holes 	[.TXT]
cp *-Edge_Cuts.gbr ${gerberName}-BRD_EDGE.GML		# Outline		[.GML]
cp *-F_Paste.gtp   ${gerberName}-TOP_PASTE.GTP		# Solder Paste Top	[.GTP]
cp *-B_Paste.gbp   ${gerberName}-BTM_PASTE.GBP		# Solder Paste Bottom	[.GBP]
cp *-F_Mask.gts    ${gerberName}-TOP_MASK.GTS		# Solder Mask Top	[.GTS]
cp *-B_Mask.gbs    ${gerberName}-BTM_MASK.GTB		# Solder Mask Bottom	[.GTB]
cp *-F_SilkS.gto   ${gerberName}-TOP_SILK.GTO		# Silk Screen Top	[.GTO]
cp *-B_SilkS.gbo   ${gerberName}-BTM_SILK.GBO		# Silk Screen Bottom	[.GBO]
cp *-F_Cu.gtl      ${gerberName}-TOP_COPPER.GTL		# Top Layer		[.GTL]
cp *-B_Cu.gbl 	   ${gerberName}-BTM_COPPER.GBL		# Bottom Layer		[.GBL]

zip -m ${archive} ${gerberName}-*.{TXT,GML,GTP,GBP,GTS,GTB,GTO,GBO,GTL,GBL} 
