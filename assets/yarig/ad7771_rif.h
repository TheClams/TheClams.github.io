// Register definition for P_AD7771_RIF
#ifndef __AD7771_RIF_H__
#define __AD7771_RIF_H__

#include <stdint.h>

/// Power down VCM buffer (active low)
typedef enum ad7771_power_mode_t {
    AD7771_LOW_PWR = 0, //!< Low power (1/4)
    AD7771_HIGH_RES = 1 //!< High resolution
} ad7771_power_mode_t;

/// Soft reset
typedef enum ad7771_soft_reset_t {
    AD7771_NONE = 0, //!< No effect
    AD7771_SECOND = 2, //!< 2nd write
    AD7771_FIRST = 3 //!< 1st write
} ad7771_soft_reset_t;

/// Power down VCM buffer (active low)
typedef enum ad7771_filter_mode_t {
    AD7771_SINC3 = 0, //!< 3-tap Sinc
    AD7771_SINC5 = 1 //!< 5-tap Sinc
} ad7771_filter_mode_t;

/// Configure drive strength for SDO
typedef enum ad7771_drive_str_t {
    AD7771_NOMINAL = 0, //!< Nominal
    AD7771_STRONG = 1, //!< Strong
    AD7771_WEAK = 2, //!< Weak
    AD7771_EXTRA_STRONG = 3 //!< Extra Strong
} ad7771_drive_str_t;

/// Disable deglitching of CONVST_SAR pin
typedef enum ad7771_deglitch_t {
    AD7771_DEGLITCH_1P5 = 2, //!< Deglitch 1.5 MCLK
    AD7771_DISABLE = 3 //!< No deglitch circuit
} ad7771_deglitch_t;

/// Data out format
typedef enum ad7771_data_format_t {
    AD7771_QUAD = 0, //!< 4 DOUT lines
    AD7771_DOUBLE = 1, //!< 2 DOUT lines
    AD7771_SINGLE = 2 //!< 1 DOUT lines
} ad7771_data_format_t;

/// Header format
typedef enum ad7771_header_format_t {
    AD7771_STATUS = 0, //!< Status header
    AD7771_CRC = 1 //!< CRC header
} ad7771_header_format_t;

/// SD ADC reference mux
typedef enum ad7771_ref_mux_t {
    AD7771_EXT_PM = 0, //!< External reference REFx+/REFx−
    AD7771_INTERNAL = 1, //!< Internal reference
    AD7771_EXT_SUP = 2, //!< External supply AVDD1x/AVSSx
    AD7771_EXT_MP = 3 //!< External reference REFx-/REFx+
} ad7771_ref_mux_t;

/// SD ADC Meter mux
typedef enum ad7771_mtr_mux_t {
    AD7771_FIXED_280 = 0, //!< 280mV
    AD7771_EXT_PM = 1, //!< External reference REFx+/REFx−
    AD7771_EXT_MP = 2, //!< External reference REFx-/REFx+
    AD7771_EXT_MM = 3, //!< External reference REFx-/REFx-
    AD7771_INT_PM = 4, //!< Internal reference +/-
    AD7771_INT_MP = 5, //!< Internal reference -/+
    AD7771_INT_MM = 6, //!< Internal reference -/-
    AD7771_EXT_PP = 7 //!< External reference REFx+/REFx+
} ad7771_mtr_mux_t;

/// SD ADC reference mux
typedef enum ad7771_glob_mux_t {
    AD7771_AUXAIN = 0, //!< AUXAIN+/AUXAIN−.
    AD7771_DVBE = 1, //!< DVBE/AVSSx.
    AD7771_REF1_PM = 2, //!< REF1+/REF1−.
    AD7771_REF2_PM = 3, //!< REF2+/REF2−.
    AD7771_REF_OUT = 4, //!< REF_OUT/AVSSx.
    AD7771_VCM = 5, //!< VCM/AVSSx.
    AD7771_AREG1CAP = 6, //!< AREG1CAP/AVSSx.
    AD7771_AREG2CAP = 7, //!< AREG2CAP/AVSSx.
    AD7771_DREGCAP = 8, //!< DREGCAP/DGND.
    AD7771_AVDD1A = 9, //!< AVDD1A/AVSSx.
    AD7771_AVDD1B = 10, //!< AVDD1B/AVSSx.
    AD7771_AVDD2A = 11, //!< AVDD2A/AVSSx.
    AD7771_AVDD2B = 12, //!< AVDD2B/AVSSx.
    AD7771_IOVDD = 13, //!< IOVDD/DGND.
    AD7771_AVDD4 = 14, //!< AVDD4/AVSSx.
    AD7771_DGND_A = 15, //!< DGND/AVSS1A.
    AD7771_DGND_B = 16, //!< DGND/AVSS1B.
    AD7771_DGND_X = 17, //!< DGND/AVSSx.
    AD7771_AVDD4_X = 18, //!< AVDD4/AVSSx.
    AD7771_REF1_PX = 19, //!< REF1+/AVSSx.
    AD7771_REF2_PX = 20, //!< REF2+/AVSSx.
    AD7771_AVDD4_ATT = 21 //!< AVDD4/AVSSx. Attenuated.
} ad7771_glob_mux_t;

/// Ad7771 Channel Cfg register bitfields
/// Channel  configuration
typedef union ad7771_channel_cfg_reg {
  uint8_t reg8; //!< Direct access to the full channel_cfg register
  struct {
    uint8_t bias    :  4; //!< 0x0000000F Hidden tuning register
    uint8_t rx      :  1; //!< 0x00000010 Channel meter Mux RX mode
    uint8_t ref_mon :  1; //!< 0x00000020 Channel used as reference monitor
    uint8_t gain    :  2; //!< 0x000000C0 AFE Gain (power of 2)
  } fields; //!< Access to bitfields
} ad7771_channel_cfg_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_CHANNEL_CFG_BIAS_POS   0
#define AD7771_CHANNEL_CFG_BIAS_MASK  0x0000000F
#define AD7771_CHANNEL_CFG_BIAS_SMASK (AD7771_CHANNEL_CFG_BIAS_MASK<<AD7771_CHANNEL_CFG_BIAS_POS)
#define AD7771_CHANNEL_CFG_RX_POS   4
#define AD7771_CHANNEL_CFG_RX_MASK  0x00000001
#define AD7771_CHANNEL_CFG_RX_SMASK (AD7771_CHANNEL_CFG_RX_MASK<<AD7771_CHANNEL_CFG_RX_POS)
#define AD7771_CHANNEL_CFG_REFMON_POS   5
#define AD7771_CHANNEL_CFG_REFMON_MASK  0x00000001
#define AD7771_CHANNEL_CFG_REFMON_SMASK (AD7771_CHANNEL_CFG_REFMON_MASK<<AD7771_CHANNEL_CFG_REFMON_POS)
#define AD7771_CHANNEL_CFG_GAIN_POS   6
#define AD7771_CHANNEL_CFG_GAIN_MASK  0x00000003
#define AD7771_CHANNEL_CFG_GAIN_SMASK (AD7771_CHANNEL_CFG_GAIN_MASK<<AD7771_CHANNEL_CFG_GAIN_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Clock Disable register bitfields
/// Clock disable per channel
typedef union ad7771_clock_disable_reg {
  uint8_t reg8; //!< Direct access to the full clock_disable register
  struct {
    uint8_t disable_ch0 :  1; //!< 0x00000001 Channel 0 Disable
    uint8_t disable_ch1 :  1; //!< 0x00000002 Channel 1 Disable
    uint8_t disable_ch2 :  1; //!< 0x00000004 Channel 2 Disable
    uint8_t disable_ch3 :  1; //!< 0x00000008 Channel 3 Disable
    uint8_t disable_ch4 :  1; //!< 0x00000010 Channel 4 Disable
    uint8_t disable_ch5 :  1; //!< 0x00000020 Channel 5 Disable
    uint8_t disable_ch6 :  1; //!< 0x00000040 Channel 6 Disable
    uint8_t disable_ch7 :  1; //!< 0x00000080 Channel 7 Disable
  } fields; //!< Access to bitfields
} ad7771_clock_disable_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_CLOCK_DISABLE_DISABLECH0_POS   0
#define AD7771_CLOCK_DISABLE_DISABLECH0_MASK  0x00000001
#define AD7771_CLOCK_DISABLE_DISABLECH0_SMASK (AD7771_CLOCK_DISABLE_DISABLECH0_MASK<<AD7771_CLOCK_DISABLE_DISABLECH0_POS)
#define AD7771_CLOCK_DISABLE_DISABLECH1_POS   1
#define AD7771_CLOCK_DISABLE_DISABLECH1_MASK  0x00000001
#define AD7771_CLOCK_DISABLE_DISABLECH1_SMASK (AD7771_CLOCK_DISABLE_DISABLECH1_MASK<<AD7771_CLOCK_DISABLE_DISABLECH1_POS)
#define AD7771_CLOCK_DISABLE_DISABLECH2_POS   2
#define AD7771_CLOCK_DISABLE_DISABLECH2_MASK  0x00000001
#define AD7771_CLOCK_DISABLE_DISABLECH2_SMASK (AD7771_CLOCK_DISABLE_DISABLECH2_MASK<<AD7771_CLOCK_DISABLE_DISABLECH2_POS)
#define AD7771_CLOCK_DISABLE_DISABLECH3_POS   3
#define AD7771_CLOCK_DISABLE_DISABLECH3_MASK  0x00000001
#define AD7771_CLOCK_DISABLE_DISABLECH3_SMASK (AD7771_CLOCK_DISABLE_DISABLECH3_MASK<<AD7771_CLOCK_DISABLE_DISABLECH3_POS)
#define AD7771_CLOCK_DISABLE_DISABLECH4_POS   4
#define AD7771_CLOCK_DISABLE_DISABLECH4_MASK  0x00000001
#define AD7771_CLOCK_DISABLE_DISABLECH4_SMASK (AD7771_CLOCK_DISABLE_DISABLECH4_MASK<<AD7771_CLOCK_DISABLE_DISABLECH4_POS)
#define AD7771_CLOCK_DISABLE_DISABLECH5_POS   5
#define AD7771_CLOCK_DISABLE_DISABLECH5_MASK  0x00000001
#define AD7771_CLOCK_DISABLE_DISABLECH5_SMASK (AD7771_CLOCK_DISABLE_DISABLECH5_MASK<<AD7771_CLOCK_DISABLE_DISABLECH5_POS)
#define AD7771_CLOCK_DISABLE_DISABLECH6_POS   6
#define AD7771_CLOCK_DISABLE_DISABLECH6_MASK  0x00000001
#define AD7771_CLOCK_DISABLE_DISABLECH6_SMASK (AD7771_CLOCK_DISABLE_DISABLECH6_MASK<<AD7771_CLOCK_DISABLE_DISABLECH6_POS)
#define AD7771_CLOCK_DISABLE_DISABLECH7_POS   7
#define AD7771_CLOCK_DISABLE_DISABLECH7_MASK  0x00000001
#define AD7771_CLOCK_DISABLE_DISABLECH7_SMASK (AD7771_CLOCK_DISABLE_DISABLECH7_MASK<<AD7771_CLOCK_DISABLE_DISABLECH7_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Channel Sync Offset register bitfields
/// Channel  Sync offset
typedef union ad7771_channel_sync_offset_reg {
  uint8_t reg8; //!< Direct access to the full channel_sync_offset register
  struct {
    uint8_t sync_offset :  8; //!< 0x000000FF Sync offset
  } fields; //!< Access to bitfields
} ad7771_channel_sync_offset_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_CHANNEL_SYNC_OFFSET_SYNCOFFSET_POS   0
#define AD7771_CHANNEL_SYNC_OFFSET_SYNCOFFSET_MASK  0x000000FF
#define AD7771_CHANNEL_SYNC_OFFSET_SYNCOFFSET_SMASK (AD7771_CHANNEL_SYNC_OFFSET_SYNCOFFSET_MASK<<AD7771_CHANNEL_SYNC_OFFSET_SYNCOFFSET_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 User Cfg1 register bitfields
/// General user configuration 1 (power-down/reset)
typedef union ad7771_user_cfg1_reg {
  uint8_t reg8; //!< Direct access to the full user_cfg1 register
  struct {
    uint8_t soft_reset      :  2; //!< 0x00000003 Soft reset
    uint8_t pdb_rc_osc      :  1; //!< 0x00000004 Power down internal oscillator (active low)
    uint8_t pdb_sar         :  1; //!< 0x00000008 Power down SAR (active low)
    uint8_t pdb_refout      :  1; //!< 0x00000010 Power down Reference output buffer (active low)
    uint8_t pdb_vcm         :  1; //!< 0x00000020 Power down VCM buffer (active low)
    uint8_t power_mode      :  1; //!< 0x00000040 Power down VCM buffer (active low)
    uint8_t all_ch_dis_mclk :  1; //!< 0x00000080 Keep DCLK even when all channel are disabled
  } fields; //!< Access to bitfields
} ad7771_user_cfg1_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_USER_CFG1_SOFTRESET_POS   0
#define AD7771_USER_CFG1_SOFTRESET_MASK  0x00000003
#define AD7771_USER_CFG1_SOFTRESET_SMASK (AD7771_USER_CFG1_SOFTRESET_MASK<<AD7771_USER_CFG1_SOFTRESET_POS)
#define AD7771_USER_CFG1_PDBRCOSC_POS   2
#define AD7771_USER_CFG1_PDBRCOSC_MASK  0x00000001
#define AD7771_USER_CFG1_PDBRCOSC_SMASK (AD7771_USER_CFG1_PDBRCOSC_MASK<<AD7771_USER_CFG1_PDBRCOSC_POS)
#define AD7771_USER_CFG1_PDBSAR_POS   3
#define AD7771_USER_CFG1_PDBSAR_MASK  0x00000001
#define AD7771_USER_CFG1_PDBSAR_SMASK (AD7771_USER_CFG1_PDBSAR_MASK<<AD7771_USER_CFG1_PDBSAR_POS)
#define AD7771_USER_CFG1_PDBREFOUT_POS   4
#define AD7771_USER_CFG1_PDBREFOUT_MASK  0x00000001
#define AD7771_USER_CFG1_PDBREFOUT_SMASK (AD7771_USER_CFG1_PDBREFOUT_MASK<<AD7771_USER_CFG1_PDBREFOUT_POS)
#define AD7771_USER_CFG1_PDBVCM_POS   5
#define AD7771_USER_CFG1_PDBVCM_MASK  0x00000001
#define AD7771_USER_CFG1_PDBVCM_SMASK (AD7771_USER_CFG1_PDBVCM_MASK<<AD7771_USER_CFG1_PDBVCM_POS)
#define AD7771_USER_CFG1_POWERMODE_POS   6
#define AD7771_USER_CFG1_POWERMODE_MASK  0x00000001
#define AD7771_USER_CFG1_POWERMODE_SMASK (AD7771_USER_CFG1_POWERMODE_MASK<<AD7771_USER_CFG1_POWERMODE_POS)
#define AD7771_USER_CFG1_ALLCHDISMCLK_POS   7
#define AD7771_USER_CFG1_ALLCHDISMCLK_MASK  0x00000001
#define AD7771_USER_CFG1_ALLCHDISMCLK_SMASK (AD7771_USER_CFG1_ALLCHDISMCLK_MASK<<AD7771_USER_CFG1_ALLCHDISMCLK_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 User Cfg2 register bitfields
/// General user configuration 2 (drive/filter)
typedef union ad7771_user_cfg2_reg {
  uint8_t reg8; //!< Direct access to the full user_cfg2 register
  struct {
    uint8_t spi_sync       :  1; //!< 0x00000001 SYNC pulse generated through SPI
    uint8_t dout_drive_str :  2; //!< 0x00000006 Configure drive strength for DOUT
    uint8_t sdo_drive_str  :  2; //!< 0x00000018 Configure drive strength for SDO
    uint8_t sar_diag_en    :  1; //!< 0x00000020 Sets SPI interface to read back SAR result on SDO
    uint8_t filter_mode    :  1; //!< 0x00000040 Power down VCM buffer (active low)
    uint8_t rsvd7          :  1; //!< Reserved
  } fields; //!< Access to bitfields
} ad7771_user_cfg2_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_USER_CFG2_SPISYNC_POS   0
#define AD7771_USER_CFG2_SPISYNC_MASK  0x00000001
#define AD7771_USER_CFG2_SPISYNC_SMASK (AD7771_USER_CFG2_SPISYNC_MASK<<AD7771_USER_CFG2_SPISYNC_POS)
#define AD7771_USER_CFG2_DOUTDRIVESTR_POS   1
#define AD7771_USER_CFG2_DOUTDRIVESTR_MASK  0x00000003
#define AD7771_USER_CFG2_DOUTDRIVESTR_SMASK (AD7771_USER_CFG2_DOUTDRIVESTR_MASK<<AD7771_USER_CFG2_DOUTDRIVESTR_POS)
#define AD7771_USER_CFG2_SDODRIVESTR_POS   3
#define AD7771_USER_CFG2_SDODRIVESTR_MASK  0x00000003
#define AD7771_USER_CFG2_SDODRIVESTR_SMASK (AD7771_USER_CFG2_SDODRIVESTR_MASK<<AD7771_USER_CFG2_SDODRIVESTR_POS)
#define AD7771_USER_CFG2_SARDIAGEN_POS   5
#define AD7771_USER_CFG2_SARDIAGEN_MASK  0x00000001
#define AD7771_USER_CFG2_SARDIAGEN_SMASK (AD7771_USER_CFG2_SARDIAGEN_MASK<<AD7771_USER_CFG2_SARDIAGEN_POS)
#define AD7771_USER_CFG2_FILTERMODE_POS   6
#define AD7771_USER_CFG2_FILTERMODE_MASK  0x00000001
#define AD7771_USER_CFG2_FILTERMODE_SMASK (AD7771_USER_CFG2_FILTERMODE_MASK<<AD7771_USER_CFG2_FILTERMODE_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 User Cfg3 register bitfields
/// General user configuration 3
typedef union ad7771_user_cfg3_reg {
  uint8_t reg8; //!< Direct access to the full user_cfg3 register
  struct {
    uint8_t clk_qual_dis        :  1; //!< 0x00000001 Disable clock qualifier check if user reqyire to use an MCLK < 256 kHz
    uint8_t rsvd1               :  3; //!< Reserved
    uint8_t spi_subordinate     :  1; //!< 0x00000010 Enable SPI subordinate to read-back ADC on SDO
    uint8_t rsvd5               :  1; //!< Reserved
    uint8_t convst_deglitch_dis :  2; //!< 0x000000C0 Disable deglitching of CONVST_SAR pin
  } fields; //!< Access to bitfields
} ad7771_user_cfg3_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_USER_CFG3_CLKQUALDIS_POS   0
#define AD7771_USER_CFG3_CLKQUALDIS_MASK  0x00000001
#define AD7771_USER_CFG3_CLKQUALDIS_SMASK (AD7771_USER_CFG3_CLKQUALDIS_MASK<<AD7771_USER_CFG3_CLKQUALDIS_POS)
#define AD7771_USER_CFG3_SPISUBORDINATE_POS   4
#define AD7771_USER_CFG3_SPISUBORDINATE_MASK  0x00000001
#define AD7771_USER_CFG3_SPISUBORDINATE_SMASK (AD7771_USER_CFG3_SPISUBORDINATE_MASK<<AD7771_USER_CFG3_SPISUBORDINATE_POS)
#define AD7771_USER_CFG3_CONVSTDEGLITCHDIS_POS   6
#define AD7771_USER_CFG3_CONVSTDEGLITCHDIS_MASK  0x00000003
#define AD7771_USER_CFG3_CONVSTDEGLITCHDIS_SMASK (AD7771_USER_CFG3_CONVSTDEGLITCHDIS_MASK<<AD7771_USER_CFG3_CONVSTDEGLITCHDIS_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Data Output register bitfields
/// Data output format
typedef union ad7771_data_output_reg {
  uint8_t reg8; //!< Direct access to the full data_output register
  struct {
    uint8_t rsvd0         :  1; //!< Reserved
    uint8_t dclk_div      :  3; //!< 0x0000000E MCLK divider (power of 2)
    uint8_t rsvd4         :  1; //!< Reserved
    uint8_t header_format :  1; //!< 0x00000020 Header format
    uint8_t data_format   :  2; //!< 0x000000C0 Data out format
  } fields; //!< Access to bitfields
} ad7771_data_output_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_DATA_OUTPUT_DCLKDIV_POS   1
#define AD7771_DATA_OUTPUT_DCLKDIV_MASK  0x00000007
#define AD7771_DATA_OUTPUT_DCLKDIV_SMASK (AD7771_DATA_OUTPUT_DCLKDIV_MASK<<AD7771_DATA_OUTPUT_DCLKDIV_POS)
#define AD7771_DATA_OUTPUT_HEADERFORMAT_POS   5
#define AD7771_DATA_OUTPUT_HEADERFORMAT_MASK  0x00000001
#define AD7771_DATA_OUTPUT_HEADERFORMAT_SMASK (AD7771_DATA_OUTPUT_HEADERFORMAT_MASK<<AD7771_DATA_OUTPUT_HEADERFORMAT_POS)
#define AD7771_DATA_OUTPUT_DATAFORMAT_POS   6
#define AD7771_DATA_OUTPUT_DATAFORMAT_MASK  0x00000003
#define AD7771_DATA_OUTPUT_DATAFORMAT_SMASK (AD7771_DATA_OUTPUT_DATAFORMAT_MASK<<AD7771_DATA_OUTPUT_DATAFORMAT_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Mux Ctrl Ref Mtr register bitfields
/// ADC/Reference muc control
typedef union ad7771_mux_ctrl_ref_mtr_reg {
  uint8_t reg8; //!< Direct access to the full mux_ctrl_ref_mtr register
  struct {
    uint8_t rsvd0 :  2; //!< Reserved
    uint8_t mtr :  4; //!< 0x0000003C SD ADC Meter mux
    uint8_t ref :  2; //!< 0x000000C0 SD ADC reference mux
  } fields; //!< Access to bitfields
} ad7771_mux_ctrl_ref_mtr_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_MUX_CTRL_REF_MTR_MTR_POS   2
#define AD7771_MUX_CTRL_REF_MTR_MTR_MASK  0x0000000F
#define AD7771_MUX_CTRL_REF_MTR_MTR_SMASK (AD7771_MUX_CTRL_REF_MTR_MTR_MASK<<AD7771_MUX_CTRL_REF_MTR_MTR_POS)
#define AD7771_MUX_CTRL_REF_MTR_REF_POS   6
#define AD7771_MUX_CTRL_REF_MTR_REF_MASK  0x00000003
#define AD7771_MUX_CTRL_REF_MTR_REF_SMASK (AD7771_MUX_CTRL_REF_MTR_REF_MASK<<AD7771_MUX_CTRL_REF_MTR_REF_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Mux Ctrl Global register bitfields
/// ADC/Reference muc control
typedef union ad7771_mux_ctrl_global_reg {
  uint8_t reg8; //!< Direct access to the full mux_ctrl_global register
  struct {
    uint8_t rsvd0  :  3; //!< Reserved
    uint8_t global :  5; //!< 0x000000F8 SD ADC reference mux
  } fields; //!< Access to bitfields
} ad7771_mux_ctrl_global_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_MUX_CTRL_GLOBAL_GLOBAL_POS   3
#define AD7771_MUX_CTRL_GLOBAL_GLOBAL_MASK  0x0000001F
#define AD7771_MUX_CTRL_GLOBAL_GLOBAL_SMASK (AD7771_MUX_CTRL_GLOBAL_GLOBAL_MASK<<AD7771_MUX_CTRL_GLOBAL_GLOBAL_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Gpio Cfg register bitfields
/// GPIO configuration register
typedef union ad7771_gpio_cfg_reg {
  uint8_t reg8; //!< Direct access to the full gpio_cfg register
  struct {
    uint8_t op_en :  3; //!< 0x00000007 Input/Output
    uint8_t rsvd3 :  5; //!< Reserved
  } fields; //!< Access to bitfields
} ad7771_gpio_cfg_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_GPIO_CFG_OPEN_POS   0
#define AD7771_GPIO_CFG_OPEN_MASK  0x00000007
#define AD7771_GPIO_CFG_OPEN_SMASK (AD7771_GPIO_CFG_OPEN_MASK<<AD7771_GPIO_CFG_OPEN_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Gpio Data register bitfields
/// GPIO configuration register
typedef union ad7771_gpio_data_reg {
  uint8_t reg8; //!< Direct access to the full gpio_data register
  struct {
    uint8_t write :  3; //!< 0x00000007 Value sent to the GPIO pins
    uint8_t read  :  3; //!< 0x00000038 Data read from the GPIO pins
    uint8_t rsvd6 :  2; //!< Reserved
  } fields; //!< Access to bitfields
} ad7771_gpio_data_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_GPIO_DATA_WRITE_POS   0
#define AD7771_GPIO_DATA_WRITE_MASK  0x00000007
#define AD7771_GPIO_DATA_WRITE_SMASK (AD7771_GPIO_DATA_WRITE_MASK<<AD7771_GPIO_DATA_WRITE_POS)
#define AD7771_GPIO_DATA_READ_POS   3
#define AD7771_GPIO_DATA_READ_MASK  0x00000007
#define AD7771_GPIO_DATA_READ_SMASK (AD7771_GPIO_DATA_READ_MASK<<AD7771_GPIO_DATA_READ_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Buffer Cfg1 register bitfields
/// Buffer configuration 1
typedef union ad7771_buffer_cfg1_reg {
  uint8_t reg8; //!< Direct access to the full buffer_cfg1 register
  struct {
    uint8_t rsvd0          :  3; //!< Reserved
    uint8_t ref_buf_neg_en :  1; //!< 0x00000008 Reference buffer negative enable
    uint8_t ref_buf_pos_en :  1; //!< 0x00000010 Reference buffer positive enable
    uint8_t rsvd5          :  3; //!< Reserved
  } fields; //!< Access to bitfields
} ad7771_buffer_cfg1_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_BUFFER_CFG1_REFBUFNEGEN_POS   3
#define AD7771_BUFFER_CFG1_REFBUFNEGEN_MASK  0x00000001
#define AD7771_BUFFER_CFG1_REFBUFNEGEN_SMASK (AD7771_BUFFER_CFG1_REFBUFNEGEN_MASK<<AD7771_BUFFER_CFG1_REFBUFNEGEN_POS)
#define AD7771_BUFFER_CFG1_REFBUFPOSEN_POS   4
#define AD7771_BUFFER_CFG1_REFBUFPOSEN_MASK  0x00000001
#define AD7771_BUFFER_CFG1_REFBUFPOSEN_SMASK (AD7771_BUFFER_CFG1_REFBUFPOSEN_MASK<<AD7771_BUFFER_CFG1_REFBUFPOSEN_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Buffer Cfg2 register bitfields
/// Buffer configuration (reference)
typedef union ad7771_buffer_cfg2_reg {
  uint8_t reg8; //!< Direct access to the full buffer_cfg2 register
  struct {
    uint8_t pdb_dldo_ovrdrv  :  1; //!< 0x00000001 DREGCAP Overdrive Enable
    uint8_t pdb_aldo2_ovrdrv :  1; //!< 0x00000002 AREG2CAP Overdrive Enable
    uint8_t pdb_aldo1_ovrdrv :  1; //!< 0x00000004 AREG1CAP Overdrive Enable
    uint8_t rsvd3            :  3; //!< Reserved
    uint8_t ref_buf_neg_preq :  1; //!< 0x00000040 Reference Buffer Negative Precharge Enable
    uint8_t ref_buf_pos_preq :  1; //!< 0x00000080 Reference Buffer Positive Precharge Enable
  } fields; //!< Access to bitfields
} ad7771_buffer_cfg2_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_BUFFER_CFG2_PDBDLDOOVRDRV_POS   0
#define AD7771_BUFFER_CFG2_PDBDLDOOVRDRV_MASK  0x00000001
#define AD7771_BUFFER_CFG2_PDBDLDOOVRDRV_SMASK (AD7771_BUFFER_CFG2_PDBDLDOOVRDRV_MASK<<AD7771_BUFFER_CFG2_PDBDLDOOVRDRV_POS)
#define AD7771_BUFFER_CFG2_PDBALDO2OVRDRV_POS   1
#define AD7771_BUFFER_CFG2_PDBALDO2OVRDRV_MASK  0x00000001
#define AD7771_BUFFER_CFG2_PDBALDO2OVRDRV_SMASK (AD7771_BUFFER_CFG2_PDBALDO2OVRDRV_MASK<<AD7771_BUFFER_CFG2_PDBALDO2OVRDRV_POS)
#define AD7771_BUFFER_CFG2_PDBALDO1OVRDRV_POS   2
#define AD7771_BUFFER_CFG2_PDBALDO1OVRDRV_MASK  0x00000001
#define AD7771_BUFFER_CFG2_PDBALDO1OVRDRV_SMASK (AD7771_BUFFER_CFG2_PDBALDO1OVRDRV_MASK<<AD7771_BUFFER_CFG2_PDBALDO1OVRDRV_POS)
#define AD7771_BUFFER_CFG2_REFBUFNEGPREQ_POS   6
#define AD7771_BUFFER_CFG2_REFBUFNEGPREQ_MASK  0x00000001
#define AD7771_BUFFER_CFG2_REFBUFNEGPREQ_SMASK (AD7771_BUFFER_CFG2_REFBUFNEGPREQ_MASK<<AD7771_BUFFER_CFG2_REFBUFNEGPREQ_POS)
#define AD7771_BUFFER_CFG2_REFBUFPOSPREQ_POS   7
#define AD7771_BUFFER_CFG2_REFBUFPOSPREQ_MASK  0x00000001
#define AD7771_BUFFER_CFG2_REFBUFPOSPREQ_SMASK (AD7771_BUFFER_CFG2_REFBUFPOSPREQ_MASK<<AD7771_BUFFER_CFG2_REFBUFPOSPREQ_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Channel Offset Up register bitfields
/// Channel  offset (upper byte)
typedef union ad7771_channel_offset_up_reg {
  uint8_t reg8; //!< Direct access to the full channel_offset_up register
  struct {
    uint8_t offset :  8; //!< 0x000000FF Offset (bit 23:16)
  } fields; //!< Access to bitfields
} ad7771_channel_offset_up_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_CHANNEL_OFFSET_UP_OFFSET_POS   0
#define AD7771_CHANNEL_OFFSET_UP_OFFSET_MASK  0x000000FF
#define AD7771_CHANNEL_OFFSET_UP_OFFSET_SMASK (AD7771_CHANNEL_OFFSET_UP_OFFSET_MASK<<AD7771_CHANNEL_OFFSET_UP_OFFSET_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Channel Offset Mid register bitfields
/// Channel  offset (middle byte)
typedef union ad7771_channel_offset_mid_reg {
  uint8_t reg8; //!< Direct access to the full channel_offset_mid register
  struct {
    uint8_t offset :  8; //!< 0x000000FF Offset (bit 15:8)
  } fields; //!< Access to bitfields
} ad7771_channel_offset_mid_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_CHANNEL_OFFSET_MID_OFFSET_POS   0
#define AD7771_CHANNEL_OFFSET_MID_OFFSET_MASK  0x000000FF
#define AD7771_CHANNEL_OFFSET_MID_OFFSET_SMASK (AD7771_CHANNEL_OFFSET_MID_OFFSET_MASK<<AD7771_CHANNEL_OFFSET_MID_OFFSET_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Channel Offset Low register bitfields
/// Channel  offset (lower byte)
typedef union ad7771_channel_offset_low_reg {
  uint8_t reg8; //!< Direct access to the full channel_offset_low register
  struct {
    uint8_t offset :  8; //!< 0x000000FF Offset (bit 7:0)
  } fields; //!< Access to bitfields
} ad7771_channel_offset_low_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_CHANNEL_OFFSET_LOW_OFFSET_POS   0
#define AD7771_CHANNEL_OFFSET_LOW_OFFSET_MASK  0x000000FF
#define AD7771_CHANNEL_OFFSET_LOW_OFFSET_SMASK (AD7771_CHANNEL_OFFSET_LOW_OFFSET_MASK<<AD7771_CHANNEL_OFFSET_LOW_OFFSET_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Channel Gain Up register bitfields
/// Channel  gain (upper byte)
typedef union ad7771_channel_gain_up_reg {
  uint8_t reg8; //!< Direct access to the full channel_gain_up register
  struct {
    uint8_t gain :  8; //!< 0x000000FF Gain (bit 23:16)
  } fields; //!< Access to bitfields
} ad7771_channel_gain_up_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_CHANNEL_GAIN_UP_GAIN_POS   0
#define AD7771_CHANNEL_GAIN_UP_GAIN_MASK  0x000000FF
#define AD7771_CHANNEL_GAIN_UP_GAIN_SMASK (AD7771_CHANNEL_GAIN_UP_GAIN_MASK<<AD7771_CHANNEL_GAIN_UP_GAIN_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Channel Gain Mid register bitfields
/// Channel  gain (middle byte)
typedef union ad7771_channel_gain_mid_reg {
  uint8_t reg8; //!< Direct access to the full channel_gain_mid register
  struct {
    uint8_t gain :  8; //!< 0x000000FF Gain (bit 15:8)
  } fields; //!< Access to bitfields
} ad7771_channel_gain_mid_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_CHANNEL_GAIN_MID_GAIN_POS   0
#define AD7771_CHANNEL_GAIN_MID_GAIN_MASK  0x000000FF
#define AD7771_CHANNEL_GAIN_MID_GAIN_SMASK (AD7771_CHANNEL_GAIN_MID_GAIN_MASK<<AD7771_CHANNEL_GAIN_MID_GAIN_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Channel Gain Low register bitfields
/// Channel  gain (lower byte)
typedef union ad7771_channel_gain_low_reg {
  uint8_t reg8; //!< Direct access to the full channel_gain_low register
  struct {
    uint8_t gain :  8; //!< 0x000000FF Gain (bit 7:0)
  } fields; //!< Access to bitfields
} ad7771_channel_gain_low_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_CHANNEL_GAIN_LOW_GAIN_POS   0
#define AD7771_CHANNEL_GAIN_LOW_GAIN_MASK  0x000000FF
#define AD7771_CHANNEL_GAIN_LOW_GAIN_SMASK (AD7771_CHANNEL_GAIN_LOW_GAIN_MASK<<AD7771_CHANNEL_GAIN_LOW_GAIN_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Channel Status register bitfields
/// Channel  status
typedef union ad7771_channel_status_reg {
  uint8_t reg8; //!< Direct access to the full channel_status register
  struct {
    uint8_t err_ref_det :  1; //!< 0x00000001 Channel 0 — Reference Detect Error
    uint8_t err_ainp_ov :  1; //!< 0x00000002 Channel 0 — AIN0+ Overvoltage Error
    uint8_t err_ainp_uv :  1; //!< 0x00000004 Channel 0 — AIN0+ Undervoltage Error
    uint8_t err_ainm_ov :  1; //!< 0x00000008 Channel 0 — AIN0− Overvoltage Error
    uint8_t err_ainm_uv :  1; //!< 0x00000010 Channel 0 — AIN0− Undervoltage Error
    uint8_t rsvd5       :  3; //!< Reserved
  } fields; //!< Access to bitfields
} ad7771_channel_status_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_CHANNEL_STATUS_ERRREFDET_POS   0
#define AD7771_CHANNEL_STATUS_ERRREFDET_MASK  0x00000001
#define AD7771_CHANNEL_STATUS_ERRREFDET_SMASK (AD7771_CHANNEL_STATUS_ERRREFDET_MASK<<AD7771_CHANNEL_STATUS_ERRREFDET_POS)
#define AD7771_CHANNEL_STATUS_ERRAINPOV_POS   1
#define AD7771_CHANNEL_STATUS_ERRAINPOV_MASK  0x00000001
#define AD7771_CHANNEL_STATUS_ERRAINPOV_SMASK (AD7771_CHANNEL_STATUS_ERRAINPOV_MASK<<AD7771_CHANNEL_STATUS_ERRAINPOV_POS)
#define AD7771_CHANNEL_STATUS_ERRAINPUV_POS   2
#define AD7771_CHANNEL_STATUS_ERRAINPUV_MASK  0x00000001
#define AD7771_CHANNEL_STATUS_ERRAINPUV_SMASK (AD7771_CHANNEL_STATUS_ERRAINPUV_MASK<<AD7771_CHANNEL_STATUS_ERRAINPUV_POS)
#define AD7771_CHANNEL_STATUS_ERRAINMOV_POS   3
#define AD7771_CHANNEL_STATUS_ERRAINMOV_MASK  0x00000001
#define AD7771_CHANNEL_STATUS_ERRAINMOV_SMASK (AD7771_CHANNEL_STATUS_ERRAINMOV_MASK<<AD7771_CHANNEL_STATUS_ERRAINMOV_POS)
#define AD7771_CHANNEL_STATUS_ERRAINMUV_POS   4
#define AD7771_CHANNEL_STATUS_ERRAINMUV_MASK  0x00000001
#define AD7771_CHANNEL_STATUS_ERRAINMUV_SMASK (AD7771_CHANNEL_STATUS_ERRAINMUV_MASK<<AD7771_CHANNEL_STATUS_ERRAINMUV_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Channel Dsp Err register bitfields
/// Channel (2*i)/(2*i+1) DSP errors
typedef union ad7771_channel_dsp_err_reg {
  uint8_t reg8; //!< Direct access to the full channel_dsp_err register
  struct {
    uint8_t err_output_sat0 :  1; //!< 0x00000001 Channel 0 — ADC conversion has exceeded limits and has been clamped
    uint8_t err_filter_sat0 :  1; //!< 0x00000002 Channel 0 — Filter result has exceeded a reasonable level, before offset and gain calibration has been applied
    uint8_t err_mod_sat0    :  1; //!< 0x00000004 Channel 0 — Modulator Output Saturation Error
    uint8_t err_output_sat1 :  1; //!< 0x00000008 Channel 1 — ADC conversion has exceeded limits and has been clamped
    uint8_t err_filter_sat1 :  1; //!< 0x00000010 Channel 1 — Filter result has exceeded a reasonable level, before offset and gain calibration has been applied
    uint8_t err_mod_sat1    :  1; //!< 0x00000020 Channel 1 — Modulator Output Saturation Error
    uint8_t rsvd6           :  2; //!< Reserved
  } fields; //!< Access to bitfields
} ad7771_channel_dsp_err_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_CHANNEL_DSP_ERR_ERROUTPUTSAT0_POS   0
#define AD7771_CHANNEL_DSP_ERR_ERROUTPUTSAT0_MASK  0x00000001
#define AD7771_CHANNEL_DSP_ERR_ERROUTPUTSAT0_SMASK (AD7771_CHANNEL_DSP_ERR_ERROUTPUTSAT0_MASK<<AD7771_CHANNEL_DSP_ERR_ERROUTPUTSAT0_POS)
#define AD7771_CHANNEL_DSP_ERR_ERRFILTERSAT0_POS   1
#define AD7771_CHANNEL_DSP_ERR_ERRFILTERSAT0_MASK  0x00000001
#define AD7771_CHANNEL_DSP_ERR_ERRFILTERSAT0_SMASK (AD7771_CHANNEL_DSP_ERR_ERRFILTERSAT0_MASK<<AD7771_CHANNEL_DSP_ERR_ERRFILTERSAT0_POS)
#define AD7771_CHANNEL_DSP_ERR_ERRMODSAT0_POS   2
#define AD7771_CHANNEL_DSP_ERR_ERRMODSAT0_MASK  0x00000001
#define AD7771_CHANNEL_DSP_ERR_ERRMODSAT0_SMASK (AD7771_CHANNEL_DSP_ERR_ERRMODSAT0_MASK<<AD7771_CHANNEL_DSP_ERR_ERRMODSAT0_POS)
#define AD7771_CHANNEL_DSP_ERR_ERROUTPUTSAT1_POS   3
#define AD7771_CHANNEL_DSP_ERR_ERROUTPUTSAT1_MASK  0x00000001
#define AD7771_CHANNEL_DSP_ERR_ERROUTPUTSAT1_SMASK (AD7771_CHANNEL_DSP_ERR_ERROUTPUTSAT1_MASK<<AD7771_CHANNEL_DSP_ERR_ERROUTPUTSAT1_POS)
#define AD7771_CHANNEL_DSP_ERR_ERRFILTERSAT1_POS   4
#define AD7771_CHANNEL_DSP_ERR_ERRFILTERSAT1_MASK  0x00000001
#define AD7771_CHANNEL_DSP_ERR_ERRFILTERSAT1_SMASK (AD7771_CHANNEL_DSP_ERR_ERRFILTERSAT1_MASK<<AD7771_CHANNEL_DSP_ERR_ERRFILTERSAT1_POS)
#define AD7771_CHANNEL_DSP_ERR_ERRMODSAT1_POS   5
#define AD7771_CHANNEL_DSP_ERR_ERRMODSAT1_MASK  0x00000001
#define AD7771_CHANNEL_DSP_ERR_ERRMODSAT1_SMASK (AD7771_CHANNEL_DSP_ERR_ERRMODSAT1_MASK<<AD7771_CHANNEL_DSP_ERR_ERRMODSAT1_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Channel Test En register bitfields
/// Channel 0 to 7 test enable
typedef union ad7771_channel_test_en_reg {
  uint8_t reg8; //!< Direct access to the full channel_test_en register
  struct {
    uint8_t ref_det_test_en    :  1; //!< 0x00000001 Reference Detect Test Enable
    uint8_t ainp_ov_test_en    :  1; //!< 0x00000002 AINx+ Overvoltage Test Enable
    uint8_t ainp_uv_test_en    :  1; //!< 0x00000004 AINx+ Undervoltage Test Enable
    uint8_t ainm_ov_test_en    :  1; //!< 0x00000008 AINx− Overvoltage Test Enable
    uint8_t ainm_uv_test_en    :  1; //!< 0x00000010 AINx− Undervoltage Test Enable
    uint8_t mod_sat_test_en    :  1; //!< 0x00000020 Enable Error Flag for Modulator Saturation
    uint8_t filter_sat_test_en :  1; //!< 0x00000040 Filter Saturation Test Enable
    uint8_t output_sat_test_en :  1; //!< 0x00000080 ADC Conversion Error Test Enable
  } fields; //!< Access to bitfields
} ad7771_channel_test_en_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_CHANNEL_TEST_EN_REFDETTESTEN_POS   0
#define AD7771_CHANNEL_TEST_EN_REFDETTESTEN_MASK  0x00000001
#define AD7771_CHANNEL_TEST_EN_REFDETTESTEN_SMASK (AD7771_CHANNEL_TEST_EN_REFDETTESTEN_MASK<<AD7771_CHANNEL_TEST_EN_REFDETTESTEN_POS)
#define AD7771_CHANNEL_TEST_EN_AINPOVTESTEN_POS   1
#define AD7771_CHANNEL_TEST_EN_AINPOVTESTEN_MASK  0x00000001
#define AD7771_CHANNEL_TEST_EN_AINPOVTESTEN_SMASK (AD7771_CHANNEL_TEST_EN_AINPOVTESTEN_MASK<<AD7771_CHANNEL_TEST_EN_AINPOVTESTEN_POS)
#define AD7771_CHANNEL_TEST_EN_AINPUVTESTEN_POS   2
#define AD7771_CHANNEL_TEST_EN_AINPUVTESTEN_MASK  0x00000001
#define AD7771_CHANNEL_TEST_EN_AINPUVTESTEN_SMASK (AD7771_CHANNEL_TEST_EN_AINPUVTESTEN_MASK<<AD7771_CHANNEL_TEST_EN_AINPUVTESTEN_POS)
#define AD7771_CHANNEL_TEST_EN_AINMOVTESTEN_POS   3
#define AD7771_CHANNEL_TEST_EN_AINMOVTESTEN_MASK  0x00000001
#define AD7771_CHANNEL_TEST_EN_AINMOVTESTEN_SMASK (AD7771_CHANNEL_TEST_EN_AINMOVTESTEN_MASK<<AD7771_CHANNEL_TEST_EN_AINMOVTESTEN_POS)
#define AD7771_CHANNEL_TEST_EN_AINMUVTESTEN_POS   4
#define AD7771_CHANNEL_TEST_EN_AINMUVTESTEN_MASK  0x00000001
#define AD7771_CHANNEL_TEST_EN_AINMUVTESTEN_SMASK (AD7771_CHANNEL_TEST_EN_AINMUVTESTEN_MASK<<AD7771_CHANNEL_TEST_EN_AINMUVTESTEN_POS)
#define AD7771_CHANNEL_TEST_EN_MODSATTESTEN_POS   5
#define AD7771_CHANNEL_TEST_EN_MODSATTESTEN_MASK  0x00000001
#define AD7771_CHANNEL_TEST_EN_MODSATTESTEN_SMASK (AD7771_CHANNEL_TEST_EN_MODSATTESTEN_MASK<<AD7771_CHANNEL_TEST_EN_MODSATTESTEN_POS)
#define AD7771_CHANNEL_TEST_EN_FILTERSATTESTEN_POS   6
#define AD7771_CHANNEL_TEST_EN_FILTERSATTESTEN_MASK  0x00000001
#define AD7771_CHANNEL_TEST_EN_FILTERSATTESTEN_SMASK (AD7771_CHANNEL_TEST_EN_FILTERSATTESTEN_MASK<<AD7771_CHANNEL_TEST_EN_FILTERSATTESTEN_POS)
#define AD7771_CHANNEL_TEST_EN_OUTPUTSATTESTEN_POS   7
#define AD7771_CHANNEL_TEST_EN_OUTPUTSATTESTEN_MASK  0x00000001
#define AD7771_CHANNEL_TEST_EN_OUTPUTSATTESTEN_SMASK (AD7771_CHANNEL_TEST_EN_OUTPUTSATTESTEN_MASK<<AD7771_CHANNEL_TEST_EN_OUTPUTSATTESTEN_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 General Err1 register bitfields
/// General Error 1
typedef union ad7771_general_err1_reg {
  uint8_t reg8; //!< Direct access to the full general_err1 register
  struct {
    uint8_t spi_crc_err           :  1; //!< 0x00000001 SPI CRC error
    uint8_t spi_invalid_write_err :  1; //!< 0x00000002 SPI invalid write address
    uint8_t spi_invalid_read_err  :  1; //!< 0x00000004 SPI invalid read address
    uint8_t spi_clk_count_err     :  1; //!< 0x00000008 SPI clock counter error
    uint8_t rom_crc_err           :  1; //!< 0x00000010 A CRC of the fuse contents is run periodically to check for errors in the fuses
    uint8_t memmap_crc_err        :  1; //!< 0x00000020 A CRC of the memory map contents is run periodically to check for errors
    uint8_t rsvd6                 :  2; //!< Reserved
  } fields; //!< Access to bitfields
} ad7771_general_err1_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_GENERAL_ERR1_SPICRCERR_POS   0
#define AD7771_GENERAL_ERR1_SPICRCERR_MASK  0x00000001
#define AD7771_GENERAL_ERR1_SPICRCERR_SMASK (AD7771_GENERAL_ERR1_SPICRCERR_MASK<<AD7771_GENERAL_ERR1_SPICRCERR_POS)
#define AD7771_GENERAL_ERR1_SPIINVALIDWRITEERR_POS   1
#define AD7771_GENERAL_ERR1_SPIINVALIDWRITEERR_MASK  0x00000001
#define AD7771_GENERAL_ERR1_SPIINVALIDWRITEERR_SMASK (AD7771_GENERAL_ERR1_SPIINVALIDWRITEERR_MASK<<AD7771_GENERAL_ERR1_SPIINVALIDWRITEERR_POS)
#define AD7771_GENERAL_ERR1_SPIINVALIDREADERR_POS   2
#define AD7771_GENERAL_ERR1_SPIINVALIDREADERR_MASK  0x00000001
#define AD7771_GENERAL_ERR1_SPIINVALIDREADERR_SMASK (AD7771_GENERAL_ERR1_SPIINVALIDREADERR_MASK<<AD7771_GENERAL_ERR1_SPIINVALIDREADERR_POS)
#define AD7771_GENERAL_ERR1_SPICLKCOUNTERR_POS   3
#define AD7771_GENERAL_ERR1_SPICLKCOUNTERR_MASK  0x00000001
#define AD7771_GENERAL_ERR1_SPICLKCOUNTERR_SMASK (AD7771_GENERAL_ERR1_SPICLKCOUNTERR_MASK<<AD7771_GENERAL_ERR1_SPICLKCOUNTERR_POS)
#define AD7771_GENERAL_ERR1_ROMCRCERR_POS   4
#define AD7771_GENERAL_ERR1_ROMCRCERR_MASK  0x00000001
#define AD7771_GENERAL_ERR1_ROMCRCERR_SMASK (AD7771_GENERAL_ERR1_ROMCRCERR_MASK<<AD7771_GENERAL_ERR1_ROMCRCERR_POS)
#define AD7771_GENERAL_ERR1_MEMMAPCRCERR_POS   5
#define AD7771_GENERAL_ERR1_MEMMAPCRCERR_MASK  0x00000001
#define AD7771_GENERAL_ERR1_MEMMAPCRCERR_SMASK (AD7771_GENERAL_ERR1_MEMMAPCRCERR_MASK<<AD7771_GENERAL_ERR1_MEMMAPCRCERR_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 General Err1 En register bitfields
/// General Error 1 Enable
typedef union ad7771_general_err1_en_reg {
  uint8_t reg8; //!< Direct access to the full general_err1_en register
  struct {
    uint8_t spi_crc_err_en           :  1; //!< 0x00000001 Enable SPI CRC error
    uint8_t spi_invalid_write_err_en :  1; //!< 0x00000002 Enable SPI invalid write address
    uint8_t spi_invalid_read_err_en  :  1; //!< 0x00000004 Enable SPI invalid read address
    uint8_t spi_clk_count_err_en     :  1; //!< 0x00000008 Enable SPI clock counter error
    uint8_t rom_crc_err_en           :  1; //!< 0x00000010 Enable a CRC of the fuse contents is run periodically to check for errors in the fuses
    uint8_t memmap_crc_err_en        :  1; //!< 0x00000020 Enable a CRC of the memory map contents is run periodically to check for errors
    uint8_t rsvd6                    :  2; //!< Reserved
  } fields; //!< Access to bitfields
} ad7771_general_err1_en_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_GENERAL_ERR1_EN_SPICRCERREN_POS   0
#define AD7771_GENERAL_ERR1_EN_SPICRCERREN_MASK  0x00000001
#define AD7771_GENERAL_ERR1_EN_SPICRCERREN_SMASK (AD7771_GENERAL_ERR1_EN_SPICRCERREN_MASK<<AD7771_GENERAL_ERR1_EN_SPICRCERREN_POS)
#define AD7771_GENERAL_ERR1_EN_SPIINVALIDWRITEERREN_POS   1
#define AD7771_GENERAL_ERR1_EN_SPIINVALIDWRITEERREN_MASK  0x00000001
#define AD7771_GENERAL_ERR1_EN_SPIINVALIDWRITEERREN_SMASK (AD7771_GENERAL_ERR1_EN_SPIINVALIDWRITEERREN_MASK<<AD7771_GENERAL_ERR1_EN_SPIINVALIDWRITEERREN_POS)
#define AD7771_GENERAL_ERR1_EN_SPIINVALIDREADERREN_POS   2
#define AD7771_GENERAL_ERR1_EN_SPIINVALIDREADERREN_MASK  0x00000001
#define AD7771_GENERAL_ERR1_EN_SPIINVALIDREADERREN_SMASK (AD7771_GENERAL_ERR1_EN_SPIINVALIDREADERREN_MASK<<AD7771_GENERAL_ERR1_EN_SPIINVALIDREADERREN_POS)
#define AD7771_GENERAL_ERR1_EN_SPICLKCOUNTERREN_POS   3
#define AD7771_GENERAL_ERR1_EN_SPICLKCOUNTERREN_MASK  0x00000001
#define AD7771_GENERAL_ERR1_EN_SPICLKCOUNTERREN_SMASK (AD7771_GENERAL_ERR1_EN_SPICLKCOUNTERREN_MASK<<AD7771_GENERAL_ERR1_EN_SPICLKCOUNTERREN_POS)
#define AD7771_GENERAL_ERR1_EN_ROMCRCERREN_POS   4
#define AD7771_GENERAL_ERR1_EN_ROMCRCERREN_MASK  0x00000001
#define AD7771_GENERAL_ERR1_EN_ROMCRCERREN_SMASK (AD7771_GENERAL_ERR1_EN_ROMCRCERREN_MASK<<AD7771_GENERAL_ERR1_EN_ROMCRCERREN_POS)
#define AD7771_GENERAL_ERR1_EN_MEMMAPCRCERREN_POS   5
#define AD7771_GENERAL_ERR1_EN_MEMMAPCRCERREN_MASK  0x00000001
#define AD7771_GENERAL_ERR1_EN_MEMMAPCRCERREN_SMASK (AD7771_GENERAL_ERR1_EN_MEMMAPCRCERREN_MASK<<AD7771_GENERAL_ERR1_EN_MEMMAPCRCERREN_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 General Err2 register bitfields
/// General Error 2
typedef union ad7771_general_err2_reg {
  uint8_t reg8; //!< Direct access to the full general_err2 register
  struct {
    uint8_t dldo_psm_err        :  1; //!< 0x00000001 DREGCAP Power Supply Error
    uint8_t aldo2_psm_err       :  1; //!< 0x00000002 AREG2CAP Power Supply Error
    uint8_t aldo1_psm_err       :  1; //!< 0x00000004 AREG1CAP Power Supply Error
    uint8_t rsvd3               :  1; //!< Reserved
    uint8_t ext_mclk_switch_err :  1; //!< 0x00000010 Clock Not Switched Over
    uint8_t reset_detected      :  1; //!< 0x00000020 Reset Detected
    uint8_t rsvd6               :  2; //!< Reserved
  } fields; //!< Access to bitfields
} ad7771_general_err2_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_GENERAL_ERR2_DLDOPSMERR_POS   0
#define AD7771_GENERAL_ERR2_DLDOPSMERR_MASK  0x00000001
#define AD7771_GENERAL_ERR2_DLDOPSMERR_SMASK (AD7771_GENERAL_ERR2_DLDOPSMERR_MASK<<AD7771_GENERAL_ERR2_DLDOPSMERR_POS)
#define AD7771_GENERAL_ERR2_ALDO2PSMERR_POS   1
#define AD7771_GENERAL_ERR2_ALDO2PSMERR_MASK  0x00000001
#define AD7771_GENERAL_ERR2_ALDO2PSMERR_SMASK (AD7771_GENERAL_ERR2_ALDO2PSMERR_MASK<<AD7771_GENERAL_ERR2_ALDO2PSMERR_POS)
#define AD7771_GENERAL_ERR2_ALDO1PSMERR_POS   2
#define AD7771_GENERAL_ERR2_ALDO1PSMERR_MASK  0x00000001
#define AD7771_GENERAL_ERR2_ALDO1PSMERR_SMASK (AD7771_GENERAL_ERR2_ALDO1PSMERR_MASK<<AD7771_GENERAL_ERR2_ALDO1PSMERR_POS)
#define AD7771_GENERAL_ERR2_EXTMCLKSWITCHERR_POS   4
#define AD7771_GENERAL_ERR2_EXTMCLKSWITCHERR_MASK  0x00000001
#define AD7771_GENERAL_ERR2_EXTMCLKSWITCHERR_SMASK (AD7771_GENERAL_ERR2_EXTMCLKSWITCHERR_MASK<<AD7771_GENERAL_ERR2_EXTMCLKSWITCHERR_POS)
#define AD7771_GENERAL_ERR2_RESETDETECTED_POS   5
#define AD7771_GENERAL_ERR2_RESETDETECTED_MASK  0x00000001
#define AD7771_GENERAL_ERR2_RESETDETECTED_SMASK (AD7771_GENERAL_ERR2_RESETDETECTED_MASK<<AD7771_GENERAL_ERR2_RESETDETECTED_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 General Err2 En register bitfields
/// General Error 2
typedef union ad7771_general_err2_en_reg {
  uint8_t reg8; //!< Direct access to the full general_err2_en register
  struct {
    uint8_t ldo_psm_trip_test :  2; //!< 0x00000003 Run PSM Trip
    uint8_t dldo_psm_err_en   :  1; //!< 0x00000004 Enable digital Power Supply Error
    uint8_t aldo_psm_err_en   :  1; //!< 0x00000008 Enable analog Power Supply Error
    uint8_t rsvd4             :  1; //!< Reserved
    uint8_t reset_detected_en :  1; //!< 0x00000020 Enable Reset Detected
    uint8_t rsvd6             :  2; //!< Reserved
  } fields; //!< Access to bitfields
} ad7771_general_err2_en_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_GENERAL_ERR2_EN_LDOPSMTRIPTEST_POS   0
#define AD7771_GENERAL_ERR2_EN_LDOPSMTRIPTEST_MASK  0x00000003
#define AD7771_GENERAL_ERR2_EN_LDOPSMTRIPTEST_SMASK (AD7771_GENERAL_ERR2_EN_LDOPSMTRIPTEST_MASK<<AD7771_GENERAL_ERR2_EN_LDOPSMTRIPTEST_POS)
#define AD7771_GENERAL_ERR2_EN_DLDOPSMERREN_POS   2
#define AD7771_GENERAL_ERR2_EN_DLDOPSMERREN_MASK  0x00000001
#define AD7771_GENERAL_ERR2_EN_DLDOPSMERREN_SMASK (AD7771_GENERAL_ERR2_EN_DLDOPSMERREN_MASK<<AD7771_GENERAL_ERR2_EN_DLDOPSMERREN_POS)
#define AD7771_GENERAL_ERR2_EN_ALDOPSMERREN_POS   3
#define AD7771_GENERAL_ERR2_EN_ALDOPSMERREN_MASK  0x00000001
#define AD7771_GENERAL_ERR2_EN_ALDOPSMERREN_SMASK (AD7771_GENERAL_ERR2_EN_ALDOPSMERREN_MASK<<AD7771_GENERAL_ERR2_EN_ALDOPSMERREN_POS)
#define AD7771_GENERAL_ERR2_EN_RESETDETECTEDEN_POS   5
#define AD7771_GENERAL_ERR2_EN_RESETDETECTEDEN_MASK  0x00000001
#define AD7771_GENERAL_ERR2_EN_RESETDETECTEDEN_SMASK (AD7771_GENERAL_ERR2_EN_RESETDETECTEDEN_MASK<<AD7771_GENERAL_ERR2_EN_RESETDETECTEDEN_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Error Status1 register bitfields
/// Error Status 1
typedef union ad7771_error_status1_reg {
  uint8_t reg8; //!< Direct access to the full error_status1 register
  struct {
    uint8_t err_loc_ch0 :  1; //!< 0x00000001 Error specific to channel 0
    uint8_t err_loc_ch1 :  1; //!< 0x00000002 Error specific to channel 1
    uint8_t err_loc_ch2 :  1; //!< 0x00000004 Error specific to channel 2
    uint8_t err_loc_ch3 :  1; //!< 0x00000008 Error specific to channel 3
    uint8_t err_loc_ch4 :  1; //!< 0x00000010 Error specific to channel 4
    uint8_t chip_error1 :  1; //!< 0x00000020 High when any error bit is high
    uint8_t rsvd6       :  2; //!< Reserved
  } fields; //!< Access to bitfields
} ad7771_error_status1_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_ERROR_STATUS1_ERRLOCCH0_POS   0
#define AD7771_ERROR_STATUS1_ERRLOCCH0_MASK  0x00000001
#define AD7771_ERROR_STATUS1_ERRLOCCH0_SMASK (AD7771_ERROR_STATUS1_ERRLOCCH0_MASK<<AD7771_ERROR_STATUS1_ERRLOCCH0_POS)
#define AD7771_ERROR_STATUS1_ERRLOCCH1_POS   1
#define AD7771_ERROR_STATUS1_ERRLOCCH1_MASK  0x00000001
#define AD7771_ERROR_STATUS1_ERRLOCCH1_SMASK (AD7771_ERROR_STATUS1_ERRLOCCH1_MASK<<AD7771_ERROR_STATUS1_ERRLOCCH1_POS)
#define AD7771_ERROR_STATUS1_ERRLOCCH2_POS   2
#define AD7771_ERROR_STATUS1_ERRLOCCH2_MASK  0x00000001
#define AD7771_ERROR_STATUS1_ERRLOCCH2_SMASK (AD7771_ERROR_STATUS1_ERRLOCCH2_MASK<<AD7771_ERROR_STATUS1_ERRLOCCH2_POS)
#define AD7771_ERROR_STATUS1_ERRLOCCH3_POS   3
#define AD7771_ERROR_STATUS1_ERRLOCCH3_MASK  0x00000001
#define AD7771_ERROR_STATUS1_ERRLOCCH3_SMASK (AD7771_ERROR_STATUS1_ERRLOCCH3_MASK<<AD7771_ERROR_STATUS1_ERRLOCCH3_POS)
#define AD7771_ERROR_STATUS1_ERRLOCCH4_POS   4
#define AD7771_ERROR_STATUS1_ERRLOCCH4_MASK  0x00000001
#define AD7771_ERROR_STATUS1_ERRLOCCH4_SMASK (AD7771_ERROR_STATUS1_ERRLOCCH4_MASK<<AD7771_ERROR_STATUS1_ERRLOCCH4_POS)
#define AD7771_ERROR_STATUS1_CHIPERROR1_POS   5
#define AD7771_ERROR_STATUS1_CHIPERROR1_MASK  0x00000001
#define AD7771_ERROR_STATUS1_CHIPERROR1_SMASK (AD7771_ERROR_STATUS1_CHIPERROR1_MASK<<AD7771_ERROR_STATUS1_CHIPERROR1_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Error Status2 register bitfields
/// Error Status 2
typedef union ad7771_error_status2_reg {
  uint8_t reg8; //!< Direct access to the full error_status2 register
  struct {
    uint8_t err_loc_ch5  :  1; //!< 0x00000001 Error specific to channel 5
    uint8_t err_loc_ch6  :  1; //!< 0x00000002 Error specific to channel 6
    uint8_t err_loc_ch7  :  1; //!< 0x00000004 Error specific to channel 7
    uint8_t err_loc_gen0 :  1; //!< 0x00000008 Error specific to gen_err[1]
    uint8_t err_loc_gen1 :  1; //!< 0x00000010 Error specific to gen_err[2]
    uint8_t chip_error2  :  1; //!< 0x00000020 High when any error bit is high
    uint8_t rsvd6        :  2; //!< Reserved
  } fields; //!< Access to bitfields
} ad7771_error_status2_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_ERROR_STATUS2_ERRLOCCH5_POS   0
#define AD7771_ERROR_STATUS2_ERRLOCCH5_MASK  0x00000001
#define AD7771_ERROR_STATUS2_ERRLOCCH5_SMASK (AD7771_ERROR_STATUS2_ERRLOCCH5_MASK<<AD7771_ERROR_STATUS2_ERRLOCCH5_POS)
#define AD7771_ERROR_STATUS2_ERRLOCCH6_POS   1
#define AD7771_ERROR_STATUS2_ERRLOCCH6_MASK  0x00000001
#define AD7771_ERROR_STATUS2_ERRLOCCH6_SMASK (AD7771_ERROR_STATUS2_ERRLOCCH6_MASK<<AD7771_ERROR_STATUS2_ERRLOCCH6_POS)
#define AD7771_ERROR_STATUS2_ERRLOCCH7_POS   2
#define AD7771_ERROR_STATUS2_ERRLOCCH7_MASK  0x00000001
#define AD7771_ERROR_STATUS2_ERRLOCCH7_SMASK (AD7771_ERROR_STATUS2_ERRLOCCH7_MASK<<AD7771_ERROR_STATUS2_ERRLOCCH7_POS)
#define AD7771_ERROR_STATUS2_ERRLOCGEN0_POS   3
#define AD7771_ERROR_STATUS2_ERRLOCGEN0_MASK  0x00000001
#define AD7771_ERROR_STATUS2_ERRLOCGEN0_SMASK (AD7771_ERROR_STATUS2_ERRLOCGEN0_MASK<<AD7771_ERROR_STATUS2_ERRLOCGEN0_POS)
#define AD7771_ERROR_STATUS2_ERRLOCGEN1_POS   4
#define AD7771_ERROR_STATUS2_ERRLOCGEN1_MASK  0x00000001
#define AD7771_ERROR_STATUS2_ERRLOCGEN1_SMASK (AD7771_ERROR_STATUS2_ERRLOCGEN1_MASK<<AD7771_ERROR_STATUS2_ERRLOCGEN1_POS)
#define AD7771_ERROR_STATUS2_CHIPERROR2_POS   5
#define AD7771_ERROR_STATUS2_CHIPERROR2_MASK  0x00000001
#define AD7771_ERROR_STATUS2_CHIPERROR2_SMASK (AD7771_ERROR_STATUS2_CHIPERROR2_MASK<<AD7771_ERROR_STATUS2_CHIPERROR2_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Error Status3 register bitfields
/// Error Status 3
typedef union ad7771_error_status3_reg {
  uint8_t reg8; //!< Direct access to the full error_status3 register
  struct {
    uint8_t err_loc_sat_ch0 :  1; //!< 0x00000001 Sat Error specific to channel 0 / 1
    uint8_t err_loc_sat_ch1 :  1; //!< 0x00000002 Sat Error specific to channel 1 / 2
    uint8_t err_loc_sat_ch2 :  1; //!< 0x00000004 Sat Error specific to channel 2 / 3
    uint8_t err_loc_sat_ch3 :  1; //!< 0x00000008 Sat Error specific to channel 3 / 4
    uint8_t init_complete   :  1; //!< 0x00000010 Fuse init complete
    uint8_t chip_error3     :  1; //!< 0x00000020 High when any error bit is high
    uint8_t rsvd6           :  2; //!< Reserved
  } fields; //!< Access to bitfields
} ad7771_error_status3_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_ERROR_STATUS3_ERRLOCSATCH0_POS   0
#define AD7771_ERROR_STATUS3_ERRLOCSATCH0_MASK  0x00000001
#define AD7771_ERROR_STATUS3_ERRLOCSATCH0_SMASK (AD7771_ERROR_STATUS3_ERRLOCSATCH0_MASK<<AD7771_ERROR_STATUS3_ERRLOCSATCH0_POS)
#define AD7771_ERROR_STATUS3_ERRLOCSATCH1_POS   1
#define AD7771_ERROR_STATUS3_ERRLOCSATCH1_MASK  0x00000001
#define AD7771_ERROR_STATUS3_ERRLOCSATCH1_SMASK (AD7771_ERROR_STATUS3_ERRLOCSATCH1_MASK<<AD7771_ERROR_STATUS3_ERRLOCSATCH1_POS)
#define AD7771_ERROR_STATUS3_ERRLOCSATCH2_POS   2
#define AD7771_ERROR_STATUS3_ERRLOCSATCH2_MASK  0x00000001
#define AD7771_ERROR_STATUS3_ERRLOCSATCH2_SMASK (AD7771_ERROR_STATUS3_ERRLOCSATCH2_MASK<<AD7771_ERROR_STATUS3_ERRLOCSATCH2_POS)
#define AD7771_ERROR_STATUS3_ERRLOCSATCH3_POS   3
#define AD7771_ERROR_STATUS3_ERRLOCSATCH3_MASK  0x00000001
#define AD7771_ERROR_STATUS3_ERRLOCSATCH3_SMASK (AD7771_ERROR_STATUS3_ERRLOCSATCH3_MASK<<AD7771_ERROR_STATUS3_ERRLOCSATCH3_POS)
#define AD7771_ERROR_STATUS3_INITCOMPLETE_POS   4
#define AD7771_ERROR_STATUS3_INITCOMPLETE_MASK  0x00000001
#define AD7771_ERROR_STATUS3_INITCOMPLETE_SMASK (AD7771_ERROR_STATUS3_INITCOMPLETE_MASK<<AD7771_ERROR_STATUS3_INITCOMPLETE_POS)
#define AD7771_ERROR_STATUS3_CHIPERROR3_POS   5
#define AD7771_ERROR_STATUS3_CHIPERROR3_MASK  0x00000001
#define AD7771_ERROR_STATUS3_CHIPERROR3_SMASK (AD7771_ERROR_STATUS3_CHIPERROR3_MASK<<AD7771_ERROR_STATUS3_CHIPERROR3_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Src N Msb register bitfields
/// Sample Rate converter N MSB
typedef union ad7771_src_n_msb_reg {
  uint8_t reg8; //!< Direct access to the full src_n_msb register
  struct {
    uint8_t src_n :  4; //!< 0x0000000F Sample Rate converter N[11:8]
    uint8_t rsvd4 :  4; //!< Reserved
  } fields; //!< Access to bitfields
} ad7771_src_n_msb_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_SRC_N_MSB_SRCN_POS   0
#define AD7771_SRC_N_MSB_SRCN_MASK  0x0000000F
#define AD7771_SRC_N_MSB_SRCN_SMASK (AD7771_SRC_N_MSB_SRCN_MASK<<AD7771_SRC_N_MSB_SRCN_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Src N Lsb register bitfields
/// Sample Rate converter N LSB
typedef union ad7771_src_n_lsb_reg {
  uint8_t reg8; //!< Direct access to the full src_n_lsb register
  struct {
    uint8_t src_n :  8; //!< 0x000000FF Sample Rate converter N[7:0]
  } fields; //!< Access to bitfields
} ad7771_src_n_lsb_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_SRC_N_LSB_SRCN_POS   0
#define AD7771_SRC_N_LSB_SRCN_MASK  0x000000FF
#define AD7771_SRC_N_LSB_SRCN_SMASK (AD7771_SRC_N_LSB_SRCN_MASK<<AD7771_SRC_N_LSB_SRCN_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Src If Msb register bitfields
/// Sample Rate converter IF MSB
typedef union ad7771_src_if_msb_reg {
  uint8_t reg8; //!< Direct access to the full src_if_msb register
  struct {
    uint8_t src_if :  8; //!< 0x000000FF Sample Rate converter IF[15:8]
  } fields; //!< Access to bitfields
} ad7771_src_if_msb_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_SRC_IF_MSB_SRCIF_POS   0
#define AD7771_SRC_IF_MSB_SRCIF_MASK  0x000000FF
#define AD7771_SRC_IF_MSB_SRCIF_SMASK (AD7771_SRC_IF_MSB_SRCIF_MASK<<AD7771_SRC_IF_MSB_SRCIF_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Src If Lsb register bitfields
/// Sample Rate converter IF LSB
typedef union ad7771_src_if_lsb_reg {
  uint8_t reg8; //!< Direct access to the full src_if_lsb register
  struct {
    uint8_t src_if :  8; //!< 0x000000FF Sample Rate converter IF[7:0]
  } fields; //!< Access to bitfields
} ad7771_src_if_lsb_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_SRC_IF_LSB_SRCIF_POS   0
#define AD7771_SRC_IF_LSB_SRCIF_MASK  0x000000FF
#define AD7771_SRC_IF_LSB_SRCIF_SMASK (AD7771_SRC_IF_LSB_SRCIF_MASK<<AD7771_SRC_IF_LSB_SRCIF_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 Src Load register bitfields
/// Sample Rate converter load
typedef union ad7771_src_load_reg {
  uint8_t reg8; //!< Direct access to the full src_load register
  struct {
    uint8_t load_update :  1; //!< 0x00000001 Assert to load SRC registers into SRC
    uint8_t rsvd1       :  6; //!< Reserved
    uint8_t load_source :  1; //!< 0x00000080 Select which option to load an SRC update
  } fields; //!< Access to bitfields
} ad7771_src_load_reg_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_SRC_LOAD_LOADUPDATE_POS   0
#define AD7771_SRC_LOAD_LOADUPDATE_MASK  0x00000001
#define AD7771_SRC_LOAD_LOADUPDATE_SMASK (AD7771_SRC_LOAD_LOADUPDATE_MASK<<AD7771_SRC_LOAD_LOADUPDATE_POS)
#define AD7771_SRC_LOAD_LOADSOURCE_POS   7
#define AD7771_SRC_LOAD_LOADSOURCE_MASK  0x00000001
#define AD7771_SRC_LOAD_LOADSOURCE_SMASK (AD7771_SRC_LOAD_LOADSOURCE_MASK<<AD7771_SRC_LOAD_LOADSOURCE_POS)
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

/// Ad7771 module struct
typedef struct ad7771_regs {
  ad7771_channel_cfg_reg_t         channel_cfg[8]     ; //!< 0x0000 (0x00000000 RW): Channel  configuration
  ad7771_clock_disable_reg_t       clock_disable      ; //!< 0x0008 (0x00000000 RW): Clock disable per channel
  ad7771_channel_sync_offset_reg_t channel_sync_offset[8]; //!< 0x0009 (0x00000000 RW): Channel  Sync offset
  ad7771_user_cfg1_reg_t           user_cfg1          ; //!< 0x0011 (0x00000024 RW): General user configuration 1 (power-down/reset)
  ad7771_user_cfg2_reg_t           user_cfg2          ; //!< 0x0012 (0x00000008 RW): General user configuration 2 (drive/filter)
  ad7771_user_cfg3_reg_t           user_cfg3          ; //!< 0x0013 (0x00000080 RW): General user configuration 3
  ad7771_data_output_reg_t         data_output        ; //!< 0x0014 (0x00000000 RW): Data output format
  ad7771_mux_ctrl_ref_mtr_reg_t    mux_ctrl_ref_mtr   ; //!< 0x0015 (0x00000000 RW): ADC/Reference muc control
  ad7771_mux_ctrl_global_reg_t     mux_ctrl_global    ; //!< 0x0016 (0x00000000 RW): ADC/Reference muc control
  ad7771_gpio_cfg_reg_t            gpio_cfg           ; //!< 0x0017 (0x00000000 RW): GPIO configuration register
  ad7771_gpio_data_reg_t           gpio_data          ; //!< 0x0018 (0x00000000 RW): GPIO configuration register
  ad7771_buffer_cfg1_reg_t         buffer_cfg1        ; //!< 0x0019 (0x00000018 RW): Buffer configuration 1
  ad7771_buffer_cfg2_reg_t         buffer_cfg2        ; //!< 0x001A (0x000000C7 RW): Buffer configuration (reference)
  ad7771_channel_offset_up_reg_t   channel_offset_up[8]; //!< 0x001B (0x00000000 RW): Channel  offset (upper byte)
  ad7771_channel_offset_mid_reg_t  channel_offset_mid[8]; //!< 0x0023 (0x00000000 RW): Channel  offset (middle byte)
  ad7771_channel_offset_low_reg_t  channel_offset_low[8]; //!< 0x002B (0x00000000 RW): Channel  offset (lower byte)
  ad7771_channel_gain_up_reg_t     channel_gain_up[8] ; //!< 0x0033 (0x00000000 RW): Channel  gain (upper byte)
  ad7771_channel_gain_mid_reg_t    channel_gain_mid[8]; //!< 0x003B (0x00000000 RW): Channel  gain (middle byte)
  ad7771_channel_gain_low_reg_t    channel_gain_low[8]; //!< 0x0043 (0x00000000 RW): Channel  gain (lower byte)
  ad7771_channel_status_reg_t      channel_status[8]  ; //!< 0x004B (0x00000000 RO): Channel  status
  ad7771_channel_dsp_err_reg_t     channel_dsp_err[4] ; //!< 0x0053 (0x00000000 RO): Channel (2*i)/(2*i+1) DSP errors
  ad7771_channel_test_en_reg_t     channel_test_en    ; //!< 0x0057 (0x000000FE RW): Channel 0 to 7 test enable
  ad7771_general_err1_reg_t        general_err1       ; //!< 0x0058 (0x00000000 RO): General Error 1
  ad7771_general_err1_en_reg_t     general_err1_en    ; //!< 0x0059 (0x0000003E RW): General Error 1 Enable
  ad7771_general_err2_reg_t        general_err2       ; //!< 0x005A (0x00000000 RO): General Error 2
  ad7771_general_err2_en_reg_t     general_err2_en    ; //!< 0x005B (0x0000002C RW): General Error 2
  ad7771_error_status1_reg_t       error_status1      ; //!< 0x005C (0x00000000 RO): Error Status 1
  ad7771_error_status2_reg_t       error_status2      ; //!< 0x005D (0x00000000 RO): Error Status 2
  ad7771_error_status3_reg_t       error_status3      ; //!< 0x005E (0x00000000 RO): Error Status 3
  ad7771_src_n_msb_reg_t           src_n_msb          ; //!< 0x005F (0x00000000 RW): Sample Rate converter N MSB
  ad7771_src_n_lsb_reg_t           src_n_lsb          ; //!< 0x0060 (0x00000000 RW): Sample Rate converter N LSB
  ad7771_src_if_msb_reg_t          src_if_msb         ; //!< 0x0061 (0x00000000 RW): Sample Rate converter IF MSB
  ad7771_src_if_lsb_reg_t          src_if_lsb         ; //!< 0x0062 (0x00000000 RW): Sample Rate converter IF LSB
  ad7771_src_load_reg_t            src_load           ; //!< 0x0063 (0x00000000 RW): Sample Rate converter load
} ad7771_regs_t;


#ifndef DOXYGEN_SHOULD_SKIP_THIS
#define AD7771_CHANNEL_CFG_OFFSET 0
#define AD7771_CHANNEL_CFG_RESET 0x000000
#define AD7771_CLOCK_DISABLE_OFFSET 8
#define AD7771_CLOCK_DISABLE_RESET 0x000000
#define AD7771_CHANNEL_SYNC_OFFSET_OFFSET 9
#define AD7771_CHANNEL_SYNC_OFFSET_RESET 0x000000
#define AD7771_USER_CFG1_OFFSET 17
#define AD7771_USER_CFG1_RESET 0x000024
#define AD7771_USER_CFG2_OFFSET 18
#define AD7771_USER_CFG2_RESET 0x000008
#define AD7771_USER_CFG3_OFFSET 19
#define AD7771_USER_CFG3_RESET 0x000080
#define AD7771_DATA_OUTPUT_OFFSET 20
#define AD7771_DATA_OUTPUT_RESET 0x000000
#define AD7771_MUX_CTRL_REF_MTR_OFFSET 21
#define AD7771_MUX_CTRL_REF_MTR_RESET 0x000000
#define AD7771_MUX_CTRL_GLOBAL_OFFSET 22
#define AD7771_MUX_CTRL_GLOBAL_RESET 0x000000
#define AD7771_GPIO_CFG_OFFSET 23
#define AD7771_GPIO_CFG_RESET 0x000000
#define AD7771_GPIO_DATA_OFFSET 24
#define AD7771_GPIO_DATA_RESET 0x000000
#define AD7771_BUFFER_CFG1_OFFSET 25
#define AD7771_BUFFER_CFG1_RESET 0x000018
#define AD7771_BUFFER_CFG2_OFFSET 26
#define AD7771_BUFFER_CFG2_RESET 0x0000C7
#define AD7771_CHANNEL_OFFSET_UP_OFFSET 27
#define AD7771_CHANNEL_OFFSET_UP_RESET 0x000000
#define AD7771_CHANNEL_OFFSET_MID_OFFSET 35
#define AD7771_CHANNEL_OFFSET_MID_RESET 0x000000
#define AD7771_CHANNEL_OFFSET_LOW_OFFSET 43
#define AD7771_CHANNEL_OFFSET_LOW_RESET 0x000000
#define AD7771_CHANNEL_GAIN_UP_OFFSET 51
#define AD7771_CHANNEL_GAIN_UP_RESET 0x000000
#define AD7771_CHANNEL_GAIN_MID_OFFSET 59
#define AD7771_CHANNEL_GAIN_MID_RESET 0x000000
#define AD7771_CHANNEL_GAIN_LOW_OFFSET 67
#define AD7771_CHANNEL_GAIN_LOW_RESET 0x000000
#define AD7771_CHANNEL_STATUS_OFFSET 75
#define AD7771_CHANNEL_STATUS_RESET 0x000000
#define AD7771_CHANNEL_DSP_ERR_OFFSET 83
#define AD7771_CHANNEL_DSP_ERR_RESET 0x000000
#define AD7771_CHANNEL_TEST_EN_OFFSET 87
#define AD7771_CHANNEL_TEST_EN_RESET 0x0000FE
#define AD7771_GENERAL_ERR1_OFFSET 88
#define AD7771_GENERAL_ERR1_RESET 0x000000
#define AD7771_GENERAL_ERR1_EN_OFFSET 89
#define AD7771_GENERAL_ERR1_EN_RESET 0x00003E
#define AD7771_GENERAL_ERR2_OFFSET 90
#define AD7771_GENERAL_ERR2_RESET 0x000000
#define AD7771_GENERAL_ERR2_EN_OFFSET 91
#define AD7771_GENERAL_ERR2_EN_RESET 0x00002C
#define AD7771_ERROR_STATUS1_OFFSET 92
#define AD7771_ERROR_STATUS1_RESET 0x000000
#define AD7771_ERROR_STATUS2_OFFSET 93
#define AD7771_ERROR_STATUS2_RESET 0x000000
#define AD7771_ERROR_STATUS3_OFFSET 94
#define AD7771_ERROR_STATUS3_RESET 0x000000
#define AD7771_SRC_N_MSB_OFFSET 95
#define AD7771_SRC_N_MSB_RESET 0x000000
#define AD7771_SRC_N_LSB_OFFSET 96
#define AD7771_SRC_N_LSB_RESET 0x000000
#define AD7771_SRC_IF_MSB_OFFSET 97
#define AD7771_SRC_IF_MSB_RESET 0x000000
#define AD7771_SRC_IF_LSB_OFFSET 98
#define AD7771_SRC_IF_LSB_RESET 0x000000
#define AD7771_SRC_LOAD_OFFSET 99
#define AD7771_SRC_LOAD_RESET 0x000000
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

#endif /* __AD7771_RIF_H__ */
