// File generated automatically: DO NOT EDIT.

package ad7771_rif_pkg;

   localparam int C_AD7771_RIF_ADDR_W =  7;
   localparam int C_AD7771_RIF_DATA_W =  8;

   // Enums
   typedef enum logic {
      LOW_PWR = 0, // Low power (1/4)
      HIGH_RES = 1  // High resolution
   } e_power_mode;

   typedef enum logic [1:0] {
      NONE = 0, // No effect
      SECOND = 2, // 2nd write
      FIRST = 3  // 1st write
   } e_soft_reset;

   typedef enum logic {
      SINC3 = 0, // 3-tap Sinc
      SINC5 = 1  // 5-tap Sinc
   } e_filter_mode;

   typedef enum logic [1:0] {
      NOMINAL = 0, // Nominal
      STRONG = 1, // Strong
      WEAK = 2, // Weak
      EXTRA_STRONG = 3  // Extra Strong
   } e_drive_str;

   typedef enum logic {
      DEGLITCH_1P5 = 2, // Deglitch 1.5 MCLK
      DISABLE = 3  // No deglitch circuit
   } e_deglitch;

   typedef enum logic [1:0] {
      QUAD = 0, // 4 DOUT lines
      DOUBLE = 1, // 2 DOUT lines
      SINGLE = 2  // 1 DOUT lines
   } e_data_format;

   typedef enum logic {
      STATUS = 0, // Status header
      CRC = 1  // CRC header
   } e_header_format;

   typedef enum logic [1:0] {
      EXT_PM = 0, // External reference REFx+/REFx−
      INTERNAL = 1, // Internal reference
      EXT_SUP = 2, // External supply AVDD1x/AVSSx
      EXT_MP = 3  // External reference REFx-/REFx+
   } e_ref_mux;

   typedef enum logic [2:0] {
      FIXED_280 = 0, // 280mV
      EXT_PM = 1, // External reference REFx+/REFx−
      EXT_MP = 2, // External reference REFx-/REFx+
      EXT_MM = 3, // External reference REFx-/REFx-
      INT_PM = 4, // Internal reference +/-
      INT_MP = 5, // Internal reference -/+
      INT_MM = 6, // Internal reference -/-
      EXT_PP = 7  // External reference REFx+/REFx+
   } e_mtr_mux;

   typedef enum logic [4:0] {
      AUXAIN = 0, // AUXAIN+/AUXAIN−.
      DVBE = 1, // DVBE/AVSSx.
      REF1_PM = 2, // REF1+/REF1−.
      REF2_PM = 3, // REF2+/REF2−.
      REF_OUT = 4, // REF_OUT/AVSSx.
      VCM = 5, // VCM/AVSSx.
      AREG1CAP = 6, // AREG1CAP/AVSSx.
      AREG2CAP = 7, // AREG2CAP/AVSSx.
      DREGCAP = 8, // DREGCAP/DGND.
      AVDD1A = 9, // AVDD1A/AVSSx.
      AVDD1B = 10, // AVDD1B/AVSSx.
      AVDD2A = 11, // AVDD2A/AVSSx.
      AVDD2B = 12, // AVDD2B/AVSSx.
      IOVDD = 13, // IOVDD/DGND.
      AVDD4 = 14, // AVDD4/AVSSx.
      DGND_A = 15, // DGND/AVSS1A.
      DGND_B = 16, // DGND/AVSS1B.
      DGND_X = 17, // DGND/AVSSx.
      AVDD4_X = 18, // AVDD4/AVSSx.
      REF1_PX = 19, // REF1+/AVSSx.
      REF2_PX = 20, // REF2+/AVSSx.
      AVDD4_ATT = 21  // AVDD4/AVSSx. Attenuated.
   } e_glob_mux;

   typedef struct {
      logic [1:0] gain[8]; // AFE Gain (power of 2)
      logic ref_mon[8]; // Channel used as reference monitor
      logic rx[8]; // Channel meter Mux RX mode
      logic [3:0] bias[8]; // Hidden tuning register
      logic disable_ch[8]; // Channel  Disable
      logic signed [7:0] sync_offset[8]; // Sync offset
      logic signed [23:0] offset[8]; // Offset (bit 23:16)
      logic output_sat_test_en; // ADC Conversion Error Test Enable
      logic filter_sat_test_en; // Filter Saturation Test Enable
      logic mod_sat_test_en; // Enable Error Flag for Modulator Saturation
      logic ainm_uv_test_en; // AINx− Undervoltage Test Enable
      logic ainm_ov_test_en; // AINx− Overvoltage Test Enable
      logic ainp_uv_test_en; // AINx+ Undervoltage Test Enable
      logic ainp_ov_test_en; // AINx+ Overvoltage Test Enable
      logic ref_det_test_en; // Reference Detect Test Enable
   } t_channel_sw;

   typedef struct {
      logic err_ainm_uv[8]; // Channel  — AIN0− Undervoltage Error
      logic err_ainm_ov[8]; // Channel  — AIN0− Overvoltage Error
      logic err_ainp_uv[8]; // Channel  — AIN0+ Undervoltage Error
      logic err_ainp_ov[8]; // Channel  — AIN0+ Overvoltage Error
      logic err_ref_det[8]; // Channel  — Reference Detect Error
      logic err_mod_sat[8]; // Channel  — Modulator Output Saturation Error
      logic err_filter_sat[8]; // Channel  — Filter result has exceeded a reasonable level, before offset and gain calibration has been applied
      logic err_output_sat[8]; // Channel  — ADC conversion has exceeded limits and has been clamped
   } t_channel_hw;

   typedef struct packed {
      logic all_ch_dis_mclk; // Keep DCLK even when all channel are disabled
      e_power_mode power_mode; // Power down VCM buffer (active low)
      logic pdb_vcm; // Power down VCM buffer (active low)
      logic pdb_refout; // Power down Reference output buffer (active low)
      logic pdb_sar; // Power down SAR (active low)
      logic pdb_rc_osc; // Power down internal oscillator (active low)
      e_soft_reset soft_reset; // Soft reset
      e_filter_mode filter_mode; // Power down VCM buffer (active low)
      logic sar_diag_en; // Sets SPI interface to read back SAR result on SDO
      e_drive_str sdo_drive_str; // Configure drive strength for SDO
      e_drive_str dout_drive_str; // Configure drive strength for DOUT
      logic spi_sync; // SYNC pulse generated through SPI
      e_deglitch convst_deglitch_dis; // Disable deglitching of CONVST_SAR pin
      logic spi_subordinate; // Enable SPI subordinate to read-back ADC on SDO
      logic clk_qual_dis; // Disable clock qualifier check if user reqyire to use an MCLK < 256 kHz
   } t_user_cfg_sw;

   typedef struct packed {
      e_data_format data_format; // Data out format
      e_header_format header_format; // Header format
      logic [2:0] dclk_div; // MCLK divider (power of 2)
   } t_data_output_sw;

   typedef struct packed {
      e_ref_mux ref; // SD ADC reference mux
      e_mtr_mux mtr; // SD ADC Meter mux
      e_glob_mux global; // SD ADC reference mux
   } t_mux_ctrl_sw;

   typedef struct packed {
      logic [2:0] op_en; // Input/Output
   } t_gpio_cfg_sw;

   typedef struct packed {
      logic [2:0] write; // Value sent to the GPIO pins
   } t_gpio_data_sw;

   typedef struct packed {
      logic [2:0] read; // Data read from the GPIO pins
   } t_gpio_data_hw;

   typedef struct packed {
      logic ref_buf_pos_en; // Reference buffer positive enable
      logic ref_buf_neg_en; // Reference buffer negative enable
      logic ref_buf_pos_preq; // Reference Buffer Positive Precharge Enable
      logic ref_buf_neg_preq; // Reference Buffer Negative Precharge Enable
      logic pdb_aldo1_ovrdrv; // AREG1CAP Overdrive Enable
      logic pdb_aldo2_ovrdrv; // AREG2CAP Overdrive Enable
      logic pdb_dldo_ovrdrv; // DREGCAP Overdrive Enable
   } t_buffer_cfg_sw;

   typedef struct packed {
      logic memmap_crc_err_en; // Enable a CRC of the memory map contents is run periodically to check for errors
      logic rom_crc_err_en; // Enable a CRC of the fuse contents is run periodically to check for errors in the fuses
      logic spi_clk_count_err_en; // Enable SPI clock counter error
      logic spi_invalid_read_err_en; // Enable SPI invalid read address
      logic spi_invalid_write_err_en; // Enable SPI invalid write address
      logic spi_crc_err_en; // Enable SPI CRC error
      logic reset_detected_en; // Enable Reset Detected
      logic aldo_psm_err_en; // Enable analog Power Supply Error
      logic dldo_psm_err_en; // Enable digital Power Supply Error
      logic [1:0] ldo_psm_trip_test; // Run PSM Trip
   } t_general_err_sw;

   typedef struct packed {
      logic memmap_crc_err; // A CRC of the memory map contents is run periodically to check for errors
      logic rom_crc_err; // A CRC of the fuse contents is run periodically to check for errors in the fuses
      logic spi_clk_count_err; // SPI clock counter error
      logic spi_invalid_read_err; // SPI invalid read address
      logic spi_invalid_write_err; // SPI invalid write address
      logic spi_crc_err; // SPI CRC error
      logic reset_detected; // Reset Detected
      logic ext_mclk_switch_err; // Clock Not Switched Over
      logic aldo1_psm_err; // AREG1CAP Power Supply Error
      logic aldo2_psm_err; // AREG2CAP Power Supply Error
      logic dldo_psm_err; // DREGCAP Power Supply Error
   } t_general_err_hw;

   typedef struct {
      logic chip_error1; // High when any error bit is high
      logic err_loc_ch[8]; // Error specific to channel 
      logic chip_error2; // High when any error bit is high
      logic err_loc_gen[2]; // Error specific to gen_err[(i+1)]
      logic chip_error3; // High when any error bit is high
      logic init_complete; // Fuse init complete
      logic err_loc_sat_ch[4]; // Sat Error specific to channel (i) / (i+1)
   } t_error_status_hw;

   typedef struct packed {
      logic [11:0] src_n; // Sample Rate converter N[11:8]
      logic [15:0] src_if; // Sample Rate converter IF[15:8]
      logic load_source; // Select which option to load an SRC update
      logic load_update; // Assert to load SRC registers into SRC
   } t_decimation_sw;

endpackage : ad7771_rif_pkg
