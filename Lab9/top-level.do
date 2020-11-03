onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ahb_lite_fir_filter/tb_clk
add wave -noupdate -expand -group {AHB Control Signals} /tb_ahb_lite_fir_filter/tb_hsel
add wave -noupdate -expand -group {AHB Control Signals} -radix unsigned -childformat {{{/tb_ahb_lite_fir_filter/tb_htrans[1]} -radix decimal} {{/tb_ahb_lite_fir_filter/tb_htrans[0]} -radix decimal}} -subitemconfig {{/tb_ahb_lite_fir_filter/tb_htrans[1]} {-height 16 -radix decimal} {/tb_ahb_lite_fir_filter/tb_htrans[0]} {-height 16 -radix decimal}} /tb_ahb_lite_fir_filter/tb_htrans
add wave -noupdate -expand -group {AHB Control Signals} -radix hexadecimal /tb_ahb_lite_fir_filter/tb_haddr
add wave -noupdate -expand -group {AHB Control Signals} -radix decimal /tb_ahb_lite_fir_filter/tb_hsize
add wave -noupdate -expand -group {AHB Control Signals} /tb_ahb_lite_fir_filter/tb_hwrite
add wave -noupdate -expand -group {AHB Control Signals} -radix unsigned /tb_ahb_lite_fir_filter/tb_hwdata
add wave -noupdate -expand -group {AHB Control Signals} -radix unsigned /tb_ahb_lite_fir_filter/tb_hrdata
add wave -noupdate -expand -group {AHB Control Signals} /tb_ahb_lite_fir_filter/tb_hresp
add wave -noupdate -expand -group Registers -radix unsigned /tb_ahb_lite_fir_filter/DUT/ahb_slv_interface/sample_data
add wave -noupdate -expand -group Registers -radix unsigned /tb_ahb_lite_fir_filter/DUT/ahb_slv_interface/F0
add wave -noupdate -expand -group Registers -radix unsigned /tb_ahb_lite_fir_filter/DUT/ahb_slv_interface/F1
add wave -noupdate -expand -group Registers -radix unsigned /tb_ahb_lite_fir_filter/DUT/ahb_slv_interface/F2
add wave -noupdate -expand -group Registers -radix unsigned /tb_ahb_lite_fir_filter/DUT/ahb_slv_interface/F3
add wave -noupdate -expand -group Registers -radix unsigned /tb_ahb_lite_fir_filter/DUT/ahb_slv_interface/new_coeff_confirm
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/new_coefficient_set
add wave -noupdate -expand -group {FIR Control Signals} /tb_ahb_lite_fir_filter/DUT/fir/lc
add wave -noupdate -expand -group {FIR Control Signals} /tb_ahb_lite_fir_filter/DUT/ahb_slv_interface/modwait
add wave -noupdate -expand -group {FIR Control Signals} /tb_ahb_lite_fir_filter/DUT/coeff_loader/coefficient_num
add wave -noupdate -expand -group {FIR Control Signals} -radix unsigned /tb_ahb_lite_fir_filter/DUT/fir/fir_coefficient
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
add wave -noupdate -expand -group {FIR Outputs} /tb_ahb_lite_fir_filter/DUT/fir/err
add wave -noupdate -expand -group {FIR Outputs} -radix unsigned -childformat {{{/tb_ahb_lite_fir_filter/DUT/fir/fir_out[15]} -radix unsigned} {{/tb_ahb_lite_fir_filter/DUT/fir/fir_out[14]} -radix unsigned} {{/tb_ahb_lite_fir_filter/DUT/fir/fir_out[13]} -radix unsigned} {{/tb_ahb_lite_fir_filter/DUT/fir/fir_out[12]} -radix unsigned} {{/tb_ahb_lite_fir_filter/DUT/fir/fir_out[11]} -radix unsigned} {{/tb_ahb_lite_fir_filter/DUT/fir/fir_out[10]} -radix unsigned} {{/tb_ahb_lite_fir_filter/DUT/fir/fir_out[9]} -radix unsigned} {{/tb_ahb_lite_fir_filter/DUT/fir/fir_out[8]} -radix unsigned} {{/tb_ahb_lite_fir_filter/DUT/fir/fir_out[7]} -radix unsigned} {{/tb_ahb_lite_fir_filter/DUT/fir/fir_out[6]} -radix unsigned} {{/tb_ahb_lite_fir_filter/DUT/fir/fir_out[5]} -radix unsigned} {{/tb_ahb_lite_fir_filter/DUT/fir/fir_out[4]} -radix unsigned} {{/tb_ahb_lite_fir_filter/DUT/fir/fir_out[3]} -radix unsigned} {{/tb_ahb_lite_fir_filter/DUT/fir/fir_out[2]} -radix unsigned} {{/tb_ahb_lite_fir_filter/DUT/fir/fir_out[1]} -radix unsigned} {{/tb_ahb_lite_fir_filter/DUT/fir/fir_out[0]} -radix unsigned}} -subitemconfig {{/tb_ahb_lite_fir_filter/DUT/fir/fir_out[15]} {-height 16 -radix unsigned} {/tb_ahb_lite_fir_filter/DUT/fir/fir_out[14]} {-height 16 -radix unsigned} {/tb_ahb_lite_fir_filter/DUT/fir/fir_out[13]} {-height 16 -radix unsigned} {/tb_ahb_lite_fir_filter/DUT/fir/fir_out[12]} {-height 16 -radix unsigned} {/tb_ahb_lite_fir_filter/DUT/fir/fir_out[11]} {-height 16 -radix unsigned} {/tb_ahb_lite_fir_filter/DUT/fir/fir_out[10]} {-height 16 -radix unsigned} {/tb_ahb_lite_fir_filter/DUT/fir/fir_out[9]} {-height 16 -radix unsigned} {/tb_ahb_lite_fir_filter/DUT/fir/fir_out[8]} {-height 16 -radix unsigned} {/tb_ahb_lite_fir_filter/DUT/fir/fir_out[7]} {-height 16 -radix unsigned} {/tb_ahb_lite_fir_filter/DUT/fir/fir_out[6]} {-height 16 -radix unsigned} {/tb_ahb_lite_fir_filter/DUT/fir/fir_out[5]} {-height 16 -radix unsigned} {/tb_ahb_lite_fir_filter/DUT/fir/fir_out[4]} {-height 16 -radix unsigned} {/tb_ahb_lite_fir_filter/DUT/fir/fir_out[3]} {-height 16 -radix unsigned} {/tb_ahb_lite_fir_filter/DUT/fir/fir_out[2]} {-height 16 -radix unsigned} {/tb_ahb_lite_fir_filter/DUT/fir/fir_out[1]} {-height 16 -radix unsigned} {/tb_ahb_lite_fir_filter/DUT/fir/fir_out[0]} {-height 16 -radix unsigned}} /tb_ahb_lite_fir_filter/DUT/fir/fir_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3505422 ps} 0}
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
WaveRestoreZoom {3104796 ps} {5388548 ps}
