transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Sel_Enc.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/R0.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Outport.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Or12Bit.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Inport.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Datapath.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/And4Bit.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Alu.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Multiplier.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Booth_encoder.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Cla_32.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Cla_16.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Cla_4.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/MuxMD.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/MDR_unit.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Register64.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Register32.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/MDR.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Bit_stage.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Bus32bit.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Mux32bit32to1.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Mux8bit32to1.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Encoder32to5.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/Divider32bit.v}

vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/digsystems-labs {C:/altera/13.0sp1/digsystems-labs/p2_datapath_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiii_ver -L rtl_work -L work -voptargs="+acc"  p2_datapath_tb

add wave *
view structure
view signals
run 200 ns
