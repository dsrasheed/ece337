#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Wed Nov  4 14:51:01 2020                
#                                                     
#######################################################

#@(#)CDS: Innovus v16.12-s051_1 (64bit) 08/17/2016 12:18 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute 16.12-s051_1 NR160816-1350/16_12-UB (database version 2.30, 347.6.1) {superthreading v1.30}
#@(#)CDS: AAE 16.12-s026 (64bit) 08/17/2016 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 16.12-s023_1 () Aug 12 2016 01:35:46 ( )
#@(#)CDS: SYNTECH 16.12-s009_1 () Aug 11 2016 01:33:09 ( )
#@(#)CDS: CPE v16.12-s054
#@(#)CDS: IQRC/TQRC 15.2.4-s467 (64bit) Wed Jul 20 17:12:38 PDT 2016 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getDrawView
loadWorkspace -name Physical
win
set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getDrawView
loadWorkspace -name Physical
win
set ::TimeLib::tsgMarkCellLatchConstructFlag 1
set conf_qxconf_file NULL
set conf_qxlib_file NULL
set defHierChar /
set delaycal_input_transition_delay 0.1ps
set distributed_client_message_echo 1
set distributed_mmmc_disable_reports_auto_redirection 0
set floorplan_default_site core
set fpIsMaxIoHeight 0
set init_gnd_net gnd
set init_io_file innovus.io
set init_lef_file {/package/eda/cells/OSU/v2.7/cadence/lib/ami05/lib/osu05_stdcells.lef /package/eda/cells/OSU/v2.7/cadence/lib/ami05/lib/osu05_stdcells.stacks.lef}
set init_mmmc_file osu05_MMMC.view
set init_oa_search_lib {}
set init_pwr_net vdd
set init_verilog mapped/layout_lab_design.v
set latch_time_borrow_mode max_borrow
set pegDefaultResScaleFactor 1
set pegDetailResScaleFactor 1
set report_inactive_arcs_format {from to when arc_type sense reason}
set timing_library_ccs_noise_vin_clip_points {}
set timing_library_ccs_noise_vout_clip_points {}
set timing_library_load_pin_cap_indices {}
set timing_library_write_library_to_directory {}
set tso_post_client_restore_command {update_timing ; write_eco_opt_db ;}
init_design
floorPlan -r 1.0 0.6 50 50 50 50
unfixAllIos
legalizePin
addRing -spacing_bottom 9.9 -width_left 9.9 -width_bottom 9.9 -width_top 9.9 -spacing_top 9.9 -layer_bottom metal1 -width_right 9.9 -around default_power_domain -center 1 -layer_top metal1 -spacing_right 9.9 -spacing_left 9.9 -layer_right metal2 -layer_left metal2 -offset 9.9 -nets { gnd vdd }
selectInst G1
deselectAll
selectInst G1
deselectAll
selectWire 330.1500 330.4500 340.0500 1160.5500 2 gnd
deselectAll
selectWire 310.3500 310.6500 320.2500 1180.3500 2 vdd
deselectAll
selectWire 310.3500 310.6500 320.2500 1180.3500 2 vdd
deselectAll
selectInst G1
deselectAll
selectWire 310.3500 310.6500 320.2500 1180.3500 2 vdd
selectInst G1
deselectAll
selectWire 330.1500 330.4500 340.0500 1160.5500 2 gnd
selectWire 310.3500 310.6500 320.2500 1180.3500 2 vdd
selectInst G1
deselectAll
selectWire 310.3500 310.6500 1189.6500 320.5500 1 vdd
deselectAll
selectWire 310.3500 310.6500 1189.6500 320.5500 1 vdd
deselectAll
selectWire 330.1500 330.4500 1169.8500 340.3500 1 gnd
deselectAll
selectInst P2
deselectAll
selectWire 310.3500 310.6500 1189.6500 320.5500 1 vdd
deselectAll
selectWire 330.1500 330.4500 1169.8500 340.3500 1 gnd
deselectAll
selectWire 310.3500 310.6500 1189.6500 320.5500 1 vdd
deselectAll
selectWire 330.1500 330.4500 1169.8500 340.3500 1 gnd
deselectAll
selectWire 310.3500 310.6500 1189.6500 320.5500 1 vdd
deselectAll
selectWire 330.1500 330.4500 1169.8500 340.3500 1 gnd
deselectAll
selectWire 310.3500 310.6500 1189.6500 320.5500 1 vdd
deselectAll
selectWire 1179.7500 310.6500 1189.6500 1180.3500 2 vdd
deselectAll
selectWire 310.3500 310.6500 320.2500 1180.3500 2 vdd
zoomOut
zoomOut
zoomOut
zoomOut
zoomIn
zoomIn
zoomIn
deselectAll
selectWire 310.3500 310.6500 320.2500 1180.3500 2 vdd
deselectAll
selectWire 330.1500 330.4500 340.0500 1160.5500 2 gnd
deselectAll
selectWire 310.3500 310.6500 320.2500 1180.3500 2 vdd
zoomOut
zoomOut
zoomIn
zoomIn
zoomOut
zoomOut
zoomOut
deselectAll
selectWire 330.1500 1150.6500 1169.8500 1160.5500 1 gnd
zoomSelected
zoomIn
zoomIn
zoomIn
zoomSelected
zoomSelected
deselectAll
zoomSelected
zoomIn
gui_select -rect {780.564 1049.431 730.161 1293.942}
selectInst G0
deselectAll
selectWire 330.1500 1150.6500 1169.8500 1160.5500 1 gnd
deselectAll
selectWire 1159.9500 330.4500 1169.8500 1160.5500 2 gnd
deselectAll
setLayerPreference allM0 -isVisible 0
setLayerPreference allM0 -isVisible 1
setLayerPreference allM0 -isSelectable 0
setLayerPreference allM0 -isVisible 0
zoomOut
zoomOut
zoomIn
setLayerPreference allM0 -isVisible 1
setLayerPreference allM0 -isSelectable 1
setLayerPreference inst -isVisible 0
setLayerPreference inst -isVisible 1
setLayerPreference inst -isVisible 0
setLayerPreference inst -isVisible 1
setLayerPreference inst -isSelectable 0
setLayerPreference inst -isSelectable 1
setLayerPreference block -isSelectable 0
setLayerPreference block -isSelectable 1
setLayerPreference stdCell -isSelectable 0
setLayerPreference stdCell -isSelectable 1
setLayerPreference coverCell -isSelectable 0
setLayerPreference coverCell -isSelectable 1
setLayerPreference coverCell -isVisible 0
setLayerPreference coverCell -isVisible 1
setLayerPreference phyCell -isVisible 0
setLayerPreference phyCell -isVisible 1
setLayerPreference phyCell -isVisible 0
setLayerPreference phyCell -isVisible 1
setLayerPreference phyCell -isVisible 0
setLayerPreference phyCell -isVisible 1
setLayerPreference phyCell -isVisible 0
setLayerPreference phyCell -isVisible 1
setLayerPreference io -isVisible 0
setLayerPreference io -isVisible 1
setLayerPreference io -isVisible 0
setLayerPreference io -isVisible 1
setLayerPreference phyCell -isVisible 0
setLayerPreference phyCell -isVisible 1
setLayerPreference coverCell -isVisible 0
setLayerPreference coverCell -isVisible 1
setLayerPreference coverCell -isVisible 0
setLayerPreference coverCell -isVisible 1
setLayerPreference stdCell -isVisible 0
setLayerPreference stdCell -isVisible 1
setLayerPreference block -isVisible 0
setLayerPreference block -isVisible 1
setLayerPreference pwrdm -isVisible 0
setLayerPreference pwrdm -isVisible 1
setLayerPreference pwrdm -isSelectable 0
setLayerPreference pwrdm -isSelectable 1
setLayerPreference pwrdm -isVisible 0
setLayerPreference pwrdm -isVisible 1
setLayerPreference metalFill -isVisible 0
setLayerPreference metalFill -isVisible 1
setLayerPreference metalFill -isVisible 0
setLayerPreference metalFill -isVisible 1
setLayerPreference net -isVisible 0
setLayerPreference net -isVisible 1
setLayerPreference pgPower -isVisible 0
setLayerPreference pgPower -isVisible 1
setLayerPreference pgPower -isVisible 0
setLayerPreference pgPower -isVisible 1
setLayerPreference pgGround -isVisible 0
setLayerPreference pgGround -isVisible 1
selectWire 330.1500 330.4500 340.0500 1160.5500 2 gnd
deselectAll
selectWire 310.3500 310.6500 320.2500 1180.3500 2 vdd
zoomIn
gui_select -rect {817.025 980.797 -123.482 1093.400}
selectWire 330.1500 330.4500 340.0500 1160.5500 2 gnd
zoomIn
zoomOut
zoomOut
zoomOut
deselectAll
selectWire 310.3500 310.6500 320.2500 1180.3500 2 vdd
zoomSelected
zoomIn
zoomIn
uiSetTool ruler
zoomSelected
zoomSelected
zoomIn
zoomIn
uiSetTool ruler
zoomIn
zoomIn
uiSetTool ruler
uiSetTool ruler
panPage 1 0
panPage 1 0
panPage -1 0
panPage 0 -1
panPage 0 1
getCTSMode -engine -quiet
getCTSMode -engine -quiet
getCTSMode -engine -quiet
getCTSMode -engine -quiet
getCTSMode -engine -quiet
getCTSMode -engine -quiet
getCTSMode -engine -quiet
getCTSMode -engine -quiet
getCTSMode -engine -quiet
getCTSMode -engine -quiet
getCTSMode -engine -quiet
zoomIn
zoomOut
zoomOut
panPage 0 -1
panPage 0 -1
panPage 0 -1
zoomIn
panPage 0 1
panPage 0 1
panPage 1 0
panPage 0 1
panPage 0 1
panPage 0 1
panPage 0 1
panPage 0 1
panPage 0 1
panPage 0 1
panPage 0 1
panPage 0 1
panPage 0 -1
panPage 0 -1
panPage 0 -1
panPage 0 1
panPage 0 1
panPage 0 -1
panPage 0 -1
panPage 0 -1
panPage 0 -1
panPage 0 -1
panPage 0 -1
panPage 0 -1
panPage 0 1
panPage 0 1
panPage 0 1
panPage 0 1
panPage 0 1
panPage 0 1
panPage 0 1
panPage 0 1
panPage -1 0
panPage -1 0
panPage 0 1
panPage 0 1
panPage 0 1
panPage 0 -1
panPage 1 0
panPage 0 -1
panPage 0 -1
panPage 0 -1
panPage 0 -1
panPage 0 1
panPage 0 1
panPage 0 1
panPage 0 1
panPage 0 -1
panPage 0 -1
panPage 0 -1
panPage 0 -1
panPage 0 -1
zoomOut
zoomOut
zoomOut
zoomOut
zoomIn
zoomIn
zoomIn
