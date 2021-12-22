# Used:
# https://askubuntu.com/a/702042/342004
# https://staff.itee.uq.edu.au/ksb/howto/gnuplot-pdf-howto.html
# https://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-8.html
# https://tldp.org/LDP/abs/html/complexfunct.html
#--------------------------------------------------------------
#!/bin/bash

function plot_two_col_file (){
    minval=0
    maxval=4219
    title = $1; input_file = $2; output_file = $3
    gnuplot -persist <<-EOFMarker
        set title "$title"
        set terminal postscript landscape enhanced color dashed lw 1 "DejaVuSans" 12
        set output "$output_filename"
        plot "$input_file" using 1:2 with linespoints
    EOFMarker
    # Convert ps to pdf
    ps2pdf output_filename
    # Delete ps
    rm output_filename
}

function main() {
    plot_two_col_file "Plot of the function's sin(x**2)*cos(x**3) first derivative" "./diff1.dat" "diff1.ps"
}

plot_two_col_file "test" "./diff1.dat" "diff1.ps"
