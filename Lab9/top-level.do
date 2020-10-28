onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ahb_lite_fir_filter/tb_clk
add wave -noupdate -expand -group {AHB Control Signals} /tb_ahb_lite_fir_filter/tb_htrans
add wave -noupdate -expand -group {AHB Control Signals} /tb_ahb_lite_fir_filter/tb_haddr
add wave -noupdate -expand -group {AHB Control Signals} /tb_ahb_lite_fir_filter/tb_hsize
add wave -noupdate -expand -group {AHB Control Signals} /tb_ahb_lite_fir_filter/tb_hwrite
add wave -noupdate -expand -group {AHB Control Signals} -radix unsigned /tb_ahb_lite_fir_filter/tb_hwdata
add wave -noupdate -expand -group {AHB Control Signals} -radix unsigned /tb_ahb_lite_fir_filter/tb_hrdata
add wave -noupdate -expand -group {AHB Control Signals} /tb_ahb_lite_fir_filter/tb_hresp
add wave -noupdate -expand -group Registers -radix unsigned /tb_ahb_lite_fir_filter/DUT/ahb_slv_interface/sample_data
add wave -noupdate -expand -group Registers /tb_ahb_lite_fir_filter/DUT/ahb_slv_interface/status
add wave -noupdate -expand -group Registers -radix unsigned /tb_ahb_lite_fir_filter/DUT/ahb_slv_interface/result
add wave -noupdate -expand -group Registers -radix unsigned /tb_ahb_lite_fir_filter/DUT/ahb_slv_interface/F0
add wave -noupdate -expand -group Registers -radix unsigned /tb_ahb_lite_fir_filter/DUT/ahb_slv_interface/F1
add wave -noupdate -expand -group Registers -radix unsigned /tb_ahb_lite_fir_filter/DUT/ahb_slv_interface/F2
add wave -noupdate -expand -group Registers -radix unsigned /tb_ahb_lite_fir_filter/DUT/ahb_slv_interface/F3
add wave -noupdate -expand -group Registers /tb_ahb_lite_fir_filter/DUT/ahb_slv_interface/new_coeff_confirm
add wave -noupdate -expand -group {FIR Control Signals} /tb_ahb_lite_fir_filter/DUT/ahb_slv_interface/modwait
add wave -noupdate -expand -group {FIR Control Signals} /tb_ahb_lite_fir_filter/DUT/ahb_slv_interface/err
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/ahb_slv_interface/data_ready
add wave -noupdate -expand -group {FIR Registers} -radix unsigned {/tb_ahb_lite_fir_filter/DUT/fir/computer/RF/regs_matrix[10]}
add wave -noupdate -expand -group {FIR Registers} -radix unsigned {/tb_ahb_lite_fir_filter/DUT/fir/computer/RF/regs_matrix[9]}
add wave -noupdate -expand -group {FIR Registers} -radix unsigned {/tb_ahb_lite_fir_filter/DUT/fir/computer/RF/regs_matrix[8]}
add wave -noupdate -expand -group {FIR Registers} -radix unsigned {/tb_ahb_lite_fir_filter/DUT/fir/computer/RF/regs_matrix[7]}
add wave -noupdate -expand -group {FIR Registers} -radix unsigned {/tb_ahb_lite_fir_filter/DUT/fir/computer/RF/regs_matrix[6]}
add wave -noupdate -expand -group {FIR Registers} -radix decimal {/tb_ahb_lite_fir_filter/DUT/fir/computer/RF/regs_matrix[5]}
add wave -noupdate -expand -group {FIR Registers} -radix decimal {/tb_ahb_lite_fir_filter/DUT/fir/computer/RF/regs_matrix[4]}
add wave -noupdate -expand -group {FIR Registers} -radix decimal {/tb_ahb_lite_fir_filter/DUT/fir/computer/RF/regs_matrix[3]}
add wave -noupdate -expand -group {FIR Registers} -radix decimal {/tb_ahb_lite_fir_filter/DUT/fir/computer/RF/regs_matrix[2]}
add wave -noupdate -expand -group {FIR Registers} -radix decimal {/tb_ahb_lite_fir_filter/DUT/fir/computer/RF/regs_matrix[1]}
add wave -noupdate -expand -group {FIR Registers} -radix decimal {/tb_ahb_lite_fir_filter/DUT/fir/computer/RF/regs_matrix[0]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {697592 ps} 0}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1260 ns}
