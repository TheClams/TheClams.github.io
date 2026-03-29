// File generated automatically: DO NOT EDIT.

module ad7771_rif (
   input  var logic clk_rif, // Software clock
   input  var logic rst_rif_n, // Software asynchronous reset, active low
   input  var logic clk, // Hardware clock
   input  var logic rst_n, // Hardware asynchronous reset, active low
   // Input registers
   input  var ad7771_rif_pkg::t_channel_hw channel, // Channel  configuration
   input  var ad7771_rif_pkg::t_gpio_data_hw gpio_data, // GPIO configuration register
   input  var ad7771_rif_pkg::t_general_err_hw general_err, // General Error 1
   input  var ad7771_rif_pkg::t_error_status_hw error_status, // Error Status 1
   // Output registers
   output var ad7771_rif_pkg::t_channel_sw rif_channel, // Channel  configuration
   output var ad7771_rif_pkg::t_user_cfg_sw rif_user_cfg, // General user configuration 1 (power-down/reset)
   output var ad7771_rif_pkg::t_data_output_sw rif_data_output, // Data output format
   output var ad7771_rif_pkg::t_mux_ctrl_sw rif_mux_ctrl, // ADC/Reference muc control
   output var ad7771_rif_pkg::t_gpio_cfg_sw rif_gpio_cfg, // GPIO configuration register
   output var ad7771_rif_pkg::t_gpio_data_sw rif_gpio_data, // GPIO configuration register
   output var ad7771_rif_pkg::t_buffer_cfg_sw rif_buffer_cfg, // Buffer configuration 1
   output var ad7771_rif_pkg::t_general_err_sw rif_general_err, // General Error 1
   output var ad7771_rif_pkg::t_decimation_sw rif_decimation, // Sample Rate converter N MSB
   input  var logic [6:0] paddr, // APB Address
   input  var logic psel, // APB Select
   input  var logic penable, // APB Enable
   input  var logic pwrite, // APB Write
   input  var logic [7:0] pwdata, // APB Write Data
   output var logic [7:0] prdata, // APB Read Data
   output var logic pready, // APB Ready
   output var logic pslverr  // APB Slave Error
);

//-----------------------------------------------------------------------------
// Signals declaration
//-----------------------------------------------------------------------------
   logic [6:0] rif_addr_l;
   logic [7:0] rif_read_data_l;
   logic rif_err_addr_l;
   logic rif_err_access_l;
   logic rif_done_next;

   logic channel_cfg0__decode;
   logic [7:0] channel_cfg0__read_data;
   logic channel_cfg1__decode;
   logic [7:0] channel_cfg1__read_data;
   logic channel_cfg2__decode;
   logic [7:0] channel_cfg2__read_data;
   logic channel_cfg3__decode;
   logic [7:0] channel_cfg3__read_data;
   logic channel_cfg4__decode;
   logic [7:0] channel_cfg4__read_data;
   logic channel_cfg5__decode;
   logic [7:0] channel_cfg5__read_data;
   logic channel_cfg6__decode;
   logic [7:0] channel_cfg6__read_data;
   logic channel_cfg7__decode;
   logic [7:0] channel_cfg7__read_data;
   logic clock_disable__decode;
   logic [7:0] clock_disable__read_data;
   logic channel_sync_offset0__decode;
   logic [7:0] channel_sync_offset0__read_data;
   logic channel_sync_offset1__decode;
   logic [7:0] channel_sync_offset1__read_data;
   logic channel_sync_offset2__decode;
   logic [7:0] channel_sync_offset2__read_data;
   logic channel_sync_offset3__decode;
   logic [7:0] channel_sync_offset3__read_data;
   logic channel_sync_offset4__decode;
   logic [7:0] channel_sync_offset4__read_data;
   logic channel_sync_offset5__decode;
   logic [7:0] channel_sync_offset5__read_data;
   logic channel_sync_offset6__decode;
   logic [7:0] channel_sync_offset6__read_data;
   logic channel_sync_offset7__decode;
   logic [7:0] channel_sync_offset7__read_data;
   logic user_cfg1__decode;
   logic [7:0] user_cfg1__read_data;
   logic user_cfg2__decode;
   logic [7:0] user_cfg2__read_data;
   logic user_cfg3__decode;
   logic [7:0] user_cfg3__read_data;
   logic data_output__decode;
   logic [7:0] data_output__read_data;
   logic mux_ctrl_ref_mtr__decode;
   logic [7:0] mux_ctrl_ref_mtr__read_data;
   logic mux_ctrl_global__decode;
   logic [7:0] mux_ctrl_global__read_data;
   logic gpio_cfg__decode;
   logic [7:0] gpio_cfg__read_data;
   logic gpio_data__decode;
   logic [7:0] gpio_data__read_data;
   logic buffer_cfg1__decode;
   logic [7:0] buffer_cfg1__read_data;
   logic buffer_cfg2__decode;
   logic [7:0] buffer_cfg2__read_data;
   logic channel_offset_up0__decode;
   logic [7:0] channel_offset_up0__read_data;
   logic channel_offset_up1__decode;
   logic [7:0] channel_offset_up1__read_data;
   logic channel_offset_up2__decode;
   logic [7:0] channel_offset_up2__read_data;
   logic channel_offset_up3__decode;
   logic [7:0] channel_offset_up3__read_data;
   logic channel_offset_up4__decode;
   logic [7:0] channel_offset_up4__read_data;
   logic channel_offset_up5__decode;
   logic [7:0] channel_offset_up5__read_data;
   logic channel_offset_up6__decode;
   logic [7:0] channel_offset_up6__read_data;
   logic channel_offset_up7__decode;
   logic [7:0] channel_offset_up7__read_data;
   logic channel_offset_mid0__decode;
   logic [7:0] channel_offset_mid0__read_data;
   logic channel_offset_mid1__decode;
   logic [7:0] channel_offset_mid1__read_data;
   logic channel_offset_mid2__decode;
   logic [7:0] channel_offset_mid2__read_data;
   logic channel_offset_mid3__decode;
   logic [7:0] channel_offset_mid3__read_data;
   logic channel_offset_mid4__decode;
   logic [7:0] channel_offset_mid4__read_data;
   logic channel_offset_mid5__decode;
   logic [7:0] channel_offset_mid5__read_data;
   logic channel_offset_mid6__decode;
   logic [7:0] channel_offset_mid6__read_data;
   logic channel_offset_mid7__decode;
   logic [7:0] channel_offset_mid7__read_data;
   logic channel_offset_low0__decode;
   logic [7:0] channel_offset_low0__read_data;
   logic channel_offset_low1__decode;
   logic [7:0] channel_offset_low1__read_data;
   logic channel_offset_low2__decode;
   logic [7:0] channel_offset_low2__read_data;
   logic channel_offset_low3__decode;
   logic [7:0] channel_offset_low3__read_data;
   logic channel_offset_low4__decode;
   logic [7:0] channel_offset_low4__read_data;
   logic channel_offset_low5__decode;
   logic [7:0] channel_offset_low5__read_data;
   logic channel_offset_low6__decode;
   logic [7:0] channel_offset_low6__read_data;
   logic channel_offset_low7__decode;
   logic [7:0] channel_offset_low7__read_data;
   logic channel_gain_up0__decode;
   logic [7:0] channel_gain_up0__read_data;
   logic channel_gain_up1__decode;
   logic [7:0] channel_gain_up1__read_data;
   logic channel_gain_up2__decode;
   logic [7:0] channel_gain_up2__read_data;
   logic channel_gain_up3__decode;
   logic [7:0] channel_gain_up3__read_data;
   logic channel_gain_up4__decode;
   logic [7:0] channel_gain_up4__read_data;
   logic channel_gain_up5__decode;
   logic [7:0] channel_gain_up5__read_data;
   logic channel_gain_up6__decode;
   logic [7:0] channel_gain_up6__read_data;
   logic channel_gain_up7__decode;
   logic [7:0] channel_gain_up7__read_data;
   logic channel_gain_mid0__decode;
   logic [7:0] channel_gain_mid0__read_data;
   logic channel_gain_mid1__decode;
   logic [7:0] channel_gain_mid1__read_data;
   logic channel_gain_mid2__decode;
   logic [7:0] channel_gain_mid2__read_data;
   logic channel_gain_mid3__decode;
   logic [7:0] channel_gain_mid3__read_data;
   logic channel_gain_mid4__decode;
   logic [7:0] channel_gain_mid4__read_data;
   logic channel_gain_mid5__decode;
   logic [7:0] channel_gain_mid5__read_data;
   logic channel_gain_mid6__decode;
   logic [7:0] channel_gain_mid6__read_data;
   logic channel_gain_mid7__decode;
   logic [7:0] channel_gain_mid7__read_data;
   logic channel_gain_low0__decode;
   logic [7:0] channel_gain_low0__read_data;
   logic channel_gain_low1__decode;
   logic [7:0] channel_gain_low1__read_data;
   logic channel_gain_low2__decode;
   logic [7:0] channel_gain_low2__read_data;
   logic channel_gain_low3__decode;
   logic [7:0] channel_gain_low3__read_data;
   logic channel_gain_low4__decode;
   logic [7:0] channel_gain_low4__read_data;
   logic channel_gain_low5__decode;
   logic [7:0] channel_gain_low5__read_data;
   logic channel_gain_low6__decode;
   logic [7:0] channel_gain_low6__read_data;
   logic channel_gain_low7__decode;
   logic [7:0] channel_gain_low7__read_data;
   logic [7:0] channel_status0__read_data;
   logic [7:0] channel_status1__read_data;
   logic [7:0] channel_status2__read_data;
   logic [7:0] channel_status3__read_data;
   logic [7:0] channel_status4__read_data;
   logic [7:0] channel_status5__read_data;
   logic [7:0] channel_status6__read_data;
   logic [7:0] channel_status7__read_data;
   logic [7:0] channel_dsp_err0__read_data;
   logic [7:0] channel_dsp_err1__read_data;
   logic [7:0] channel_dsp_err2__read_data;
   logic [7:0] channel_dsp_err3__read_data;
   logic channel_test_en__decode;
   logic [7:0] channel_test_en__read_data;
   logic [7:0] general_err1__read_data;
   logic general_err1_en__decode;
   logic [7:0] general_err1_en__read_data;
   logic [7:0] general_err2__read_data;
   logic general_err2_en__decode;
   logic [7:0] general_err2_en__read_data;
   logic [7:0] error_status1__read_data;
   logic [7:0] error_status2__read_data;
   logic [7:0] error_status3__read_data;
   logic src_n_msb__decode;
   logic [7:0] src_n_msb__read_data;
   logic src_n_lsb__decode;
   logic [7:0] src_n_lsb__read_data;
   logic src_if_msb__decode;
   logic [7:0] src_if_msb__read_data;
   logic src_if_lsb__decode;
   logic [7:0] src_if_lsb__read_data;
   logic src_load__decode;
   logic [7:0] src_load__read_data;

   logic [1:0] channel_gain0__next;
   logic [1:0] channel_gain1__next;
   logic [1:0] channel_gain2__next;
   logic [1:0] channel_gain3__next;
   logic [1:0] channel_gain4__next;
   logic [1:0] channel_gain5__next;
   logic [1:0] channel_gain6__next;
   logic [1:0] channel_gain7__next;
   logic channel_ref_mon0__next;
   logic channel_ref_mon1__next;
   logic channel_ref_mon2__next;
   logic channel_ref_mon3__next;
   logic channel_ref_mon4__next;
   logic channel_ref_mon5__next;
   logic channel_ref_mon6__next;
   logic channel_ref_mon7__next;
   logic channel_rx0__next;
   logic channel_rx1__next;
   logic channel_rx2__next;
   logic channel_rx3__next;
   logic channel_rx4__next;
   logic channel_rx5__next;
   logic channel_rx6__next;
   logic channel_rx7__next;
   logic [3:0] channel_bias0__next;
   logic [3:0] channel_bias1__next;
   logic [3:0] channel_bias2__next;
   logic [3:0] channel_bias3__next;
   logic [3:0] channel_bias4__next;
   logic [3:0] channel_bias5__next;
   logic [3:0] channel_bias6__next;
   logic [3:0] channel_bias7__next;
   logic channel_disable_ch0__next;
   logic channel_disable_ch1__next;
   logic channel_disable_ch2__next;
   logic channel_disable_ch3__next;
   logic channel_disable_ch4__next;
   logic channel_disable_ch5__next;
   logic channel_disable_ch6__next;
   logic channel_disable_ch7__next;
   logic signed [7:0] channel_sync_offset0__next;
   logic signed [7:0] channel_sync_offset1__next;
   logic signed [7:0] channel_sync_offset2__next;
   logic signed [7:0] channel_sync_offset3__next;
   logic signed [7:0] channel_sync_offset4__next;
   logic signed [7:0] channel_sync_offset5__next;
   logic signed [7:0] channel_sync_offset6__next;
   logic signed [7:0] channel_sync_offset7__next;
   logic signed [23:0] channel_offset0__next;
   logic signed [23:0] channel_offset1__next;
   logic signed [23:0] channel_offset2__next;
   logic signed [23:0] channel_offset3__next;
   logic signed [23:0] channel_offset4__next;
   logic signed [23:0] channel_offset5__next;
   logic signed [23:0] channel_offset6__next;
   logic signed [23:0] channel_offset7__next;
   logic channel_output_sat_test_en__next;
   logic channel_filter_sat_test_en__next;
   logic channel_mod_sat_test_en__next;
   logic channel_ainm_uv_test_en__next;
   logic channel_ainm_ov_test_en__next;
   logic channel_ainp_uv_test_en__next;
   logic channel_ainp_ov_test_en__next;
   logic channel_ref_det_test_en__next;
   logic user_cfg_all_ch_dis_mclk__next;
   ad7771_rif_pkg::e_power_mode user_cfg_power_mode__next;
   logic user_cfg_pdb_vcm__next;
   logic user_cfg_pdb_refout__next;
   logic user_cfg_pdb_sar__next;
   logic user_cfg_pdb_rc_osc__next;
   ad7771_rif_pkg::e_soft_reset user_cfg_soft_reset__next;
   ad7771_rif_pkg::e_filter_mode user_cfg_filter_mode__next;
   logic user_cfg_sar_diag_en__next;
   ad7771_rif_pkg::e_drive_str user_cfg_sdo_drive_str__next;
   ad7771_rif_pkg::e_drive_str user_cfg_dout_drive_str__next;
   logic user_cfg_spi_sync__next;
   ad7771_rif_pkg::e_deglitch user_cfg_convst_deglitch_dis__next;
   logic user_cfg_spi_subordinate__next;
   logic user_cfg_clk_qual_dis__next;
   ad7771_rif_pkg::e_data_format data_output_data_format__next;
   ad7771_rif_pkg::e_header_format data_output_header_format__next;
   logic [2:0] data_output_dclk_div__next;
   ad7771_rif_pkg::e_ref_mux mux_ctrl_ref__next;
   ad7771_rif_pkg::e_mtr_mux mux_ctrl_mtr__next;
   ad7771_rif_pkg::e_glob_mux mux_ctrl_global__next;
   logic [2:0] gpio_cfg_op_en__next;
   logic [2:0] gpio_data_write__next;
   logic buffer_cfg_ref_buf_pos_en__next;
   logic buffer_cfg_ref_buf_neg_en__next;
   logic buffer_cfg_ref_buf_pos_preq__next;
   logic buffer_cfg_ref_buf_neg_preq__next;
   logic buffer_cfg_pdb_aldo1_ovrdrv__next;
   logic buffer_cfg_pdb_aldo2_ovrdrv__next;
   logic buffer_cfg_pdb_dldo_ovrdrv__next;
   logic general_err_memmap_crc_err_en__next;
   logic general_err_rom_crc_err_en__next;
   logic general_err_spi_clk_count_err_en__next;
   logic general_err_spi_invalid_read_err_en__next;
   logic general_err_spi_invalid_write_err_en__next;
   logic general_err_spi_crc_err_en__next;
   logic general_err_reset_detected_en__next;
   logic general_err_aldo_psm_err_en__next;
   logic general_err_dldo_psm_err_en__next;
   logic [1:0] general_err_ldo_psm_trip_test__next;
   logic [11:0] decimation_src_n__next;
   logic [15:0] decimation_src_if__next;
   logic decimation_load_source__next;
   logic decimation_load_update__next;
   rif_if#(7, 8) if_rif(clk_rif, rst_rif_n);

//-----------------------------------------------------------------------------
// Bridge to the internal register interface
//-----------------------------------------------------------------------------

   bridge_apb_rif#(7, 8) i_bridge (.clk(clk_rif), .rst_n(rst_rif_n), .* );


//-----------------------------------------------------------------------------
// Interface handling
//-----------------------------------------------------------------------------

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_if_rif
      if(!rst_rif_n) begin
         if_rif.err_addr <= 1'b0;
         if_rif.err_access <= 1'b0;
         if_rif.done <= 1'b0;
         if_rif.rd_data <= 8'd0;
      end else begin
         if_rif.err_addr <= rif_err_addr_l && if_rif.en;
         if_rif.err_access <= rif_err_access_l && if_rif.en;
         if_rif.done <= rif_done_next;
         if(rif_done_next && if_rif.rd_wrn)
            if_rif.rd_data <= rif_read_data_l;
      end
   end

   assign if_rif.done_next       = rif_done_next   ;
   assign if_rif.err_addr_next   = rif_err_addr_l  ;
   assign if_rif.err_access_next = rif_err_access_l;

   assign rif_addr_l = if_rif.addr[6:0];

   always_comb begin : proc_decode
      rif_read_data_l = 8'd0;
      rif_done_next = if_rif.en;
      rif_err_addr_l = 1'b1;
      rif_err_access_l = 1'b1;
      channel_cfg0__decode = 1'b0;
      channel_cfg1__decode = 1'b0;
      channel_cfg2__decode = 1'b0;
      channel_cfg3__decode = 1'b0;
      channel_cfg4__decode = 1'b0;
      channel_cfg5__decode = 1'b0;
      channel_cfg6__decode = 1'b0;
      channel_cfg7__decode = 1'b0;
      clock_disable__decode = 1'b0;
      channel_sync_offset0__decode = 1'b0;
      channel_sync_offset1__decode = 1'b0;
      channel_sync_offset2__decode = 1'b0;
      channel_sync_offset3__decode = 1'b0;
      channel_sync_offset4__decode = 1'b0;
      channel_sync_offset5__decode = 1'b0;
      channel_sync_offset6__decode = 1'b0;
      channel_sync_offset7__decode = 1'b0;
      user_cfg1__decode = 1'b0;
      user_cfg2__decode = 1'b0;
      user_cfg3__decode = 1'b0;
      data_output__decode = 1'b0;
      mux_ctrl_ref_mtr__decode = 1'b0;
      mux_ctrl_global__decode = 1'b0;
      gpio_cfg__decode = 1'b0;
      gpio_data__decode = 1'b0;
      buffer_cfg1__decode = 1'b0;
      buffer_cfg2__decode = 1'b0;
      channel_offset_up0__decode = 1'b0;
      channel_offset_up1__decode = 1'b0;
      channel_offset_up2__decode = 1'b0;
      channel_offset_up3__decode = 1'b0;
      channel_offset_up4__decode = 1'b0;
      channel_offset_up5__decode = 1'b0;
      channel_offset_up6__decode = 1'b0;
      channel_offset_up7__decode = 1'b0;
      channel_offset_mid0__decode = 1'b0;
      channel_offset_mid1__decode = 1'b0;
      channel_offset_mid2__decode = 1'b0;
      channel_offset_mid3__decode = 1'b0;
      channel_offset_mid4__decode = 1'b0;
      channel_offset_mid5__decode = 1'b0;
      channel_offset_mid6__decode = 1'b0;
      channel_offset_mid7__decode = 1'b0;
      channel_offset_low0__decode = 1'b0;
      channel_offset_low1__decode = 1'b0;
      channel_offset_low2__decode = 1'b0;
      channel_offset_low3__decode = 1'b0;
      channel_offset_low4__decode = 1'b0;
      channel_offset_low5__decode = 1'b0;
      channel_offset_low6__decode = 1'b0;
      channel_offset_low7__decode = 1'b0;
      channel_gain_up0__decode = 1'b0;
      channel_gain_up1__decode = 1'b0;
      channel_gain_up2__decode = 1'b0;
      channel_gain_up3__decode = 1'b0;
      channel_gain_up4__decode = 1'b0;
      channel_gain_up5__decode = 1'b0;
      channel_gain_up6__decode = 1'b0;
      channel_gain_up7__decode = 1'b0;
      channel_gain_mid0__decode = 1'b0;
      channel_gain_mid1__decode = 1'b0;
      channel_gain_mid2__decode = 1'b0;
      channel_gain_mid3__decode = 1'b0;
      channel_gain_mid4__decode = 1'b0;
      channel_gain_mid5__decode = 1'b0;
      channel_gain_mid6__decode = 1'b0;
      channel_gain_mid7__decode = 1'b0;
      channel_gain_low0__decode = 1'b0;
      channel_gain_low1__decode = 1'b0;
      channel_gain_low2__decode = 1'b0;
      channel_gain_low3__decode = 1'b0;
      channel_gain_low4__decode = 1'b0;
      channel_gain_low5__decode = 1'b0;
      channel_gain_low6__decode = 1'b0;
      channel_gain_low7__decode = 1'b0;
      channel_test_en__decode = 1'b0;
      general_err1_en__decode = 1'b0;
      general_err2_en__decode = 1'b0;
      src_n_msb__decode = 1'b0;
      src_n_lsb__decode = 1'b0;
      src_if_msb__decode = 1'b0;
      src_if_lsb__decode = 1'b0;
      src_load__decode = 1'b0;
      case(rif_addr_l)
         7'd0 : begin
            channel_cfg0__decode = 1'b1;
            rif_read_data_l  = channel_cfg0__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd1 : begin
            channel_cfg1__decode = 1'b1;
            rif_read_data_l  = channel_cfg1__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd2 : begin
            channel_cfg2__decode = 1'b1;
            rif_read_data_l  = channel_cfg2__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd3 : begin
            channel_cfg3__decode = 1'b1;
            rif_read_data_l  = channel_cfg3__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd4 : begin
            channel_cfg4__decode = 1'b1;
            rif_read_data_l  = channel_cfg4__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd5 : begin
            channel_cfg5__decode = 1'b1;
            rif_read_data_l  = channel_cfg5__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd6 : begin
            channel_cfg6__decode = 1'b1;
            rif_read_data_l  = channel_cfg6__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd7 : begin
            channel_cfg7__decode = 1'b1;
            rif_read_data_l  = channel_cfg7__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd8 : begin
            clock_disable__decode = 1'b1;
            rif_read_data_l  = clock_disable__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd9 : begin
            channel_sync_offset0__decode = 1'b1;
            rif_read_data_l  = channel_sync_offset0__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd10 : begin
            channel_sync_offset1__decode = 1'b1;
            rif_read_data_l  = channel_sync_offset1__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd11 : begin
            channel_sync_offset2__decode = 1'b1;
            rif_read_data_l  = channel_sync_offset2__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd12 : begin
            channel_sync_offset3__decode = 1'b1;
            rif_read_data_l  = channel_sync_offset3__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd13 : begin
            channel_sync_offset4__decode = 1'b1;
            rif_read_data_l  = channel_sync_offset4__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd14 : begin
            channel_sync_offset5__decode = 1'b1;
            rif_read_data_l  = channel_sync_offset5__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd15 : begin
            channel_sync_offset6__decode = 1'b1;
            rif_read_data_l  = channel_sync_offset6__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd16 : begin
            channel_sync_offset7__decode = 1'b1;
            rif_read_data_l  = channel_sync_offset7__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd17 : begin
            user_cfg1__decode = 1'b1;
            rif_read_data_l  = user_cfg1__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd18 : begin
            user_cfg2__decode = 1'b1;
            rif_read_data_l  = user_cfg2__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd19 : begin
            user_cfg3__decode = 1'b1;
            rif_read_data_l  = user_cfg3__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd20 : begin
            data_output__decode = 1'b1;
            rif_read_data_l  = data_output__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd21 : begin
            mux_ctrl_ref_mtr__decode = 1'b1;
            rif_read_data_l  = mux_ctrl_ref_mtr__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd22 : begin
            mux_ctrl_global__decode = 1'b1;
            rif_read_data_l  = mux_ctrl_global__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd23 : begin
            gpio_cfg__decode = 1'b1;
            rif_read_data_l  = gpio_cfg__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd24 : begin
            gpio_data__decode = 1'b1;
            rif_read_data_l  = gpio_data__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd25 : begin
            buffer_cfg1__decode = 1'b1;
            rif_read_data_l  = buffer_cfg1__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd26 : begin
            buffer_cfg2__decode = 1'b1;
            rif_read_data_l  = buffer_cfg2__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd27 : begin
            channel_offset_up0__decode = 1'b1;
            rif_read_data_l  = channel_offset_up0__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd28 : begin
            channel_offset_up1__decode = 1'b1;
            rif_read_data_l  = channel_offset_up1__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd29 : begin
            channel_offset_up2__decode = 1'b1;
            rif_read_data_l  = channel_offset_up2__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd30 : begin
            channel_offset_up3__decode = 1'b1;
            rif_read_data_l  = channel_offset_up3__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd31 : begin
            channel_offset_up4__decode = 1'b1;
            rif_read_data_l  = channel_offset_up4__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd32 : begin
            channel_offset_up5__decode = 1'b1;
            rif_read_data_l  = channel_offset_up5__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd33 : begin
            channel_offset_up6__decode = 1'b1;
            rif_read_data_l  = channel_offset_up6__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd34 : begin
            channel_offset_up7__decode = 1'b1;
            rif_read_data_l  = channel_offset_up7__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd35 : begin
            channel_offset_mid0__decode = 1'b1;
            rif_read_data_l  = channel_offset_mid0__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd36 : begin
            channel_offset_mid1__decode = 1'b1;
            rif_read_data_l  = channel_offset_mid1__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd37 : begin
            channel_offset_mid2__decode = 1'b1;
            rif_read_data_l  = channel_offset_mid2__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd38 : begin
            channel_offset_mid3__decode = 1'b1;
            rif_read_data_l  = channel_offset_mid3__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd39 : begin
            channel_offset_mid4__decode = 1'b1;
            rif_read_data_l  = channel_offset_mid4__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd40 : begin
            channel_offset_mid5__decode = 1'b1;
            rif_read_data_l  = channel_offset_mid5__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd41 : begin
            channel_offset_mid6__decode = 1'b1;
            rif_read_data_l  = channel_offset_mid6__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd42 : begin
            channel_offset_mid7__decode = 1'b1;
            rif_read_data_l  = channel_offset_mid7__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd43 : begin
            channel_offset_low0__decode = 1'b1;
            rif_read_data_l  = channel_offset_low0__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd44 : begin
            channel_offset_low1__decode = 1'b1;
            rif_read_data_l  = channel_offset_low1__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd45 : begin
            channel_offset_low2__decode = 1'b1;
            rif_read_data_l  = channel_offset_low2__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd46 : begin
            channel_offset_low3__decode = 1'b1;
            rif_read_data_l  = channel_offset_low3__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd47 : begin
            channel_offset_low4__decode = 1'b1;
            rif_read_data_l  = channel_offset_low4__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd48 : begin
            channel_offset_low5__decode = 1'b1;
            rif_read_data_l  = channel_offset_low5__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd49 : begin
            channel_offset_low6__decode = 1'b1;
            rif_read_data_l  = channel_offset_low6__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd50 : begin
            channel_offset_low7__decode = 1'b1;
            rif_read_data_l  = channel_offset_low7__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd51 : begin
            channel_gain_up0__decode = 1'b1;
            rif_read_data_l  = channel_gain_up0__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd52 : begin
            channel_gain_up1__decode = 1'b1;
            rif_read_data_l  = channel_gain_up1__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd53 : begin
            channel_gain_up2__decode = 1'b1;
            rif_read_data_l  = channel_gain_up2__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd54 : begin
            channel_gain_up3__decode = 1'b1;
            rif_read_data_l  = channel_gain_up3__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd55 : begin
            channel_gain_up4__decode = 1'b1;
            rif_read_data_l  = channel_gain_up4__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd56 : begin
            channel_gain_up5__decode = 1'b1;
            rif_read_data_l  = channel_gain_up5__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd57 : begin
            channel_gain_up6__decode = 1'b1;
            rif_read_data_l  = channel_gain_up6__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd58 : begin
            channel_gain_up7__decode = 1'b1;
            rif_read_data_l  = channel_gain_up7__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd59 : begin
            channel_gain_mid0__decode = 1'b1;
            rif_read_data_l  = channel_gain_mid0__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd60 : begin
            channel_gain_mid1__decode = 1'b1;
            rif_read_data_l  = channel_gain_mid1__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd61 : begin
            channel_gain_mid2__decode = 1'b1;
            rif_read_data_l  = channel_gain_mid2__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd62 : begin
            channel_gain_mid3__decode = 1'b1;
            rif_read_data_l  = channel_gain_mid3__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd63 : begin
            channel_gain_mid4__decode = 1'b1;
            rif_read_data_l  = channel_gain_mid4__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd64 : begin
            channel_gain_mid5__decode = 1'b1;
            rif_read_data_l  = channel_gain_mid5__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd65 : begin
            channel_gain_mid6__decode = 1'b1;
            rif_read_data_l  = channel_gain_mid6__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd66 : begin
            channel_gain_mid7__decode = 1'b1;
            rif_read_data_l  = channel_gain_mid7__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd67 : begin
            channel_gain_low0__decode = 1'b1;
            rif_read_data_l  = channel_gain_low0__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd68 : begin
            channel_gain_low1__decode = 1'b1;
            rif_read_data_l  = channel_gain_low1__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd69 : begin
            channel_gain_low2__decode = 1'b1;
            rif_read_data_l  = channel_gain_low2__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd70 : begin
            channel_gain_low3__decode = 1'b1;
            rif_read_data_l  = channel_gain_low3__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd71 : begin
            channel_gain_low4__decode = 1'b1;
            rif_read_data_l  = channel_gain_low4__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd72 : begin
            channel_gain_low5__decode = 1'b1;
            rif_read_data_l  = channel_gain_low5__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd73 : begin
            channel_gain_low6__decode = 1'b1;
            rif_read_data_l  = channel_gain_low6__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd74 : begin
            channel_gain_low7__decode = 1'b1;
            rif_read_data_l  = channel_gain_low7__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd75 : begin
            rif_read_data_l  = channel_status0__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = !if_rif.rd_wrn;
         end
         7'd76 : begin
            rif_read_data_l  = channel_status1__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = !if_rif.rd_wrn;
         end
         7'd77 : begin
            rif_read_data_l  = channel_status2__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = !if_rif.rd_wrn;
         end
         7'd78 : begin
            rif_read_data_l  = channel_status3__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = !if_rif.rd_wrn;
         end
         7'd79 : begin
            rif_read_data_l  = channel_status4__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = !if_rif.rd_wrn;
         end
         7'd80 : begin
            rif_read_data_l  = channel_status5__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = !if_rif.rd_wrn;
         end
         7'd81 : begin
            rif_read_data_l  = channel_status6__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = !if_rif.rd_wrn;
         end
         7'd82 : begin
            rif_read_data_l  = channel_status7__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = !if_rif.rd_wrn;
         end
         7'd83 : begin
            rif_read_data_l  = channel_dsp_err0__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = !if_rif.rd_wrn;
         end
         7'd84 : begin
            rif_read_data_l  = channel_dsp_err1__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = !if_rif.rd_wrn;
         end
         7'd85 : begin
            rif_read_data_l  = channel_dsp_err2__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = !if_rif.rd_wrn;
         end
         7'd86 : begin
            rif_read_data_l  = channel_dsp_err3__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = !if_rif.rd_wrn;
         end
         7'd87 : begin
            channel_test_en__decode = 1'b1;
            rif_read_data_l  = channel_test_en__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd88 : begin
            rif_read_data_l  = general_err1__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = !if_rif.rd_wrn;
         end
         7'd89 : begin
            general_err1_en__decode = 1'b1;
            rif_read_data_l  = general_err1_en__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd90 : begin
            rif_read_data_l  = general_err2__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = !if_rif.rd_wrn;
         end
         7'd91 : begin
            general_err2_en__decode = 1'b1;
            rif_read_data_l  = general_err2_en__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd92 : begin
            rif_read_data_l  = error_status1__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = !if_rif.rd_wrn;
         end
         7'd93 : begin
            rif_read_data_l  = error_status2__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = !if_rif.rd_wrn;
         end
         7'd94 : begin
            rif_read_data_l  = error_status3__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = !if_rif.rd_wrn;
         end
         7'd95 : begin
            src_n_msb__decode = 1'b1;
            rif_read_data_l  = src_n_msb__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd96 : begin
            src_n_lsb__decode = 1'b1;
            rif_read_data_l  = src_n_lsb__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd97 : begin
            src_if_msb__decode = 1'b1;
            rif_read_data_l  = src_if_msb__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd98 : begin
            src_if_lsb__decode = 1'b1;
            rif_read_data_l  = src_if_lsb__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         7'd99 : begin
            src_load__decode = 1'b1;
            rif_read_data_l  = src_load__read_data;
            rif_err_addr_l   = 1'b0;
            rif_err_access_l = 1'b0;
         end
         default : begin
         end
      endcase
   end


//-----------------------------------------------------------------------------
// Registers
//-----------------------------------------------------------------------------

   // Register channel_cfg[0]
   assign channel_bias0__next = 
      channel_cfg0__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[3:0] :
      rif_channel.bias[0];
   assign channel_rx0__next = 
      channel_cfg0__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[4] :
      rif_channel.rx[0];
   assign channel_ref_mon0__next = 
      channel_cfg0__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[5] :
      rif_channel.ref_mon[0];
   assign channel_gain0__next = 
      channel_cfg0__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:6] :
      rif_channel.gain[0];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_cfg0
      if(!rst_rif_n) begin
         rif_channel.bias[0] <= 4'd0;
         rif_channel.rx[0] <= 1'b0;
         rif_channel.ref_mon[0] <= 1'b0;
         rif_channel.gain[0] <= 2'd0;
      end else begin
         rif_channel.bias[0] <= channel_bias0__next;
         rif_channel.rx[0] <= channel_rx0__next;
         rif_channel.ref_mon[0] <= channel_ref_mon0__next;
         rif_channel.gain[0] <= channel_gain0__next;
      end
   end

   assign channel_cfg0__read_data = {rif_channel.gain[0],rif_channel.ref_mon[0],rif_channel.rx[0],rif_channel.bias[0]};

   // Register channel_cfg[1]
   assign channel_bias1__next = 
      channel_cfg1__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[3:0] :
      rif_channel.bias[1];
   assign channel_rx1__next = 
      channel_cfg1__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[4] :
      rif_channel.rx[1];
   assign channel_ref_mon1__next = 
      channel_cfg1__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[5] :
      rif_channel.ref_mon[1];
   assign channel_gain1__next = 
      channel_cfg1__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:6] :
      rif_channel.gain[1];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_cfg1
      if(!rst_rif_n) begin
         rif_channel.bias[1] <= 4'd0;
         rif_channel.rx[1] <= 1'b0;
         rif_channel.ref_mon[1] <= 1'b0;
         rif_channel.gain[1] <= 2'd0;
      end else begin
         rif_channel.bias[1] <= channel_bias1__next;
         rif_channel.rx[1] <= channel_rx1__next;
         rif_channel.ref_mon[1] <= channel_ref_mon1__next;
         rif_channel.gain[1] <= channel_gain1__next;
      end
   end

   assign channel_cfg1__read_data = {rif_channel.gain[1],rif_channel.ref_mon[1],rif_channel.rx[1],rif_channel.bias[1]};

   // Register channel_cfg[2]
   assign channel_bias2__next = 
      channel_cfg2__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[3:0] :
      rif_channel.bias[2];
   assign channel_rx2__next = 
      channel_cfg2__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[4] :
      rif_channel.rx[2];
   assign channel_ref_mon2__next = 
      channel_cfg2__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[5] :
      rif_channel.ref_mon[2];
   assign channel_gain2__next = 
      channel_cfg2__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:6] :
      rif_channel.gain[2];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_cfg2
      if(!rst_rif_n) begin
         rif_channel.bias[2] <= 4'd0;
         rif_channel.rx[2] <= 1'b0;
         rif_channel.ref_mon[2] <= 1'b0;
         rif_channel.gain[2] <= 2'd0;
      end else begin
         rif_channel.bias[2] <= channel_bias2__next;
         rif_channel.rx[2] <= channel_rx2__next;
         rif_channel.ref_mon[2] <= channel_ref_mon2__next;
         rif_channel.gain[2] <= channel_gain2__next;
      end
   end

   assign channel_cfg2__read_data = {rif_channel.gain[2],rif_channel.ref_mon[2],rif_channel.rx[2],rif_channel.bias[2]};

   // Register channel_cfg[3]
   assign channel_bias3__next = 
      channel_cfg3__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[3:0] :
      rif_channel.bias[3];
   assign channel_rx3__next = 
      channel_cfg3__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[4] :
      rif_channel.rx[3];
   assign channel_ref_mon3__next = 
      channel_cfg3__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[5] :
      rif_channel.ref_mon[3];
   assign channel_gain3__next = 
      channel_cfg3__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:6] :
      rif_channel.gain[3];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_cfg3
      if(!rst_rif_n) begin
         rif_channel.bias[3] <= 4'd0;
         rif_channel.rx[3] <= 1'b0;
         rif_channel.ref_mon[3] <= 1'b0;
         rif_channel.gain[3] <= 2'd0;
      end else begin
         rif_channel.bias[3] <= channel_bias3__next;
         rif_channel.rx[3] <= channel_rx3__next;
         rif_channel.ref_mon[3] <= channel_ref_mon3__next;
         rif_channel.gain[3] <= channel_gain3__next;
      end
   end

   assign channel_cfg3__read_data = {rif_channel.gain[3],rif_channel.ref_mon[3],rif_channel.rx[3],rif_channel.bias[3]};

   // Register channel_cfg[4]
   assign channel_bias4__next = 
      channel_cfg4__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[3:0] :
      rif_channel.bias[4];
   assign channel_rx4__next = 
      channel_cfg4__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[4] :
      rif_channel.rx[4];
   assign channel_ref_mon4__next = 
      channel_cfg4__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[5] :
      rif_channel.ref_mon[4];
   assign channel_gain4__next = 
      channel_cfg4__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:6] :
      rif_channel.gain[4];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_cfg4
      if(!rst_rif_n) begin
         rif_channel.bias[4] <= 4'd0;
         rif_channel.rx[4] <= 1'b0;
         rif_channel.ref_mon[4] <= 1'b0;
         rif_channel.gain[4] <= 2'd0;
      end else begin
         rif_channel.bias[4] <= channel_bias4__next;
         rif_channel.rx[4] <= channel_rx4__next;
         rif_channel.ref_mon[4] <= channel_ref_mon4__next;
         rif_channel.gain[4] <= channel_gain4__next;
      end
   end

   assign channel_cfg4__read_data = {rif_channel.gain[4],rif_channel.ref_mon[4],rif_channel.rx[4],rif_channel.bias[4]};

   // Register channel_cfg[5]
   assign channel_bias5__next = 
      channel_cfg5__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[3:0] :
      rif_channel.bias[5];
   assign channel_rx5__next = 
      channel_cfg5__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[4] :
      rif_channel.rx[5];
   assign channel_ref_mon5__next = 
      channel_cfg5__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[5] :
      rif_channel.ref_mon[5];
   assign channel_gain5__next = 
      channel_cfg5__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:6] :
      rif_channel.gain[5];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_cfg5
      if(!rst_rif_n) begin
         rif_channel.bias[5] <= 4'd0;
         rif_channel.rx[5] <= 1'b0;
         rif_channel.ref_mon[5] <= 1'b0;
         rif_channel.gain[5] <= 2'd0;
      end else begin
         rif_channel.bias[5] <= channel_bias5__next;
         rif_channel.rx[5] <= channel_rx5__next;
         rif_channel.ref_mon[5] <= channel_ref_mon5__next;
         rif_channel.gain[5] <= channel_gain5__next;
      end
   end

   assign channel_cfg5__read_data = {rif_channel.gain[5],rif_channel.ref_mon[5],rif_channel.rx[5],rif_channel.bias[5]};

   // Register channel_cfg[6]
   assign channel_bias6__next = 
      channel_cfg6__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[3:0] :
      rif_channel.bias[6];
   assign channel_rx6__next = 
      channel_cfg6__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[4] :
      rif_channel.rx[6];
   assign channel_ref_mon6__next = 
      channel_cfg6__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[5] :
      rif_channel.ref_mon[6];
   assign channel_gain6__next = 
      channel_cfg6__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:6] :
      rif_channel.gain[6];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_cfg6
      if(!rst_rif_n) begin
         rif_channel.bias[6] <= 4'd0;
         rif_channel.rx[6] <= 1'b0;
         rif_channel.ref_mon[6] <= 1'b0;
         rif_channel.gain[6] <= 2'd0;
      end else begin
         rif_channel.bias[6] <= channel_bias6__next;
         rif_channel.rx[6] <= channel_rx6__next;
         rif_channel.ref_mon[6] <= channel_ref_mon6__next;
         rif_channel.gain[6] <= channel_gain6__next;
      end
   end

   assign channel_cfg6__read_data = {rif_channel.gain[6],rif_channel.ref_mon[6],rif_channel.rx[6],rif_channel.bias[6]};

   // Register channel_cfg[7]
   assign channel_bias7__next = 
      channel_cfg7__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[3:0] :
      rif_channel.bias[7];
   assign channel_rx7__next = 
      channel_cfg7__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[4] :
      rif_channel.rx[7];
   assign channel_ref_mon7__next = 
      channel_cfg7__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[5] :
      rif_channel.ref_mon[7];
   assign channel_gain7__next = 
      channel_cfg7__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:6] :
      rif_channel.gain[7];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_cfg7
      if(!rst_rif_n) begin
         rif_channel.bias[7] <= 4'd0;
         rif_channel.rx[7] <= 1'b0;
         rif_channel.ref_mon[7] <= 1'b0;
         rif_channel.gain[7] <= 2'd0;
      end else begin
         rif_channel.bias[7] <= channel_bias7__next;
         rif_channel.rx[7] <= channel_rx7__next;
         rif_channel.ref_mon[7] <= channel_ref_mon7__next;
         rif_channel.gain[7] <= channel_gain7__next;
      end
   end

   assign channel_cfg7__read_data = {rif_channel.gain[7],rif_channel.ref_mon[7],rif_channel.rx[7],rif_channel.bias[7]};

   // Register clock_disable
   assign channel_disable_ch0__next = 
      clock_disable__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[0] :
      rif_channel.disable_ch[0];
   assign channel_disable_ch1__next = 
      clock_disable__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[1] :
      rif_channel.disable_ch[1];
   assign channel_disable_ch2__next = 
      clock_disable__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[2] :
      rif_channel.disable_ch[2];
   assign channel_disable_ch3__next = 
      clock_disable__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[3] :
      rif_channel.disable_ch[3];
   assign channel_disable_ch4__next = 
      clock_disable__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[4] :
      rif_channel.disable_ch[4];
   assign channel_disable_ch5__next = 
      clock_disable__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[5] :
      rif_channel.disable_ch[5];
   assign channel_disable_ch6__next = 
      clock_disable__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[6] :
      rif_channel.disable_ch[6];
   assign channel_disable_ch7__next = 
      clock_disable__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7] :
      rif_channel.disable_ch[7];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_clock_disable
      if(!rst_rif_n) begin
         rif_channel.disable_ch[0] <= 1'b0;
         rif_channel.disable_ch[1] <= 1'b0;
         rif_channel.disable_ch[2] <= 1'b0;
         rif_channel.disable_ch[3] <= 1'b0;
         rif_channel.disable_ch[4] <= 1'b0;
         rif_channel.disable_ch[5] <= 1'b0;
         rif_channel.disable_ch[6] <= 1'b0;
         rif_channel.disable_ch[7] <= 1'b0;
      end else begin
         rif_channel.disable_ch[0] <= channel_disable_ch0__next;
         rif_channel.disable_ch[1] <= channel_disable_ch1__next;
         rif_channel.disable_ch[2] <= channel_disable_ch2__next;
         rif_channel.disable_ch[3] <= channel_disable_ch3__next;
         rif_channel.disable_ch[4] <= channel_disable_ch4__next;
         rif_channel.disable_ch[5] <= channel_disable_ch5__next;
         rif_channel.disable_ch[6] <= channel_disable_ch6__next;
         rif_channel.disable_ch[7] <= channel_disable_ch7__next;
      end
   end

   assign clock_disable__read_data = {rif_channel.disable_ch[7],rif_channel.disable_ch[6],rif_channel.disable_ch[5],rif_channel.disable_ch[4],rif_channel.disable_ch[3],rif_channel.disable_ch[2],rif_channel.disable_ch[1],rif_channel.disable_ch[0]};

   // Register channel_sync_offset[0]
   assign channel_sync_offset0__next = 
      channel_sync_offset0__decode && if_rif.en && !if_rif.rd_wrn ? $signed(if_rif.wr_data[7:0]) :
      rif_channel.sync_offset[0];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_sync_offset0
      if(!rst_rif_n) begin
         rif_channel.sync_offset[0] <= 8'sd0;
      end else begin
         rif_channel.sync_offset[0] <= channel_sync_offset0__next;
      end
   end

   assign channel_sync_offset0__read_data = $unsigned(rif_channel.sync_offset[0]);

   // Register channel_sync_offset[1]
   assign channel_sync_offset1__next = 
      channel_sync_offset1__decode && if_rif.en && !if_rif.rd_wrn ? $signed(if_rif.wr_data[7:0]) :
      rif_channel.sync_offset[1];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_sync_offset1
      if(!rst_rif_n) begin
         rif_channel.sync_offset[1] <= 8'sd0;
      end else begin
         rif_channel.sync_offset[1] <= channel_sync_offset1__next;
      end
   end

   assign channel_sync_offset1__read_data = $unsigned(rif_channel.sync_offset[1]);

   // Register channel_sync_offset[2]
   assign channel_sync_offset2__next = 
      channel_sync_offset2__decode && if_rif.en && !if_rif.rd_wrn ? $signed(if_rif.wr_data[7:0]) :
      rif_channel.sync_offset[2];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_sync_offset2
      if(!rst_rif_n) begin
         rif_channel.sync_offset[2] <= 8'sd0;
      end else begin
         rif_channel.sync_offset[2] <= channel_sync_offset2__next;
      end
   end

   assign channel_sync_offset2__read_data = $unsigned(rif_channel.sync_offset[2]);

   // Register channel_sync_offset[3]
   assign channel_sync_offset3__next = 
      channel_sync_offset3__decode && if_rif.en && !if_rif.rd_wrn ? $signed(if_rif.wr_data[7:0]) :
      rif_channel.sync_offset[3];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_sync_offset3
      if(!rst_rif_n) begin
         rif_channel.sync_offset[3] <= 8'sd0;
      end else begin
         rif_channel.sync_offset[3] <= channel_sync_offset3__next;
      end
   end

   assign channel_sync_offset3__read_data = $unsigned(rif_channel.sync_offset[3]);

   // Register channel_sync_offset[4]
   assign channel_sync_offset4__next = 
      channel_sync_offset4__decode && if_rif.en && !if_rif.rd_wrn ? $signed(if_rif.wr_data[7:0]) :
      rif_channel.sync_offset[4];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_sync_offset4
      if(!rst_rif_n) begin
         rif_channel.sync_offset[4] <= 8'sd0;
      end else begin
         rif_channel.sync_offset[4] <= channel_sync_offset4__next;
      end
   end

   assign channel_sync_offset4__read_data = $unsigned(rif_channel.sync_offset[4]);

   // Register channel_sync_offset[5]
   assign channel_sync_offset5__next = 
      channel_sync_offset5__decode && if_rif.en && !if_rif.rd_wrn ? $signed(if_rif.wr_data[7:0]) :
      rif_channel.sync_offset[5];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_sync_offset5
      if(!rst_rif_n) begin
         rif_channel.sync_offset[5] <= 8'sd0;
      end else begin
         rif_channel.sync_offset[5] <= channel_sync_offset5__next;
      end
   end

   assign channel_sync_offset5__read_data = $unsigned(rif_channel.sync_offset[5]);

   // Register channel_sync_offset[6]
   assign channel_sync_offset6__next = 
      channel_sync_offset6__decode && if_rif.en && !if_rif.rd_wrn ? $signed(if_rif.wr_data[7:0]) :
      rif_channel.sync_offset[6];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_sync_offset6
      if(!rst_rif_n) begin
         rif_channel.sync_offset[6] <= 8'sd0;
      end else begin
         rif_channel.sync_offset[6] <= channel_sync_offset6__next;
      end
   end

   assign channel_sync_offset6__read_data = $unsigned(rif_channel.sync_offset[6]);

   // Register channel_sync_offset[7]
   assign channel_sync_offset7__next = 
      channel_sync_offset7__decode && if_rif.en && !if_rif.rd_wrn ? $signed(if_rif.wr_data[7:0]) :
      rif_channel.sync_offset[7];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_sync_offset7
      if(!rst_rif_n) begin
         rif_channel.sync_offset[7] <= 8'sd0;
      end else begin
         rif_channel.sync_offset[7] <= channel_sync_offset7__next;
      end
   end

   assign channel_sync_offset7__read_data = $unsigned(rif_channel.sync_offset[7]);

   // Register user_cfg1
   assign user_cfg_soft_reset__next = 
      user_cfg1__decode && if_rif.en && !if_rif.rd_wrn ? ad7771_rif_pkg::e_soft_reset'(if_rif.wr_data[1:0]) :
      rif_user_cfg.soft_reset;
   assign user_cfg_pdb_rc_osc__next = 
      user_cfg1__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[2] :
      rif_user_cfg.pdb_rc_osc;
   assign user_cfg_pdb_sar__next = 
      user_cfg1__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[3] :
      rif_user_cfg.pdb_sar;
   assign user_cfg_pdb_refout__next = 
      user_cfg1__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[4] :
      rif_user_cfg.pdb_refout;
   assign user_cfg_pdb_vcm__next = 
      user_cfg1__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[5] :
      rif_user_cfg.pdb_vcm;
   assign user_cfg_power_mode__next = 
      user_cfg1__decode && if_rif.en && !if_rif.rd_wrn ? ad7771_rif_pkg::e_power_mode'(if_rif.wr_data[6]) :
      rif_user_cfg.power_mode;
   assign user_cfg_all_ch_dis_mclk__next = 
      user_cfg1__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7] :
      rif_user_cfg.all_ch_dis_mclk;

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_user_cfg1
      if(!rst_rif_n) begin
         rif_user_cfg.soft_reset <= ad7771_rif_pkg::e_soft_reset'(2'd0);
         rif_user_cfg.pdb_rc_osc <= 1'b1;
         rif_user_cfg.pdb_sar <= 1'b0;
         rif_user_cfg.pdb_refout <= 1'b0;
         rif_user_cfg.pdb_vcm <= 1'b1;
         rif_user_cfg.power_mode <= ad7771_rif_pkg::e_power_mode'(1'b0);
         rif_user_cfg.all_ch_dis_mclk <= 1'b0;
      end else begin
         rif_user_cfg.soft_reset <= user_cfg_soft_reset__next;
         rif_user_cfg.pdb_rc_osc <= user_cfg_pdb_rc_osc__next;
         rif_user_cfg.pdb_sar <= user_cfg_pdb_sar__next;
         rif_user_cfg.pdb_refout <= user_cfg_pdb_refout__next;
         rif_user_cfg.pdb_vcm <= user_cfg_pdb_vcm__next;
         rif_user_cfg.power_mode <= user_cfg_power_mode__next;
         rif_user_cfg.all_ch_dis_mclk <= user_cfg_all_ch_dis_mclk__next;
      end
   end

   assign user_cfg1__read_data = {rif_user_cfg.all_ch_dis_mclk,1'(rif_user_cfg.power_mode),rif_user_cfg.pdb_vcm,rif_user_cfg.pdb_refout,rif_user_cfg.pdb_sar,rif_user_cfg.pdb_rc_osc,2'(rif_user_cfg.soft_reset)};

   // Register user_cfg2
   assign user_cfg_spi_sync__next = 
      user_cfg2__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[0] :
      rif_user_cfg.spi_sync;
   assign user_cfg_dout_drive_str__next = 
      user_cfg2__decode && if_rif.en && !if_rif.rd_wrn ? ad7771_rif_pkg::e_drive_str'(if_rif.wr_data[2:1]) :
      rif_user_cfg.dout_drive_str;
   assign user_cfg_sdo_drive_str__next = 
      user_cfg2__decode && if_rif.en && !if_rif.rd_wrn ? ad7771_rif_pkg::e_drive_str'(if_rif.wr_data[4:3]) :
      rif_user_cfg.sdo_drive_str;
   assign user_cfg_sar_diag_en__next = 
      user_cfg2__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[5] :
      rif_user_cfg.sar_diag_en;
   assign user_cfg_filter_mode__next = 
      user_cfg2__decode && if_rif.en && !if_rif.rd_wrn ? ad7771_rif_pkg::e_filter_mode'(if_rif.wr_data[6]) :
      rif_user_cfg.filter_mode;

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_user_cfg2
      if(!rst_rif_n) begin
         rif_user_cfg.spi_sync <= 1'b0;
         rif_user_cfg.dout_drive_str <= ad7771_rif_pkg::e_drive_str'(2'd0);
         rif_user_cfg.sdo_drive_str <= ad7771_rif_pkg::e_drive_str'(2'd1);
         rif_user_cfg.sar_diag_en <= 1'b0;
         rif_user_cfg.filter_mode <= ad7771_rif_pkg::e_filter_mode'(1'b0);
      end else begin
         rif_user_cfg.spi_sync <= user_cfg_spi_sync__next;
         rif_user_cfg.dout_drive_str <= user_cfg_dout_drive_str__next;
         rif_user_cfg.sdo_drive_str <= user_cfg_sdo_drive_str__next;
         rif_user_cfg.sar_diag_en <= user_cfg_sar_diag_en__next;
         rif_user_cfg.filter_mode <= user_cfg_filter_mode__next;
      end
   end

   assign user_cfg2__read_data = {1'b0,1'(rif_user_cfg.filter_mode),rif_user_cfg.sar_diag_en,2'(rif_user_cfg.sdo_drive_str),2'(rif_user_cfg.dout_drive_str),rif_user_cfg.spi_sync};

   // Register user_cfg3
   assign user_cfg_clk_qual_dis__next = 
      user_cfg3__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[0] :
      rif_user_cfg.clk_qual_dis;
   assign user_cfg_spi_subordinate__next = 
      user_cfg3__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[4] :
      rif_user_cfg.spi_subordinate;
   assign user_cfg_convst_deglitch_dis__next = 
      user_cfg3__decode && if_rif.en && !if_rif.rd_wrn ? ad7771_rif_pkg::e_deglitch'(if_rif.wr_data[7:6]) :
      rif_user_cfg.convst_deglitch_dis;

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_user_cfg3
      if(!rst_rif_n) begin
         rif_user_cfg.clk_qual_dis <= 1'b0;
         rif_user_cfg.spi_subordinate <= 1'b0;
         rif_user_cfg.convst_deglitch_dis <= ad7771_rif_pkg::e_deglitch'(2'd2);
      end else begin
         rif_user_cfg.clk_qual_dis <= user_cfg_clk_qual_dis__next;
         rif_user_cfg.spi_subordinate <= user_cfg_spi_subordinate__next;
         rif_user_cfg.convst_deglitch_dis <= user_cfg_convst_deglitch_dis__next;
      end
   end

   assign user_cfg3__read_data = {2'(rif_user_cfg.convst_deglitch_dis),1'b0,rif_user_cfg.spi_subordinate,3'd0,rif_user_cfg.clk_qual_dis};

   // Register data_output
   assign data_output_dclk_div__next = 
      data_output__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[3:1] :
      rif_data_output.dclk_div;
   assign data_output_header_format__next = 
      data_output__decode && if_rif.en && !if_rif.rd_wrn ? ad7771_rif_pkg::e_header_format'(if_rif.wr_data[5]) :
      rif_data_output.header_format;
   assign data_output_data_format__next = 
      data_output__decode && if_rif.en && !if_rif.rd_wrn ? ad7771_rif_pkg::e_data_format'(if_rif.wr_data[7:6]) :
      rif_data_output.data_format;

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_data_output
      if(!rst_rif_n) begin
         rif_data_output.dclk_div <= 3'd0;
         rif_data_output.header_format <= ad7771_rif_pkg::e_header_format'(1'b0);
         rif_data_output.data_format <= ad7771_rif_pkg::e_data_format'(2'd0);
      end else begin
         rif_data_output.dclk_div <= data_output_dclk_div__next;
         rif_data_output.header_format <= data_output_header_format__next;
         rif_data_output.data_format <= data_output_data_format__next;
      end
   end

   assign data_output__read_data = {2'(rif_data_output.data_format),1'(rif_data_output.header_format),1'b0,rif_data_output.dclk_div,1'b0};

   // Register mux_ctrl_ref_mtr
   assign mux_ctrl_mtr__next = 
      mux_ctrl_ref_mtr__decode && if_rif.en && !if_rif.rd_wrn ? ad7771_rif_pkg::e_mtr_mux'(if_rif.wr_data[5:2]) :
      rif_mux_ctrl.mtr;
   assign mux_ctrl_ref__next = 
      mux_ctrl_ref_mtr__decode && if_rif.en && !if_rif.rd_wrn ? ad7771_rif_pkg::e_ref_mux'(if_rif.wr_data[7:6]) :
      rif_mux_ctrl.ref;

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_mux_ctrl_ref_mtr
      if(!rst_rif_n) begin
         rif_mux_ctrl.mtr <= ad7771_rif_pkg::e_mtr_mux'(4'd0);
         rif_mux_ctrl.ref <= ad7771_rif_pkg::e_ref_mux'(2'd0);
      end else begin
         rif_mux_ctrl.mtr <= mux_ctrl_mtr__next;
         rif_mux_ctrl.ref <= mux_ctrl_ref__next;
      end
   end

   assign mux_ctrl_ref_mtr__read_data = {2'(rif_mux_ctrl.ref),4'(rif_mux_ctrl.mtr),2'd0};

   // Register mux_ctrl_global
   assign mux_ctrl_global__next = 
      mux_ctrl_global__decode && if_rif.en && !if_rif.rd_wrn ? ad7771_rif_pkg::e_glob_mux'(if_rif.wr_data[7:3]) :
      rif_mux_ctrl.global;

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_mux_ctrl_global
      if(!rst_rif_n) begin
         rif_mux_ctrl.global <= ad7771_rif_pkg::e_glob_mux'(5'd0);
      end else begin
         rif_mux_ctrl.global <= mux_ctrl_global__next;
      end
   end

   assign mux_ctrl_global__read_data = {5'(rif_mux_ctrl.global),3'd0};

   // Register gpio_cfg
   assign gpio_cfg_op_en__next = 
      gpio_cfg__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[2:0] :
      rif_gpio_cfg.op_en;

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_gpio_cfg
      if(!rst_rif_n) begin
         rif_gpio_cfg.op_en <= 3'd0;
      end else begin
         rif_gpio_cfg.op_en <= gpio_cfg_op_en__next;
      end
   end

   assign gpio_cfg__read_data = {5'd0,rif_gpio_cfg.op_en};

   // Register gpio_data
   assign gpio_data_write__next = 
      gpio_data__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[2:0] :
      rif_gpio_data.write;

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_gpio_data
      if(!rst_rif_n) begin
         rif_gpio_data.write <= 3'd0;
      end else begin
         rif_gpio_data.write <= gpio_data_write__next;
      end
   end

   assign gpio_data__read_data = {2'd0,gpio_data.read,rif_gpio_data.write};

   // Register buffer_cfg1
   assign buffer_cfg_ref_buf_neg_en__next = 
      buffer_cfg1__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[3] :
      rif_buffer_cfg.ref_buf_neg_en;
   assign buffer_cfg_ref_buf_pos_en__next = 
      buffer_cfg1__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[4] :
      rif_buffer_cfg.ref_buf_pos_en;

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_buffer_cfg1
      if(!rst_rif_n) begin
         rif_buffer_cfg.ref_buf_neg_en <= 1'b1;
         rif_buffer_cfg.ref_buf_pos_en <= 1'b1;
      end else begin
         rif_buffer_cfg.ref_buf_neg_en <= buffer_cfg_ref_buf_neg_en__next;
         rif_buffer_cfg.ref_buf_pos_en <= buffer_cfg_ref_buf_pos_en__next;
      end
   end

   assign buffer_cfg1__read_data = {3'd0,rif_buffer_cfg.ref_buf_pos_en,rif_buffer_cfg.ref_buf_neg_en,3'd0};

   // Register buffer_cfg2
   assign buffer_cfg_pdb_dldo_ovrdrv__next = 
      buffer_cfg2__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[0] :
      rif_buffer_cfg.pdb_dldo_ovrdrv;
   assign buffer_cfg_pdb_aldo2_ovrdrv__next = 
      buffer_cfg2__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[1] :
      rif_buffer_cfg.pdb_aldo2_ovrdrv;
   assign buffer_cfg_pdb_aldo1_ovrdrv__next = 
      buffer_cfg2__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[2] :
      rif_buffer_cfg.pdb_aldo1_ovrdrv;
   assign buffer_cfg_ref_buf_neg_preq__next = 
      buffer_cfg2__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[6] :
      rif_buffer_cfg.ref_buf_neg_preq;
   assign buffer_cfg_ref_buf_pos_preq__next = 
      buffer_cfg2__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7] :
      rif_buffer_cfg.ref_buf_pos_preq;

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_buffer_cfg2
      if(!rst_rif_n) begin
         rif_buffer_cfg.pdb_dldo_ovrdrv <= 1'b1;
         rif_buffer_cfg.pdb_aldo2_ovrdrv <= 1'b1;
         rif_buffer_cfg.pdb_aldo1_ovrdrv <= 1'b1;
         rif_buffer_cfg.ref_buf_neg_preq <= 1'b1;
         rif_buffer_cfg.ref_buf_pos_preq <= 1'b1;
      end else begin
         rif_buffer_cfg.pdb_dldo_ovrdrv <= buffer_cfg_pdb_dldo_ovrdrv__next;
         rif_buffer_cfg.pdb_aldo2_ovrdrv <= buffer_cfg_pdb_aldo2_ovrdrv__next;
         rif_buffer_cfg.pdb_aldo1_ovrdrv <= buffer_cfg_pdb_aldo1_ovrdrv__next;
         rif_buffer_cfg.ref_buf_neg_preq <= buffer_cfg_ref_buf_neg_preq__next;
         rif_buffer_cfg.ref_buf_pos_preq <= buffer_cfg_ref_buf_pos_preq__next;
      end
   end

   assign buffer_cfg2__read_data = {rif_buffer_cfg.ref_buf_pos_preq,rif_buffer_cfg.ref_buf_neg_preq,3'd0,rif_buffer_cfg.pdb_aldo1_ovrdrv,rif_buffer_cfg.pdb_aldo2_ovrdrv,rif_buffer_cfg.pdb_dldo_ovrdrv};

   // Register channel_offset_up[0]
   assign channel_offset0__next[23:16] = 
      channel_offset_up0__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.offset[23:16];
   assign channel_offset_up0__read_data = $unsigned(rif_channel.offset[23:16]);

   // Register channel_offset_up[1]
   assign channel_offset1__next[23:16] = 
      channel_offset_up1__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.offset[23:16];
   assign channel_offset_up1__read_data = $unsigned(rif_channel.offset[23:16]);

   // Register channel_offset_up[2]
   assign channel_offset2__next[23:16] = 
      channel_offset_up2__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.offset[23:16];
   assign channel_offset_up2__read_data = $unsigned(rif_channel.offset[23:16]);

   // Register channel_offset_up[3]
   assign channel_offset3__next[23:16] = 
      channel_offset_up3__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.offset[23:16];
   assign channel_offset_up3__read_data = $unsigned(rif_channel.offset[23:16]);

   // Register channel_offset_up[4]
   assign channel_offset4__next[23:16] = 
      channel_offset_up4__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.offset[23:16];
   assign channel_offset_up4__read_data = $unsigned(rif_channel.offset[23:16]);

   // Register channel_offset_up[5]
   assign channel_offset5__next[23:16] = 
      channel_offset_up5__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.offset[23:16];
   assign channel_offset_up5__read_data = $unsigned(rif_channel.offset[23:16]);

   // Register channel_offset_up[6]
   assign channel_offset6__next[23:16] = 
      channel_offset_up6__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.offset[23:16];
   assign channel_offset_up6__read_data = $unsigned(rif_channel.offset[23:16]);

   // Register channel_offset_up[7]
   assign channel_offset7__next[23:16] = 
      channel_offset_up7__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.offset[23:16];
   assign channel_offset_up7__read_data = $unsigned(rif_channel.offset[23:16]);

   // Register channel_offset_mid[0]
   assign channel_offset0__next[15:8] = 
      channel_offset_mid0__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.offset[15:8];
   assign channel_offset_mid0__read_data = $unsigned(rif_channel.offset[15:8]);

   // Register channel_offset_mid[1]
   assign channel_offset1__next[15:8] = 
      channel_offset_mid1__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.offset[15:8];
   assign channel_offset_mid1__read_data = $unsigned(rif_channel.offset[15:8]);

   // Register channel_offset_mid[2]
   assign channel_offset2__next[15:8] = 
      channel_offset_mid2__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.offset[15:8];
   assign channel_offset_mid2__read_data = $unsigned(rif_channel.offset[15:8]);

   // Register channel_offset_mid[3]
   assign channel_offset3__next[15:8] = 
      channel_offset_mid3__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.offset[15:8];
   assign channel_offset_mid3__read_data = $unsigned(rif_channel.offset[15:8]);

   // Register channel_offset_mid[4]
   assign channel_offset4__next[15:8] = 
      channel_offset_mid4__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.offset[15:8];
   assign channel_offset_mid4__read_data = $unsigned(rif_channel.offset[15:8]);

   // Register channel_offset_mid[5]
   assign channel_offset5__next[15:8] = 
      channel_offset_mid5__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.offset[15:8];
   assign channel_offset_mid5__read_data = $unsigned(rif_channel.offset[15:8]);

   // Register channel_offset_mid[6]
   assign channel_offset6__next[15:8] = 
      channel_offset_mid6__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.offset[15:8];
   assign channel_offset_mid6__read_data = $unsigned(rif_channel.offset[15:8]);

   // Register channel_offset_mid[7]
   assign channel_offset7__next[15:8] = 
      channel_offset_mid7__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.offset[15:8];
   assign channel_offset_mid7__read_data = $unsigned(rif_channel.offset[15:8]);

   // Register channel_offset_low[0]
   assign channel_offset0__next[7:0] = 
      channel_offset_low0__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.offset[7:0];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_offset_low0
      if(!rst_rif_n) begin
         rif_channel.offset[0] <= 24'sh000000;
      end else begin
         rif_channel.offset[0] <= channel_offset0__next;
      end
   end

   assign channel_offset_low0__read_data = $unsigned(rif_channel.offset[7:0]);

   // Register channel_offset_low[1]
   assign channel_offset1__next[7:0] = 
      channel_offset_low1__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.offset[7:0];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_offset_low1
      if(!rst_rif_n) begin
         rif_channel.offset[1] <= 24'sh000000;
      end else begin
         rif_channel.offset[1] <= channel_offset1__next;
      end
   end

   assign channel_offset_low1__read_data = $unsigned(rif_channel.offset[7:0]);

   // Register channel_offset_low[2]
   assign channel_offset2__next[7:0] = 
      channel_offset_low2__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.offset[7:0];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_offset_low2
      if(!rst_rif_n) begin
         rif_channel.offset[2] <= 24'sh000000;
      end else begin
         rif_channel.offset[2] <= channel_offset2__next;
      end
   end

   assign channel_offset_low2__read_data = $unsigned(rif_channel.offset[7:0]);

   // Register channel_offset_low[3]
   assign channel_offset3__next[7:0] = 
      channel_offset_low3__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.offset[7:0];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_offset_low3
      if(!rst_rif_n) begin
         rif_channel.offset[3] <= 24'sh000000;
      end else begin
         rif_channel.offset[3] <= channel_offset3__next;
      end
   end

   assign channel_offset_low3__read_data = $unsigned(rif_channel.offset[7:0]);

   // Register channel_offset_low[4]
   assign channel_offset4__next[7:0] = 
      channel_offset_low4__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.offset[7:0];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_offset_low4
      if(!rst_rif_n) begin
         rif_channel.offset[4] <= 24'sh000000;
      end else begin
         rif_channel.offset[4] <= channel_offset4__next;
      end
   end

   assign channel_offset_low4__read_data = $unsigned(rif_channel.offset[7:0]);

   // Register channel_offset_low[5]
   assign channel_offset5__next[7:0] = 
      channel_offset_low5__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.offset[7:0];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_offset_low5
      if(!rst_rif_n) begin
         rif_channel.offset[5] <= 24'sh000000;
      end else begin
         rif_channel.offset[5] <= channel_offset5__next;
      end
   end

   assign channel_offset_low5__read_data = $unsigned(rif_channel.offset[7:0]);

   // Register channel_offset_low[6]
   assign channel_offset6__next[7:0] = 
      channel_offset_low6__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.offset[7:0];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_offset_low6
      if(!rst_rif_n) begin
         rif_channel.offset[6] <= 24'sh000000;
      end else begin
         rif_channel.offset[6] <= channel_offset6__next;
      end
   end

   assign channel_offset_low6__read_data = $unsigned(rif_channel.offset[7:0]);

   // Register channel_offset_low[7]
   assign channel_offset7__next[7:0] = 
      channel_offset_low7__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.offset[7:0];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_offset_low7
      if(!rst_rif_n) begin
         rif_channel.offset[7] <= 24'sh000000;
      end else begin
         rif_channel.offset[7] <= channel_offset7__next;
      end
   end

   assign channel_offset_low7__read_data = $unsigned(rif_channel.offset[7:0]);

   // Register channel_gain_up[0]
   assign channel_gain0__next[23:16] = 
      channel_gain_up0__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.gain[23:16];
   assign channel_gain_up0__read_data = rif_channel.gain[23:16];

   // Register channel_gain_up[1]
   assign channel_gain1__next[23:16] = 
      channel_gain_up1__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.gain[23:16];
   assign channel_gain_up1__read_data = rif_channel.gain[23:16];

   // Register channel_gain_up[2]
   assign channel_gain2__next[23:16] = 
      channel_gain_up2__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.gain[23:16];
   assign channel_gain_up2__read_data = rif_channel.gain[23:16];

   // Register channel_gain_up[3]
   assign channel_gain3__next[23:16] = 
      channel_gain_up3__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.gain[23:16];
   assign channel_gain_up3__read_data = rif_channel.gain[23:16];

   // Register channel_gain_up[4]
   assign channel_gain4__next[23:16] = 
      channel_gain_up4__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.gain[23:16];
   assign channel_gain_up4__read_data = rif_channel.gain[23:16];

   // Register channel_gain_up[5]
   assign channel_gain5__next[23:16] = 
      channel_gain_up5__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.gain[23:16];
   assign channel_gain_up5__read_data = rif_channel.gain[23:16];

   // Register channel_gain_up[6]
   assign channel_gain6__next[23:16] = 
      channel_gain_up6__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.gain[23:16];
   assign channel_gain_up6__read_data = rif_channel.gain[23:16];

   // Register channel_gain_up[7]
   assign channel_gain7__next[23:16] = 
      channel_gain_up7__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.gain[23:16];
   assign channel_gain_up7__read_data = rif_channel.gain[23:16];

   // Register channel_gain_mid[0]
   assign channel_gain0__next[15:8] = 
      channel_gain_mid0__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.gain[15:8];
   assign channel_gain_mid0__read_data = rif_channel.gain[15:8];

   // Register channel_gain_mid[1]
   assign channel_gain1__next[15:8] = 
      channel_gain_mid1__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.gain[15:8];
   assign channel_gain_mid1__read_data = rif_channel.gain[15:8];

   // Register channel_gain_mid[2]
   assign channel_gain2__next[15:8] = 
      channel_gain_mid2__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.gain[15:8];
   assign channel_gain_mid2__read_data = rif_channel.gain[15:8];

   // Register channel_gain_mid[3]
   assign channel_gain3__next[15:8] = 
      channel_gain_mid3__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.gain[15:8];
   assign channel_gain_mid3__read_data = rif_channel.gain[15:8];

   // Register channel_gain_mid[4]
   assign channel_gain4__next[15:8] = 
      channel_gain_mid4__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.gain[15:8];
   assign channel_gain_mid4__read_data = rif_channel.gain[15:8];

   // Register channel_gain_mid[5]
   assign channel_gain5__next[15:8] = 
      channel_gain_mid5__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.gain[15:8];
   assign channel_gain_mid5__read_data = rif_channel.gain[15:8];

   // Register channel_gain_mid[6]
   assign channel_gain6__next[15:8] = 
      channel_gain_mid6__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.gain[15:8];
   assign channel_gain_mid6__read_data = rif_channel.gain[15:8];

   // Register channel_gain_mid[7]
   assign channel_gain7__next[15:8] = 
      channel_gain_mid7__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.gain[15:8];
   assign channel_gain_mid7__read_data = rif_channel.gain[15:8];

   // Register channel_gain_low[0]
   assign channel_gain0__next[7:0] = 
      channel_gain_low0__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.gain[7:0];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_gain_low0
      if(!rst_rif_n) begin
         rif_channel.gain[0] <= 2'd0;
      end else begin
         rif_channel.gain[0] <= channel_gain0__next;
      end
   end

   assign channel_gain_low0__read_data = rif_channel.gain[7:0];

   // Register channel_gain_low[1]
   assign channel_gain1__next[7:0] = 
      channel_gain_low1__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.gain[7:0];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_gain_low1
      if(!rst_rif_n) begin
         rif_channel.gain[1] <= 2'd0;
      end else begin
         rif_channel.gain[1] <= channel_gain1__next;
      end
   end

   assign channel_gain_low1__read_data = rif_channel.gain[7:0];

   // Register channel_gain_low[2]
   assign channel_gain2__next[7:0] = 
      channel_gain_low2__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.gain[7:0];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_gain_low2
      if(!rst_rif_n) begin
         rif_channel.gain[2] <= 2'd0;
      end else begin
         rif_channel.gain[2] <= channel_gain2__next;
      end
   end

   assign channel_gain_low2__read_data = rif_channel.gain[7:0];

   // Register channel_gain_low[3]
   assign channel_gain3__next[7:0] = 
      channel_gain_low3__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.gain[7:0];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_gain_low3
      if(!rst_rif_n) begin
         rif_channel.gain[3] <= 2'd0;
      end else begin
         rif_channel.gain[3] <= channel_gain3__next;
      end
   end

   assign channel_gain_low3__read_data = rif_channel.gain[7:0];

   // Register channel_gain_low[4]
   assign channel_gain4__next[7:0] = 
      channel_gain_low4__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.gain[7:0];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_gain_low4
      if(!rst_rif_n) begin
         rif_channel.gain[4] <= 2'd0;
      end else begin
         rif_channel.gain[4] <= channel_gain4__next;
      end
   end

   assign channel_gain_low4__read_data = rif_channel.gain[7:0];

   // Register channel_gain_low[5]
   assign channel_gain5__next[7:0] = 
      channel_gain_low5__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.gain[7:0];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_gain_low5
      if(!rst_rif_n) begin
         rif_channel.gain[5] <= 2'd0;
      end else begin
         rif_channel.gain[5] <= channel_gain5__next;
      end
   end

   assign channel_gain_low5__read_data = rif_channel.gain[7:0];

   // Register channel_gain_low[6]
   assign channel_gain6__next[7:0] = 
      channel_gain_low6__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.gain[7:0];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_gain_low6
      if(!rst_rif_n) begin
         rif_channel.gain[6] <= 2'd0;
      end else begin
         rif_channel.gain[6] <= channel_gain6__next;
      end
   end

   assign channel_gain_low6__read_data = rif_channel.gain[7:0];

   // Register channel_gain_low[7]
   assign channel_gain7__next[7:0] = 
      channel_gain_low7__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_channel.gain[7:0];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_gain_low7
      if(!rst_rif_n) begin
         rif_channel.gain[7] <= 2'd0;
      end else begin
         rif_channel.gain[7] <= channel_gain7__next;
      end
   end

   assign channel_gain_low7__read_data = rif_channel.gain[7:0];

   // Register channel_status[0]
   assign channel_status0__read_data = {3'd0,channel.err_ainm_uv[0],channel.err_ainm_ov[0],channel.err_ainp_uv[0],channel.err_ainp_ov[0],channel.err_ref_det[0]};

   // Register channel_status[1]
   assign channel_status1__read_data = {3'd0,channel.err_ainm_uv[1],channel.err_ainm_ov[1],channel.err_ainp_uv[1],channel.err_ainp_ov[1],channel.err_ref_det[1]};

   // Register channel_status[2]
   assign channel_status2__read_data = {3'd0,channel.err_ainm_uv[2],channel.err_ainm_ov[2],channel.err_ainp_uv[2],channel.err_ainp_ov[2],channel.err_ref_det[2]};

   // Register channel_status[3]
   assign channel_status3__read_data = {3'd0,channel.err_ainm_uv[3],channel.err_ainm_ov[3],channel.err_ainp_uv[3],channel.err_ainp_ov[3],channel.err_ref_det[3]};

   // Register channel_status[4]
   assign channel_status4__read_data = {3'd0,channel.err_ainm_uv[4],channel.err_ainm_ov[4],channel.err_ainp_uv[4],channel.err_ainp_ov[4],channel.err_ref_det[4]};

   // Register channel_status[5]
   assign channel_status5__read_data = {3'd0,channel.err_ainm_uv[5],channel.err_ainm_ov[5],channel.err_ainp_uv[5],channel.err_ainp_ov[5],channel.err_ref_det[5]};

   // Register channel_status[6]
   assign channel_status6__read_data = {3'd0,channel.err_ainm_uv[6],channel.err_ainm_ov[6],channel.err_ainp_uv[6],channel.err_ainp_ov[6],channel.err_ref_det[6]};

   // Register channel_status[7]
   assign channel_status7__read_data = {3'd0,channel.err_ainm_uv[7],channel.err_ainm_ov[7],channel.err_ainp_uv[7],channel.err_ainp_ov[7],channel.err_ref_det[7]};

   // Register channel_dsp_err[0]
   assign channel_dsp_err0__read_data = {2'd0,channel.err_mod_sat[1],channel.err_filter_sat[1],channel.err_output_sat[1],channel.err_mod_sat[0],channel.err_filter_sat[0],channel.err_output_sat[0]};

   // Register channel_dsp_err[1]
   assign channel_dsp_err1__read_data = {2'd0,channel.err_mod_sat[3],channel.err_filter_sat[3],channel.err_output_sat[3],channel.err_mod_sat[2],channel.err_filter_sat[2],channel.err_output_sat[2]};

   // Register channel_dsp_err[2]
   assign channel_dsp_err2__read_data = {2'd0,channel.err_mod_sat[5],channel.err_filter_sat[5],channel.err_output_sat[5],channel.err_mod_sat[4],channel.err_filter_sat[4],channel.err_output_sat[4]};

   // Register channel_dsp_err[3]
   assign channel_dsp_err3__read_data = {2'd0,channel.err_mod_sat[7],channel.err_filter_sat[7],channel.err_output_sat[7],channel.err_mod_sat[6],channel.err_filter_sat[6],channel.err_output_sat[6]};

   // Register channel_test_en
   assign channel_ref_det_test_en__next = 
      channel_test_en__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[0] :
      rif_channel.ref_det_test_en;
   assign channel_ainp_ov_test_en__next = 
      channel_test_en__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[1] :
      rif_channel.ainp_ov_test_en;
   assign channel_ainp_uv_test_en__next = 
      channel_test_en__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[2] :
      rif_channel.ainp_uv_test_en;
   assign channel_ainm_ov_test_en__next = 
      channel_test_en__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[3] :
      rif_channel.ainm_ov_test_en;
   assign channel_ainm_uv_test_en__next = 
      channel_test_en__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[4] :
      rif_channel.ainm_uv_test_en;
   assign channel_mod_sat_test_en__next = 
      channel_test_en__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[5] :
      rif_channel.mod_sat_test_en;
   assign channel_filter_sat_test_en__next = 
      channel_test_en__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[6] :
      rif_channel.filter_sat_test_en;
   assign channel_output_sat_test_en__next = 
      channel_test_en__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7] :
      rif_channel.output_sat_test_en;

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_channel_test_en
      if(!rst_rif_n) begin
         rif_channel.ref_det_test_en <= 1'b0;
         rif_channel.ainp_ov_test_en <= 1'b1;
         rif_channel.ainp_uv_test_en <= 1'b1;
         rif_channel.ainm_ov_test_en <= 1'b1;
         rif_channel.ainm_uv_test_en <= 1'b1;
         rif_channel.mod_sat_test_en <= 1'b1;
         rif_channel.filter_sat_test_en <= 1'b1;
         rif_channel.output_sat_test_en <= 1'b1;
      end else begin
         rif_channel.ref_det_test_en <= channel_ref_det_test_en__next;
         rif_channel.ainp_ov_test_en <= channel_ainp_ov_test_en__next;
         rif_channel.ainp_uv_test_en <= channel_ainp_uv_test_en__next;
         rif_channel.ainm_ov_test_en <= channel_ainm_ov_test_en__next;
         rif_channel.ainm_uv_test_en <= channel_ainm_uv_test_en__next;
         rif_channel.mod_sat_test_en <= channel_mod_sat_test_en__next;
         rif_channel.filter_sat_test_en <= channel_filter_sat_test_en__next;
         rif_channel.output_sat_test_en <= channel_output_sat_test_en__next;
      end
   end

   assign channel_test_en__read_data = {rif_channel.output_sat_test_en,rif_channel.filter_sat_test_en,rif_channel.mod_sat_test_en,rif_channel.ainm_uv_test_en,rif_channel.ainm_ov_test_en,rif_channel.ainp_uv_test_en,rif_channel.ainp_ov_test_en,rif_channel.ref_det_test_en};

   // Register general_err1
   assign general_err1__read_data = {2'd0,general_err.memmap_crc_err,general_err.rom_crc_err,general_err.spi_clk_count_err,general_err.spi_invalid_read_err,general_err.spi_invalid_write_err,general_err.spi_crc_err};

   // Register general_err1_en
   assign general_err_spi_crc_err_en__next = 
      general_err1_en__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[0] :
      rif_general_err.spi_crc_err_en;
   assign general_err_spi_invalid_write_err_en__next = 
      general_err1_en__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[1] :
      rif_general_err.spi_invalid_write_err_en;
   assign general_err_spi_invalid_read_err_en__next = 
      general_err1_en__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[2] :
      rif_general_err.spi_invalid_read_err_en;
   assign general_err_spi_clk_count_err_en__next = 
      general_err1_en__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[3] :
      rif_general_err.spi_clk_count_err_en;
   assign general_err_rom_crc_err_en__next = 
      general_err1_en__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[4] :
      rif_general_err.rom_crc_err_en;
   assign general_err_memmap_crc_err_en__next = 
      general_err1_en__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[5] :
      rif_general_err.memmap_crc_err_en;

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_general_err1_en
      if(!rst_rif_n) begin
         rif_general_err.spi_crc_err_en <= 1'b0;
         rif_general_err.spi_invalid_write_err_en <= 1'b1;
         rif_general_err.spi_invalid_read_err_en <= 1'b1;
         rif_general_err.spi_clk_count_err_en <= 1'b1;
         rif_general_err.rom_crc_err_en <= 1'b1;
         rif_general_err.memmap_crc_err_en <= 1'b1;
      end else begin
         rif_general_err.spi_crc_err_en <= general_err_spi_crc_err_en__next;
         rif_general_err.spi_invalid_write_err_en <= general_err_spi_invalid_write_err_en__next;
         rif_general_err.spi_invalid_read_err_en <= general_err_spi_invalid_read_err_en__next;
         rif_general_err.spi_clk_count_err_en <= general_err_spi_clk_count_err_en__next;
         rif_general_err.rom_crc_err_en <= general_err_rom_crc_err_en__next;
         rif_general_err.memmap_crc_err_en <= general_err_memmap_crc_err_en__next;
      end
   end

   assign general_err1_en__read_data = {2'd0,rif_general_err.memmap_crc_err_en,rif_general_err.rom_crc_err_en,rif_general_err.spi_clk_count_err_en,rif_general_err.spi_invalid_read_err_en,rif_general_err.spi_invalid_write_err_en,rif_general_err.spi_crc_err_en};

   // Register general_err2
   assign general_err2__read_data = {2'd0,general_err.reset_detected,general_err.ext_mclk_switch_err,1'b0,general_err.aldo1_psm_err,general_err.aldo2_psm_err,general_err.dldo_psm_err};

   // Register general_err2_en
   assign general_err_ldo_psm_trip_test__next = general_err2_en__decode && if_rif.en && !if_rif.rd_wrn ? (rif_general_err.ldo_psm_trip_test | if_rif.wr_data[1:0]) : 2'd0;
   assign general_err_dldo_psm_err_en__next = 
      general_err2_en__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[2] :
      rif_general_err.dldo_psm_err_en;
   assign general_err_aldo_psm_err_en__next = 
      general_err2_en__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[3] :
      rif_general_err.aldo_psm_err_en;
   assign general_err_reset_detected_en__next = 
      general_err2_en__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[5] :
      rif_general_err.reset_detected_en;

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_general_err2_en
      if(!rst_rif_n) begin
         rif_general_err.ldo_psm_trip_test <= 2'd0;
         rif_general_err.dldo_psm_err_en <= 1'b1;
         rif_general_err.aldo_psm_err_en <= 1'b1;
         rif_general_err.reset_detected_en <= 1'b1;
      end else begin
         rif_general_err.ldo_psm_trip_test <= general_err_ldo_psm_trip_test__next;
         rif_general_err.dldo_psm_err_en <= general_err_dldo_psm_err_en__next;
         rif_general_err.aldo_psm_err_en <= general_err_aldo_psm_err_en__next;
         rif_general_err.reset_detected_en <= general_err_reset_detected_en__next;
      end
   end

   assign general_err2_en__read_data = {2'd0,rif_general_err.reset_detected_en,1'b0,rif_general_err.aldo_psm_err_en,rif_general_err.dldo_psm_err_en,rif_general_err.ldo_psm_trip_test};

   // Register error_status1
   assign error_status1__read_data = {2'd0,error_status.chip_error1,error_status.err_loc_ch[4],error_status.err_loc_ch[3],error_status.err_loc_ch[2],error_status.err_loc_ch[1],error_status.err_loc_ch[0]};

   // Register error_status2
   assign error_status2__read_data = {2'd0,error_status.chip_error2,error_status.err_loc_gen[1],error_status.err_loc_gen[0],error_status.err_loc_ch[7],error_status.err_loc_ch[6],error_status.err_loc_ch[5]};

   // Register error_status3
   assign error_status3__read_data = {2'd0,error_status.chip_error3,error_status.init_complete,error_status.err_loc_sat_ch[3],error_status.err_loc_sat_ch[2],error_status.err_loc_sat_ch[1],error_status.err_loc_sat_ch[0]};

   // Register src_n_msb
   assign decimation_src_n__next[11:8] = 
      src_n_msb__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[3:0] :
      rif_decimation.src_n[11:8];
   assign src_n_msb__read_data = {4'd0,rif_decimation.src_n[11:8]};

   // Register src_n_lsb
   assign decimation_src_n__next[7:0] = 
      src_n_lsb__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_decimation.src_n[7:0];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_src_n_lsb
      if(!rst_rif_n) begin
         rif_decimation.src_n <= 12'd0;
      end else begin
         rif_decimation.src_n <= decimation_src_n__next;
      end
   end

   assign src_n_lsb__read_data = rif_decimation.src_n[7:0];

   // Register src_if_msb
   assign decimation_src_if__next[15:8] = 
      src_if_msb__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_decimation.src_if[15:8];
   assign src_if_msb__read_data = rif_decimation.src_if[15:8];

   // Register src_if_lsb
   assign decimation_src_if__next[7:0] = 
      src_if_lsb__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7:0] :
      rif_decimation.src_if[7:0];

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_src_if_lsb
      if(!rst_rif_n) begin
         rif_decimation.src_if <= 16'h0000;
      end else begin
         rif_decimation.src_if <= decimation_src_if__next;
      end
   end

   assign src_if_lsb__read_data = rif_decimation.src_if[7:0];

   // Register src_load
   assign decimation_load_update__next = src_load__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[0] : 1'b0;
   assign decimation_load_source__next = 
      src_load__decode && if_rif.en && !if_rif.rd_wrn ? if_rif.wr_data[7] :
      rif_decimation.load_source;

   always_ff @(posedge clk_rif or negedge rst_rif_n) begin : proc_src_load
      if(!rst_rif_n) begin
         rif_decimation.load_update <= 1'b0;
         rif_decimation.load_source <= 1'b0;
      end else begin
         rif_decimation.load_update <= decimation_load_update__next;
         rif_decimation.load_source <= decimation_load_source__next;
      end
   end

   assign src_load__read_data = {rif_decimation.load_source,6'd0,rif_decimation.load_update};

endmodule : ad7771_rif
