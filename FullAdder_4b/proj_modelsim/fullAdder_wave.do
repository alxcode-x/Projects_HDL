onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /FullAdder_4b_TB/mode
add wave -noupdate -radix unsigned /FullAdder_4b_TB/a
add wave -noupdate -radix unsigned /FullAdder_4b_TB/b
add wave -noupdate /FullAdder_4b_TB/cin
add wave -noupdate -radix binary /FullAdder_4b_TB/cout
add wave -noupdate -radix decimal /FullAdder_4b_TB/sum
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {20 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {126 ps}
