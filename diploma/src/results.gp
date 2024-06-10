#!/usr/local/bin/gnuplot

set terminal tikz size 14,8 createstyle
set output 'tikzpictures/races.tex'

# Setting plot styles
set bars fullwidth
set encoding utf8
set boxwidth 0.9 relative
set style data histograms
set style histogram rowstacked
set style fill solid
set linetype 1 lw 4 lc rgb "white"
set linetype 2 lw 4 lc rgb "white"
set linetype 3 lw 4 lc rgb "white"
set key noenhanced
unset border
set yrange [-2:11]
unset xtics

set key font ",8" samplen 5 spacing 1.5

set datafile separator ","
filename = 'src/races.dat'

# Adding labels above the bars
stats filename using 2:4 nooutput
num_records = STATS_records

#

races = ''

do for [i=2:num_records] {
    label_x = i
    project_name = system(sprintf("awk 'NR==%d {print $1}' FS=',' %s", i, filename))
    total_races = system(sprintf("awk 'NR==%d {print $2+$4}' FS=',' %s", i, filename))

    # Adjusting label positions for Known, Missed, New categories
    set label at label_x - 1.3, total_races + 0.2 project_name left font ",8" rotate by 50
}

set label at 1, 9.5 "MinGW-w64" left font ",8"

plot filename using (column(2)):xtic(1) \
                title 'Гонки, обнаруженные обоими инструментами' \
                lw 2 \
                lc rgb "black" \
                fs pattern 3 \
                border, \
           '' using (-column(3)):xtic(1) \
                title 'Гонки, обнаруженные только \texttt{-{}-shuffle}' \
                lw 2 \
                lc rgb "black" \
                fs pattern 1 \
                border, \
           '' using (column(4)):xtic(1) \
                title 'Гонки, обнаруженные только parmasan' \
                lw 2 \
                lc rgb "black" \
                fs pattern 2 \
                border, \
           0 notitle lc rgb "black" lw 2 lt 1