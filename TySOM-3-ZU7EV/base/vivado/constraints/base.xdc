####################################################################################################
####################################### TySOM-3 constraints ########################################
####################################################################################################

# ETH2 MDIO
set_property  -dict {PACKAGE_PIN J9  IOSTANDARD LVCMOS33} [get_ports ETH2_MDIO_mdc]
set_property  -dict {PACKAGE_PIN L10 IOSTANDARD LVCMOS33} [get_ports ETH2_MDIO_mdio_io]

#  WL1837MOD WLAN_EN#
set_property  -dict {PACKAGE_PIN H7 IOSTANDARD LVCMOS33} [get_ports {WLAN_EN[0]}]

#  WL1837MOD BT_EN#
set_property  -dict {PACKAGE_PIN G7 IOSTANDARD LVCMOS33} [get_ports {BT_EN[0]}]

set_property  -dict {PACKAGE_PIN E5  IOSTANDARD LVCMOS25} [get_ports BT_HCI_RX]
set_property  -dict {PACKAGE_PIN F6  IOSTANDARD LVCMOS25} [get_ports BT_HCI_TX]
set_property  -dict {PACKAGE_PIN F5  IOSTANDARD LVCMOS25} [get_ports BT_HCI_CTS]
set_property  -dict {PACKAGE_PIN F4 IOSTANDARD LVCMOS25} [get_ports BT_HCI_RTS]

# LEDS
set_property  -dict {PACKAGE_PIN A12 IOSTANDARD LVCMOS18} [get_ports {led_4bits_tri_io[0]}]
set_property  -dict {PACKAGE_PIN A11 IOSTANDARD LVCMOS18} [get_ports {led_4bits_tri_io[1]}]
set_property  -dict {PACKAGE_PIN A9  IOSTANDARD LVCMOS18} [get_ports {led_4bits_tri_io[2]}]
set_property  -dict {PACKAGE_PIN A10 IOSTANDARD LVCMOS18} [get_ports {led_4bits_tri_io[3]}]

# SWITCHES
set_property  -dict {PACKAGE_PIN A2  IOSTANDARD LVCMOS25} [get_ports {dip_switch_4bits_tri_io[0]}]
set_property  -dict {PACKAGE_PIN A5  IOSTANDARD LVCMOS25} [get_ports {dip_switch_4bits_tri_io[1]}]
set_property  -dict {PACKAGE_PIN B5  IOSTANDARD LVCMOS25} [get_ports {dip_switch_4bits_tri_io[2]}]
set_property  -dict {PACKAGE_PIN A3  IOSTANDARD LVCMOS25} [get_ports {dip_switch_4bits_tri_io[3]}]

# PUSHBUTTON
set_property  -dict {PACKAGE_PIN J7  IOSTANDARD LVCMOS33} [get_ports reset]

# PMOD 
set_property  -dict {PACKAGE_PIN K8 IOSTANDARD LVCMOS33} [get_ports {pmod0[0]}]
set_property  -dict {PACKAGE_PIN M8 IOSTANDARD LVCMOS33} [get_ports {pmod0[1]}]
set_property  -dict {PACKAGE_PIN L8 IOSTANDARD LVCMOS33} [get_ports {pmod0[2]}]
set_property  -dict {PACKAGE_PIN K9 IOSTANDARD LVCMOS33} [get_ports {pmod0[3]}]
set_property  -dict {PACKAGE_PIN H8 IOSTANDARD LVCMOS33} [get_ports {pmod0[4]}]
set_property  -dict {PACKAGE_PIN G8 IOSTANDARD LVCMOS33} [get_ports {pmod0[5]}]
set_property  -dict {PACKAGE_PIN G6 IOSTANDARD LVCMOS33} [get_ports {pmod0[6]}]
set_property  -dict {PACKAGE_PIN H6 IOSTANDARD LVCMOS33} [get_ports {pmod0[7]}]

# I2C PL
set_property  -dict {PACKAGE_PIN N8 IOSTANDARD LVCMOS33 PULLTYPE PULLUP} [get_ports fmch_iic_scl_io]
set_property  -dict {PACKAGE_PIN N9 IOSTANDARD LVCMOS33 PULLTYPE PULLUP} [get_ports fmch_iic_sda_io]

# HDMI out
set_property  -dict {PACKAGE_PIN A6  IOSTANDARD LVDS} [get_ports {HDMI_TX_CLK_N_OUT}]
set_property  -dict {PACKAGE_PIN B6  IOSTANDARD LVDS} [get_ports {HDMI_TX_CLK_P_OUT}]

set_property  -dict {PACKAGE_PIN B11  IOSTANDARD LVCMOS18} [get_ports {TX_HPD_IN}]
set_property  -dict {PACKAGE_PIN C12  IOSTANDARD LVCMOS18 PULLTYPE PULLUP} [get_ports {HDMI_TX_I2C_scl_io}]
set_property  -dict {PACKAGE_PIN C11  IOSTANDARD LVCMOS18 PULLTYPE PULLUP} [get_ports {HDMI_TX_I2C_sda_io}]

set_property  -dict {PACKAGE_PIN C7  IOSTANDARD LVCMOS18 PULLTYPE PULLUP} [get_ports {TX_DDC_OUT_scl_io}]
set_property  -dict {PACKAGE_PIN B10  IOSTANDARD LVCMOS18 PULLTYPE PULLUP} [get_ports {TX_DDC_OUT_sda_io}]

#set_property  PACKAGE_PIN M3 [get_ports {DP_TXN[0]}]
#set_property  PACKAGE_PIN M4 [get_ports {DP_TXP[0]}]

#set_property  PACKAGE_PIN L5 [get_ports {DP_TXN[1]}]
#set_property  PACKAGE_PIN L6 [get_ports {DP_TXP[1]}]

#set_property  PACKAGE_PIN K3 [get_ports {DP_TXN[2]}]
#set_property  PACKAGE_PIN K4 [get_ports {DP_TXP[2]}]

set_property  PACKAGE_PIN T7 [get_ports {TX_REFCLK_N_IN}]
set_property  PACKAGE_PIN T8 [get_ports {TX_REFCLK_P_IN}]

create_clock -name hdmi_tx_clk -period 3.367 [get_ports TX_REFCLK_P_IN]

# HDMI in
set_property PACKAGE_PIN U10 [get_ports DRU_CLK_IN_clk_p]
create_clock -name hdmi_dru_clk -period 6.4 [get_ports DRU_CLK_IN_clk_p]

set_property PACKAGE_PIN R10 [get_ports HDMI_RX_CLK_P_IN];
create_clock -name hdmi_rx_clk -period 3.367 [get_ports HDMI_RX_CLK_P_IN]

#set_property PACKAGE_PIN N2 [get_ports {HDMI_RX_DATA_P[0]}];
#set_property PACKAGE_PIN L2 [get_ports {HDMI_RX_DATA_P[1]}];
#set_property PACKAGE_PIN J2 [get_ports {HDMI_RX_DATA_P[2]}];

set_property -dict {PACKAGE_PIN C9 IOSTANDARD LVCMOS18 PULLTYPE PULLUP} [get_ports RX_DDC_OUT_scl_io]
set_property -dict {PACKAGE_PIN B8 IOSTANDARD LVCMOS18 PULLTYPE PULLUP} [get_ports RX_DDC_OUT_sda_io]