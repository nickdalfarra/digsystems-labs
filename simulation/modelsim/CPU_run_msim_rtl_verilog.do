transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Bus32bit.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Mux32bit32to1.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Mux8bit32to1.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Encoder32to5.v}

vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Bus32bit_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiii_ver -L rtl_work -L work -voptargs="+acc"  Bus32bit_tb

add wave *
view structure
view signals
run 500 ns
