# Used:
# https://askubuntu.com/a/702042/342004
# https://staff.itee.uq.edu.au/ksb/howto/gnuplot-pdf-howto.html
#--------------------------------------------------------------
#!/bin/bash

minval=0
maxval=4219
gnuplot -persist << EOFMarker
    set title "Plot of the function's sin(x**2)*cos(x**3) first derivative"
    set terminal postscript landscape enhanced color dashed lw 1 "DejaVuSans" 12
    set output "diff1.ps"
    plot "./diff1.dat" using 1:2 with linespoints
EOFMarker

ps2pdf diff1.ps
rm diff1.ps
