#!/usr/local/bin/gnuplot

set terminal postscript enhanced color size 10in, 5in fontfile '~/Library/Fonts/dejavu-sans.book.ttf'
set output 'races.ps'

# Setting plot styles
set bars fullwidth
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

set style line 1 lt 1 lc rgb "#888888" lw 1 dashtype 2
set grid ytics linestyle 1 back

set datafile separator ","
filename = 'src/races.dat'

# Adding labels above the bars
stats 'src/races.dat' using 2:4 nooutput
num_records = STATS_records

#

races = ''

do for [i=2:num_records] {
    label_x = i
    project_name = system(sprintf("awk 'NR==%d {print $1}' FS=',' src/races.dat", i))
    total_races = system(sprintf("awk 'NR==%d {print $2+$4}' FS=',' src/races.dat", i))

    # Adjusting label positions for Known, Missed, New categories
    set label at label_x - 1.1, total_races + 0.4 project_name left font ",13" rotate by 45
}

set label at 1, 9.5 "MinGW-w64" left font ",13"

plot filename using (column(2)):xtic(1) title 'Detected known races' lc rgb "#FF007A99" fs solid border lt 1, \
           '' using (-column(3)):xtic(1) title 'Missed known races' lc rgb "#FFB69E96" fs solid border lt 2, \
           '' using (column(4)):xtic(1) title 'Previously unknown races' lc rgb "#FF00CCCC" fs solid border lt 3, \
           0 notitle lc rgb "white" lw 10 lt 1, \
           0 notitle lc rgb "black" lw 2 lt 1

system('sed "s/%%BoundingBox:.*/%%BoundingBox: 0 0 1000 1000/" races.ps > races-resized.ps')
system('ps2pdf races-resized.ps races.pdf')