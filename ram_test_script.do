restart -f

vcom -reportprogress 300 -work work C:/Users/richa/Documents/niosii/simpRam.vhd
vsim work.simpram

add wave -position end  sim:/simpram/ADDR_WIDTH
add wave -position end  sim:/simpram/data
add wave -position end  sim:/simpram/address
add wave -position end  sim:/simpram/we
add wave -position end  sim:/simpram/rd
add wave -position end  sim:/simpram/word
add wave -position end  sim:/simpram/clk
add wave -position end  sim:/simpram/addr_tmp
add wave -position end  sim:/simpram/addr
add wave -position end  sim:/simpram/ram

force simpRam/address 101 @0ns, 000 @10ns -drive
force simpRam/data 16#DEADBEEF @0ns -drive -cancel @10ns
force simpRam/we 1 @0ns, 0 @10ns -drive
force simpRam/rd 0 @0ns -drive
force simpRam/word 1 @0ns, 0 @10ns -drive
force simpRam/clk 0 @0ns, 1 @5ns, 0 @10ns -drive

force simpRam/address 100 @10ns -drive
force simpRam/rd 1 @10ns -drive
force simpRam/clk 1 @15ns, 0 @20ns -drive

run 20ns
