onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /chopsticks_tb/uut/clk
add wave -noupdate /chopsticks_tb/uut/reset
add wave -noupdate /chopsticks_tb/uut/state_reg
add wave -noupdate /chopsticks_tb/uut/state_next
add wave -noupdate -expand -group Inputs /chopsticks_tb/uut/switches
add wave -noupdate -expand -group Inputs /chopsticks_tb/split_tb
add wave -noupdate -expand -group Inputs /chopsticks_tb/secure_tb
add wave -noupdate -expand -group Inputs /chopsticks_tb/uut/sw_instruction
add wave -noupdate -expand -group Inputs /chopsticks_tb/uut/rx_instruction
add wave -noupdate -expand -group Hands -radix decimal /chopsticks_tb/uut/int_my_left
add wave -noupdate -expand -group Hands -radix decimal /chopsticks_tb/uut/int_my_right
add wave -noupdate -expand -group Hands -radix decimal /chopsticks_tb/uut/int_your_left
add wave -noupdate -expand -group Hands -radix decimal /chopsticks_tb/uut/int_your_right
add wave -noupdate -expand -group Player /chopsticks_tb/uut/Player/instruction
add wave -noupdate -expand -group Player /chopsticks_tb/uut/Player/split
add wave -noupdate -expand -group Player /chopsticks_tb/uut/enable0
add wave -noupdate -expand -group Player -radix decimal /chopsticks_tb/uut/Player/over_left
add wave -noupdate -expand -group Player -radix decimal /chopsticks_tb/uut/Player/next_left
add wave -noupdate -expand -group Player -radix decimal /chopsticks_tb/uut/Player/int_my_left
add wave -noupdate -expand -group Player -radix decimal /chopsticks_tb/uut/Player/my_left
add wave -noupdate -expand -group Player -radix decimal /chopsticks_tb/uut/Player/over_right
add wave -noupdate -expand -group Player -radix decimal /chopsticks_tb/uut/Player/next_right
add wave -noupdate -expand -group Player -radix decimal /chopsticks_tb/uut/Player/int_my_right
add wave -noupdate -expand -group Player -radix decimal /chopsticks_tb/uut/Player/my_right
add wave -noupdate -expand -group Player -radix decimal /chopsticks_tb/uut/Player/your_left
add wave -noupdate -expand -group Player -radix decimal /chopsticks_tb/uut/Player/your_right
add wave -noupdate -expand -group Opponent /chopsticks_tb/uut/Opponent/instruction
add wave -noupdate -expand -group Opponent /chopsticks_tb/uut/Opponent/split
add wave -noupdate -expand -group Opponent /chopsticks_tb/uut/enable1
add wave -noupdate -expand -group Opponent -radix decimal /chopsticks_tb/uut/Opponent/over_left
add wave -noupdate -expand -group Opponent -radix decimal /chopsticks_tb/uut/Opponent/next_left
add wave -noupdate -expand -group Opponent -radix decimal /chopsticks_tb/uut/Opponent/int_my_left
add wave -noupdate -expand -group Opponent -radix decimal /chopsticks_tb/uut/Opponent/my_left
add wave -noupdate -expand -group Opponent -radix decimal /chopsticks_tb/uut/Opponent/over_right
add wave -noupdate -expand -group Opponent -radix decimal /chopsticks_tb/uut/Opponent/next_right
add wave -noupdate -expand -group Opponent -radix decimal /chopsticks_tb/uut/Opponent/int_my_right
add wave -noupdate -expand -group Opponent -radix decimal /chopsticks_tb/uut/Opponent/my_right
add wave -noupdate -expand -group Opponent -radix decimal /chopsticks_tb/uut/Opponent/your_left
add wave -noupdate -expand -group Opponent -radix decimal /chopsticks_tb/uut/Opponent/your_right
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {753032 ps} 0}
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
WaveRestoreZoom {470418 ps} {855668 ps}
