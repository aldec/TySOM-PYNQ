####################################################################################################
###################################### TySOM-3A constraints ########################################
####################################################################################################

#  WL1837MOD WLAN_EN#
set_property -dict {PACKAGE_PIN AD14 IOSTANDARD LVCMOS33} [get_ports {WLAN_EN[0]}]

#  WL1837MOD BT_EN#
set_property -dict {PACKAGE_PIN AD12 IOSTANDARD LVCMOS33} [get_ports {BT_EN[0]}]

set_property -dict {PACKAGE_PIN AE14 IOSTANDARD LVCMOS33} [get_ports BT_HCI_RX]
set_property -dict {PACKAGE_PIN AF12 IOSTANDARD LVCMOS33} [get_ports BT_HCI_TX]
set_property -dict {PACKAGE_PIN AE13 IOSTANDARD LVCMOS33} [get_ports BT_HCI_CTS]
set_property -dict {PACKAGE_PIN AE12 IOSTANDARD LVCMOS33} [get_ports BT_HCI_RTS]

#  ETH1 MDIO
set_property -dict {PACKAGE_PIN K23 IOSTANDARD LVCMOS18} [get_ports ETH1_MDIO_mdc]
set_property -dict {PACKAGE_PIN K22 IOSTANDARD LVCMOS18} [get_ports ETH1_MDIO_mdio_io]

#  ETH1 Reset
set_property -dict {PACKAGE_PIN A22 IOSTANDARD LVCMOS18} [get_ports {ETH1_RESET_n[0]}]

#  ETH1
set_property -dict {PACKAGE_PIN M23 IOSTANDARD LVCMOS18} [get_ports {ETH1_RGMII_rd[0]}]
set_property -dict {PACKAGE_PIN P21 IOSTANDARD LVCMOS18} [get_ports {ETH1_RGMII_rd[1]}]
set_property -dict {PACKAGE_PIN N23 IOSTANDARD LVCMOS18} [get_ports {ETH1_RGMII_rd[2]}]
set_property -dict {PACKAGE_PIN M21 IOSTANDARD LVCMOS18} [get_ports {ETH1_RGMII_rd[3]}]

set_property -dict {PACKAGE_PIN L22 IOSTANDARD LVCMOS18} [get_ports ETH1_RGMII_rx_ctl]
set_property -dict {PACKAGE_PIN J21 IOSTANDARD LVCMOS18} [get_ports ETH1_RGMII_rxc]

set_property -dict {PACKAGE_PIN N24 IOSTANDARD LVCMOS18} [get_ports {ETH1_RGMII_td[0]}]
set_property -dict {PACKAGE_PIN P24 IOSTANDARD LVCMOS18} [get_ports {ETH1_RGMII_td[1]}]
set_property -dict {PACKAGE_PIN M20 IOSTANDARD LVCMOS18} [get_ports {ETH1_RGMII_td[2]}]
set_property -dict {PACKAGE_PIN P20 IOSTANDARD LVCMOS18} [get_ports {ETH1_RGMII_td[3]}]
set_property UNAVAILABLE_DURING_CALIBRATION true [get_ports {ETH1_RGMII_td[3]}]

set_property -dict {PACKAGE_PIN L23 IOSTANDARD LVCMOS18} [get_ports ETH1_RGMII_tx_ctl]
set_property -dict {PACKAGE_PIN H21 IOSTANDARD LVCMOS18} [get_ports ETH1_RGMII_txc]

# ETH1 Clock Period Constraints
create_clock -period 8.000 -name rgmii_rxc -add [get_ports ETH1_RGMII_rxc]

# UART PL
#set_property  -dict {PACKAGE_PIN AC12 IOSTANDARD LVCMOS33} [get_ports UART_rxd]
#set_property  -dict {PACKAGE_PIN AC13 IOSTANDARD LVCMOS33} [get_ports UART_txd]

# LEDs
set_property -dict {PACKAGE_PIN AA12 IOSTANDARD LVCMOS25} [get_ports {led_4bits_tri_io[0]}]
set_property -dict {PACKAGE_PIN Y13  IOSTANDARD LVCMOS25} [get_ports {led_4bits_tri_io[1]}]
set_property -dict {PACKAGE_PIN AV11 IOSTANDARD LVCMOS18} [get_ports {led_4bits_tri_io[2]}]
set_property -dict {PACKAGE_PIN AU11 IOSTANDARD LVCMOS18} [get_ports {led_4bits_tri_io[3]}]

# Switches
set_property -dict {PACKAGE_PIN W14  IOSTANDARD LVCMOS25} [get_ports {dip_switch_4bits_tri_io[0]}]
set_property -dict {PACKAGE_PIN Y14  IOSTANDARD LVCMOS25} [get_ports {dip_switch_4bits_tri_io[1]}]
set_property -dict {PACKAGE_PIN AA13 IOSTANDARD LVCMOS25} [get_ports {dip_switch_4bits_tri_io[2]}]
set_property -dict {PACKAGE_PIN AB12 IOSTANDARD LVCMOS25} [get_ports {dip_switch_4bits_tri_io[3]}]

# PushButton
set_property -dict {PACKAGE_PIN AB14 IOSTANDARD LVCMOS25} [get_ports reset]

# PMOD1
set_property -dict {PACKAGE_PIN L12 IOSTANDARD LVCMOS33} [get_ports {pmod0[0]}]
set_property -dict {PACKAGE_PIN M13 IOSTANDARD LVCMOS33} [get_ports {pmod0[1]}]
set_property -dict {PACKAGE_PIN L13 IOSTANDARD LVCMOS33} [get_ports {pmod0[2]}]
set_property -dict {PACKAGE_PIN M12 IOSTANDARD LVCMOS33} [get_ports {pmod0[3]}]
set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports {pmod0[4]}]
set_property -dict {PACKAGE_PIN N13 IOSTANDARD LVCMOS33} [get_ports {pmod0[5]}]
set_property -dict {PACKAGE_PIN K12 IOSTANDARD LVCMOS33} [get_ports {pmod0[6]}]
set_property -dict {PACKAGE_PIN N12 IOSTANDARD LVCMOS33} [get_ports {pmod0[7]}]

# PMOD2
#set_property -dict {PACKAGE_PIN J14 IOSTANDARD LVCMOS33} [get_ports {PMOD2_tri_io[0]}]
#set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports {PMOD2_tri_io[1]}]
#set_property -dict {PACKAGE_PIN H14 IOSTANDARD LVCMOS33} [get_ports {PMOD2_tri_io[2]}]
#set_property -dict {PACKAGE_PIN G14 IOSTANDARD LVCMOS33} [get_ports {PMOD2_tri_io[3]}]
#set_property -dict {PACKAGE_PIN H13 IOSTANDARD LVCMOS33} [get_ports {PMOD2_tri_io[4]}]
#set_property -dict {PACKAGE_PIN G13 IOSTANDARD LVCMOS33} [get_ports {PMOD2_tri_io[5]}]
#set_property -dict {PACKAGE_PIN K13 IOSTANDARD LVCMOS33} [get_ports {PMOD2_tri_io[6]}]
#set_property -dict {PACKAGE_PIN K14 IOSTANDARD LVCMOS33} [get_ports {PMOD2_tri_io[7]}]

# micro SD card
#set_property  -dict {PACKAGE_PIN AV18  IOSTANDARD LVCMOS18} [get_ports {SD_CD}]
#set_property  -dict {PACKAGE_PIN AN19  IOSTANDARD LVCMOS18} [get_ports {SD_CLK}]
#set_property  -dict {PACKAGE_PIN AN17  IOSTANDARD LVCMOS18} [get_ports {SD_CMD[0]}]
#set_property  -dict {PACKAGE_PIN AN18  IOSTANDARD LVCMOS18} [get_ports {SD_DATA[0]}]
#set_property  -dict {PACKAGE_PIN AM19  IOSTANDARD LVCMOS18} [get_ports {SD_DATA[1]}]
#set_property  -dict {PACKAGE_PIN AN16  IOSTANDARD LVCMOS18} [get_ports {SD_DATA[2]}]
#set_property  -dict {PACKAGE_PIN AM18  IOSTANDARD LVCMOS18} [get_ports {SD_DATA[3]}]

# PCIE x1 (PCIE Root)
#set_property -dict {PACKAGE_PIN AE9} [get_ports PCIE_REF100CLK_clk_n]
#set_property -dict {PACKAGE_PIN AE10} [get_ports PCIE_REF100CLK_clk_p]

#set_property -dict {PACKAGE_PIN AE1} [get_ports PCIE_rxn[0]]
#set_property -dict {PACKAGE_PIN AE2} [get_ports PCIE_rxp[0]]
#set_property -dict {PACKAGE_PIN AE5} [get_ports PCIE_txn[0]]
#set_property -dict {PACKAGE_PIN AE6} [get_ports PCIE_txp[0]]

#set_property -dict {PACKAGE_PIN AH13 IOSTANDARD LVCMOS33} [get_ports {PCIE_PERST_n[0]}]

# HDMI out
#set_property  -dict {PACKAGE_PIN L17  IOSTANDARD LVDS} [get_ports {HDMI_TX_CLK_N_OUT}]
set_property -dict {PACKAGE_PIN M18 IOSTANDARD LVDS} [get_ports HDMI_TX_CLK_P_OUT]

set_property -dict {PACKAGE_PIN AC14 IOSTANDARD LVCMOS33} [get_ports TX_HPD_IN]

set_property -dict {PACKAGE_PIN N14 IOSTANDARD LVCMOS33 PULLUP true} [get_ports HDMI_TX_I2C_scl_io]
set_property -dict {PACKAGE_PIN P16 IOSTANDARD LVCMOS33 PULLUP true} [get_ports HDMI_TX_I2C_sda_io]

set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS33 PULLUP true} [get_ports TX_DDC_OUT_scl_io]
set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33 PULLUP true} [get_ports TX_DDC_OUT_sda_io]

#set_property  PACKAGE_PIN AH7 [get_ports {HDMI_TXN[0]}]
#set_property  PACKAGE_PIN AH8 [get_ports {HDMI_TXP[0]}]

#set_property  PACKAGE_PIN AG5 [get_ports {HDMI_TXN[1]}]
#set_property  PACKAGE_PIN AG6 [get_ports {HDMI_TXP[1]}]

#set_property  PACKAGE_PIN AF7 [get_ports {HDMI_TXN[2]}]
#set_property  PACKAGE_PIN AF8 [get_ports {HDMI_TXP[2]}]

set_property PACKAGE_PIN AC9 [get_ports {HDMI_TX_REFCLK_clk_n[0]}]
set_property PACKAGE_PIN AC10 [get_ports {HDMI_TX_REFCLK_clk_p[0]}]

# HDMI in
set_property PACKAGE_PIN AA10 [get_ports {DRU_CLK_IN_clk_p[0]}]
set_property PACKAGE_PIN AG10 [get_ports HDMI_RX_CLK_P_IN]

#set_property PACKAGE_PIN AH4 [get_ports {HDMI_RX_DATA_P[0]}];
#set_property PACKAGE_PIN AG2 [get_ports {HDMI_RX_DATA_P[1]}];
#set_property PACKAGE_PIN AF4 [get_ports {HDMI_RX_DATA_P[2]}];

set_property -dict {PACKAGE_PIN L15 IOSTANDARD LVCMOS33 PULLUP true} [get_ports RX_DDC_OUT_scl_io]
set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33 PULLUP true} [get_ports RX_DDC_OUT_sda_io]

# I2C
set_property -dict {PACKAGE_PIN G34 IOSTANDARD LVCMOS12 PULLUP true DRIVE 8} [get_ports fmch_iic_scl_io]
set_property -dict {PACKAGE_PIN C38 IOSTANDARD LVCMOS12 PULLUP true DRIVE 8} [get_ports fmch_iic_sda_io]

################
# Clock Groups #
################

# There is no defined phase relationship, hence they are treated as asynchronous
set_clock_groups -asynchronous -group [get_clocks -of [get_pins */clk_wiz_0/inst/mmcme4_adv_inst/CLKOUT0]] \
                               -group [get_clocks "mdio1_mdc_clock"]
                               
create_clock -name hdmi_clk -period 3.367 [get_ports HDMI_TX_REFCLK_clk_p[0]]