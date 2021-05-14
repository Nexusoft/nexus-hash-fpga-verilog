set_property BITSTREAM.CONFIG.CONFIGRATE 127.5 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

set_property -dict {IOSTANDARD LVDS PACKAGE_PIN BC27} [get_ports SYSCLK0_200_N]
set_property -dict {IOSTANDARD LVDS PACKAGE_PIN BC26} [get_ports SYSCLK0_200_P]

set_property -dict {PACKAGE_PIN BA36 IOSTANDARD LVCMOS18} [get_ports UART_TXD_IN]
set_property -dict {PACKAGE_PIN AY36 IOSTANDARD LVCMOS18} [get_ports UART_RXD_OUT]

