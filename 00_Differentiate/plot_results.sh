# Used:
# https://askubuntu.com/a/702042/342004
# https://staff.itee.uq.edu.au/ksb/howto/gnuplot-pdf-howto.html
# https://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-8.html
# https://tldp.org/LDP/abs/html/complexfunct.html
#--------------------------------------------------------------
#!/bin/bash

function plot_two_col_file(){
    minval=0
    maxval=4219
    title="$1"; input_file="$2"; output_file="$3"; bool_flag="$4";
    #echo $title $input_file $output_file
    gnuplot -persist <<-EOFMarker
        set title "$title"
        set terminal postscript landscape enhanced color dashed lw 1 "DejaVuSans" 12
        set output "$output_file"
        if [ "$bool_flag" ]
            plot "$input_file", "./diff2.dat" using 1:2 with linespoints
        else
            plot "$input_file" using 1:2 with linespoints
        fi
EOFMarker
    # Convert ps to pdf
    ps2pdf "$output_file"
    # Delete ps
    rm "$output_file"
}

function main(){
    files=("./diff1.dat" "./diff2.dat")
    #echo ${files[@]}
    T="true"
    F=""
    plot_two_col_file "Plot of the function's sin(x**2)*cos(x**3) first derivative" "${files[0]}" "diff1.ps"
    plot_two_col_file "Plot of the function's sin(x**2)*cos(x**3) second derivative" "${files[1]}" "diff2.ps"
    plot_two_col_file "First and Second derivatives" "${files[0]}" "full.ps" $T
}

main
