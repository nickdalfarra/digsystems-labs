transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Alu.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Multiplier.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Booth_encoder.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Cla_32.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Cla_16.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Cla_4.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Bit_stage.v}

vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/alu_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiii_ver -L rtl_work -L work -voptargs="+acc"  alu_tb

add wave *
view structure
view signals
run 500 ns
