restart -f
force -freeze sim:/balise/h 1 20, 0 {70 ps} -r 100
force -freeze sim:/balise/r 0 0, 1 300 ps,  0 {350 ps}
run 3000