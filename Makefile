all: panel.kicad_pcb fab

panel.kicad_pcb: mtb-term.kicad_pcb Makefile
	kikit panelize grid --space 3 --gridsize 2 2 --tabwidth 16 --tabheight 8 --vcuts --radius 1 mtb-term.kicad_pcb panel.kicad_pcb

fab: panel.kicad_pcb Makefile
	kikit fab jlcpcb panel.kicad_pcb fab

clean:
	rm -f panel.kicad_pcb
	rm -rf fab

.PHONY: all clean
