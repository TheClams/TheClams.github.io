`ifndef RAL_AD7771_RIF
`define RAL_AD7771_RIF

import uvm_pkg::*;

class ral_reg_ad7771_channel_cfg extends uvm_reg;
   rand uvm_reg_field bias;
   rand uvm_reg_field rx;
   rand uvm_reg_field ref_mon;
   rand uvm_reg_field gain;

   function new(string name = "ad7771_channel_cfg");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.bias = uvm_reg_field::type_id::create("bias",,get_full_name());
      this.bias.configure(this, 4, 0, "RW", 0, 4'h0, 1, 0, 0);
      this.rx = uvm_reg_field::type_id::create("rx",,get_full_name());
      this.rx.configure(this, 1, 4, "RW", 0, 1'h0, 1, 0, 0);
      this.ref_mon = uvm_reg_field::type_id::create("ref_mon",,get_full_name());
      this.ref_mon.configure(this, 1, 5, "RW", 0, 1'h0, 1, 0, 0);
      this.gain = uvm_reg_field::type_id::create("gain",,get_full_name());
      this.gain.configure(this, 2, 6, "RW", 0, 2'h0, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_channel_cfg)

endclass : ral_reg_ad7771_channel_cfg

class ral_reg_ad7771_clock_disable extends uvm_reg;
   rand uvm_reg_field disable_ch0;
   rand uvm_reg_field disable_ch1;
   rand uvm_reg_field disable_ch2;
   rand uvm_reg_field disable_ch3;
   rand uvm_reg_field disable_ch4;
   rand uvm_reg_field disable_ch5;
   rand uvm_reg_field disable_ch6;
   rand uvm_reg_field disable_ch7;

   function new(string name = "ad7771_clock_disable");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.disable_ch0 = uvm_reg_field::type_id::create("disable_ch0",,get_full_name());
      this.disable_ch0.configure(this, 1, 0, "RW", 0, 1'h0, 1, 0, 0);
      this.disable_ch1 = uvm_reg_field::type_id::create("disable_ch1",,get_full_name());
      this.disable_ch1.configure(this, 1, 1, "RW", 0, 1'h0, 1, 0, 0);
      this.disable_ch2 = uvm_reg_field::type_id::create("disable_ch2",,get_full_name());
      this.disable_ch2.configure(this, 1, 2, "RW", 0, 1'h0, 1, 0, 0);
      this.disable_ch3 = uvm_reg_field::type_id::create("disable_ch3",,get_full_name());
      this.disable_ch3.configure(this, 1, 3, "RW", 0, 1'h0, 1, 0, 0);
      this.disable_ch4 = uvm_reg_field::type_id::create("disable_ch4",,get_full_name());
      this.disable_ch4.configure(this, 1, 4, "RW", 0, 1'h0, 1, 0, 0);
      this.disable_ch5 = uvm_reg_field::type_id::create("disable_ch5",,get_full_name());
      this.disable_ch5.configure(this, 1, 5, "RW", 0, 1'h0, 1, 0, 0);
      this.disable_ch6 = uvm_reg_field::type_id::create("disable_ch6",,get_full_name());
      this.disable_ch6.configure(this, 1, 6, "RW", 0, 1'h0, 1, 0, 0);
      this.disable_ch7 = uvm_reg_field::type_id::create("disable_ch7",,get_full_name());
      this.disable_ch7.configure(this, 1, 7, "RW", 0, 1'h0, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_clock_disable)

endclass : ral_reg_ad7771_clock_disable

class ral_reg_ad7771_channel_sync_offset extends uvm_reg;
   rand uvm_reg_field sync_offset;

   function new(string name = "ad7771_channel_sync_offset");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.sync_offset = uvm_reg_field::type_id::create("sync_offset",,get_full_name());
      this.sync_offset.configure(this, 8, 0, "RW", 0, 8'h00, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_channel_sync_offset)

endclass : ral_reg_ad7771_channel_sync_offset

class ral_reg_ad7771_user_cfg1 extends uvm_reg;
   rand uvm_reg_field soft_reset;
   rand uvm_reg_field pdb_rc_osc;
   rand uvm_reg_field pdb_sar;
   rand uvm_reg_field pdb_refout;
   rand uvm_reg_field pdb_vcm;
   rand uvm_reg_field power_mode;
   rand uvm_reg_field all_ch_dis_mclk;

   function new(string name = "ad7771_user_cfg1");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.soft_reset = uvm_reg_field::type_id::create("soft_reset",,get_full_name());
      this.soft_reset.configure(this, 2, 0, "RW", 0, 2'h0, 1, 0, 0);
      this.pdb_rc_osc = uvm_reg_field::type_id::create("pdb_rc_osc",,get_full_name());
      this.pdb_rc_osc.configure(this, 1, 2, "RW", 0, 1'h1, 1, 0, 0);
      this.pdb_sar = uvm_reg_field::type_id::create("pdb_sar",,get_full_name());
      this.pdb_sar.configure(this, 1, 3, "RW", 0, 1'h0, 1, 0, 0);
      this.pdb_refout = uvm_reg_field::type_id::create("pdb_refout",,get_full_name());
      this.pdb_refout.configure(this, 1, 4, "RW", 0, 1'h0, 1, 0, 0);
      this.pdb_vcm = uvm_reg_field::type_id::create("pdb_vcm",,get_full_name());
      this.pdb_vcm.configure(this, 1, 5, "RW", 0, 1'h1, 1, 0, 0);
      this.power_mode = uvm_reg_field::type_id::create("power_mode",,get_full_name());
      this.power_mode.configure(this, 1, 6, "RW", 0, 1'h0, 1, 0, 0);
      this.all_ch_dis_mclk = uvm_reg_field::type_id::create("all_ch_dis_mclk",,get_full_name());
      this.all_ch_dis_mclk.configure(this, 1, 7, "RW", 0, 1'h0, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_user_cfg1)

endclass : ral_reg_ad7771_user_cfg1

class ral_reg_ad7771_user_cfg2 extends uvm_reg;
   rand uvm_reg_field spi_sync;
   rand uvm_reg_field dout_drive_str;
   rand uvm_reg_field sdo_drive_str;
   rand uvm_reg_field sar_diag_en;
   rand uvm_reg_field filter_mode;

   function new(string name = "ad7771_user_cfg2");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.spi_sync = uvm_reg_field::type_id::create("spi_sync",,get_full_name());
      this.spi_sync.configure(this, 1, 0, "RW", 0, 1'h0, 1, 0, 0);
      this.dout_drive_str = uvm_reg_field::type_id::create("dout_drive_str",,get_full_name());
      this.dout_drive_str.configure(this, 2, 1, "RW", 0, 2'h0, 1, 0, 0);
      this.sdo_drive_str = uvm_reg_field::type_id::create("sdo_drive_str",,get_full_name());
      this.sdo_drive_str.configure(this, 2, 3, "RW", 0, 2'h1, 1, 0, 0);
      this.sar_diag_en = uvm_reg_field::type_id::create("sar_diag_en",,get_full_name());
      this.sar_diag_en.configure(this, 1, 5, "RW", 0, 1'h0, 1, 0, 0);
      this.filter_mode = uvm_reg_field::type_id::create("filter_mode",,get_full_name());
      this.filter_mode.configure(this, 1, 6, "RW", 0, 1'h0, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_user_cfg2)

endclass : ral_reg_ad7771_user_cfg2

class ral_reg_ad7771_user_cfg3 extends uvm_reg;
   rand uvm_reg_field clk_qual_dis;
   rand uvm_reg_field spi_subordinate;
   rand uvm_reg_field convst_deglitch_dis;

   function new(string name = "ad7771_user_cfg3");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.clk_qual_dis = uvm_reg_field::type_id::create("clk_qual_dis",,get_full_name());
      this.clk_qual_dis.configure(this, 1, 0, "RW", 0, 1'h0, 1, 0, 0);
      this.spi_subordinate = uvm_reg_field::type_id::create("spi_subordinate",,get_full_name());
      this.spi_subordinate.configure(this, 1, 4, "RW", 0, 1'h0, 1, 0, 0);
      this.convst_deglitch_dis = uvm_reg_field::type_id::create("convst_deglitch_dis",,get_full_name());
      this.convst_deglitch_dis.configure(this, 2, 6, "RW", 0, 2'h2, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_user_cfg3)

endclass : ral_reg_ad7771_user_cfg3

class ral_reg_ad7771_data_output extends uvm_reg;
   rand uvm_reg_field dclk_div;
   rand uvm_reg_field header_format;
   rand uvm_reg_field data_format;

   function new(string name = "ad7771_data_output");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.dclk_div = uvm_reg_field::type_id::create("dclk_div",,get_full_name());
      this.dclk_div.configure(this, 3, 1, "RW", 0, 3'h0, 1, 0, 0);
      this.header_format = uvm_reg_field::type_id::create("header_format",,get_full_name());
      this.header_format.configure(this, 1, 5, "RW", 0, 1'h0, 1, 0, 0);
      this.data_format = uvm_reg_field::type_id::create("data_format",,get_full_name());
      this.data_format.configure(this, 2, 6, "RW", 0, 2'h0, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_data_output)

endclass : ral_reg_ad7771_data_output

class ral_reg_ad7771_mux_ctrl_ref_mtr extends uvm_reg;
   rand uvm_reg_field mtr;
   rand uvm_reg_field ref;

   function new(string name = "ad7771_mux_ctrl_ref_mtr");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.mtr = uvm_reg_field::type_id::create("mtr",,get_full_name());
      this.mtr.configure(this, 4, 2, "RW", 0, 4'h0, 1, 0, 0);
      this.ref = uvm_reg_field::type_id::create("ref",,get_full_name());
      this.ref.configure(this, 2, 6, "RW", 0, 2'h0, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_mux_ctrl_ref_mtr)

endclass : ral_reg_ad7771_mux_ctrl_ref_mtr

class ral_reg_ad7771_mux_ctrl_global extends uvm_reg;
   rand uvm_reg_field global;

   function new(string name = "ad7771_mux_ctrl_global");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.global = uvm_reg_field::type_id::create("global",,get_full_name());
      this.global.configure(this, 5, 3, "RW", 0, 5'h0, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_mux_ctrl_global)

endclass : ral_reg_ad7771_mux_ctrl_global

class ral_reg_ad7771_gpio_cfg extends uvm_reg;
   rand uvm_reg_field op_en;

   function new(string name = "ad7771_gpio_cfg");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.op_en = uvm_reg_field::type_id::create("op_en",,get_full_name());
      this.op_en.configure(this, 3, 0, "RW", 0, 3'h0, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_gpio_cfg)

endclass : ral_reg_ad7771_gpio_cfg

class ral_reg_ad7771_gpio_data extends uvm_reg;
   rand uvm_reg_field write;
   uvm_reg_field read;

   function new(string name = "ad7771_gpio_data");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.write = uvm_reg_field::type_id::create("write",,get_full_name());
      this.write.configure(this, 3, 0, "RW", 0, 3'h0, 1, 0, 0);
      this.read = uvm_reg_field::type_id::create("read",,get_full_name());
      this.read.configure(this, 3, 3, "RO", 1, 3'h0, 0, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_gpio_data)

endclass : ral_reg_ad7771_gpio_data

class ral_reg_ad7771_buffer_cfg1 extends uvm_reg;
   rand uvm_reg_field ref_buf_neg_en;
   rand uvm_reg_field ref_buf_pos_en;

   function new(string name = "ad7771_buffer_cfg1");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.ref_buf_neg_en = uvm_reg_field::type_id::create("ref_buf_neg_en",,get_full_name());
      this.ref_buf_neg_en.configure(this, 1, 3, "RW", 0, 1'h1, 1, 0, 0);
      this.ref_buf_pos_en = uvm_reg_field::type_id::create("ref_buf_pos_en",,get_full_name());
      this.ref_buf_pos_en.configure(this, 1, 4, "RW", 0, 1'h1, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_buffer_cfg1)

endclass : ral_reg_ad7771_buffer_cfg1

class ral_reg_ad7771_buffer_cfg2 extends uvm_reg;
   rand uvm_reg_field pdb_dldo_ovrdrv;
   rand uvm_reg_field pdb_aldo2_ovrdrv;
   rand uvm_reg_field pdb_aldo1_ovrdrv;
   rand uvm_reg_field ref_buf_neg_preq;
   rand uvm_reg_field ref_buf_pos_preq;

   function new(string name = "ad7771_buffer_cfg2");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.pdb_dldo_ovrdrv = uvm_reg_field::type_id::create("pdb_dldo_ovrdrv",,get_full_name());
      this.pdb_dldo_ovrdrv.configure(this, 1, 0, "RW", 0, 1'h1, 1, 0, 0);
      this.pdb_aldo2_ovrdrv = uvm_reg_field::type_id::create("pdb_aldo2_ovrdrv",,get_full_name());
      this.pdb_aldo2_ovrdrv.configure(this, 1, 1, "RW", 0, 1'h1, 1, 0, 0);
      this.pdb_aldo1_ovrdrv = uvm_reg_field::type_id::create("pdb_aldo1_ovrdrv",,get_full_name());
      this.pdb_aldo1_ovrdrv.configure(this, 1, 2, "RW", 0, 1'h1, 1, 0, 0);
      this.ref_buf_neg_preq = uvm_reg_field::type_id::create("ref_buf_neg_preq",,get_full_name());
      this.ref_buf_neg_preq.configure(this, 1, 6, "RW", 0, 1'h1, 1, 0, 0);
      this.ref_buf_pos_preq = uvm_reg_field::type_id::create("ref_buf_pos_preq",,get_full_name());
      this.ref_buf_pos_preq.configure(this, 1, 7, "RW", 0, 1'h1, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_buffer_cfg2)

endclass : ral_reg_ad7771_buffer_cfg2

class ral_reg_ad7771_channel_offset_up extends uvm_reg;
   rand uvm_reg_field offset;

   function new(string name = "ad7771_channel_offset_up");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.offset = uvm_reg_field::type_id::create("offset",,get_full_name());
      this.offset.configure(this, 8, 0, "RW", 0, 8'h00, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_channel_offset_up)

endclass : ral_reg_ad7771_channel_offset_up

class ral_reg_ad7771_channel_offset_mid extends uvm_reg;
   rand uvm_reg_field offset;

   function new(string name = "ad7771_channel_offset_mid");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.offset = uvm_reg_field::type_id::create("offset",,get_full_name());
      this.offset.configure(this, 8, 0, "RW", 0, 8'h00, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_channel_offset_mid)

endclass : ral_reg_ad7771_channel_offset_mid

class ral_reg_ad7771_channel_offset_low extends uvm_reg;
   rand uvm_reg_field offset;

   function new(string name = "ad7771_channel_offset_low");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.offset = uvm_reg_field::type_id::create("offset",,get_full_name());
      this.offset.configure(this, 8, 0, "RW", 0, 8'h00, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_channel_offset_low)

endclass : ral_reg_ad7771_channel_offset_low

class ral_reg_ad7771_channel_gain_up extends uvm_reg;
   rand uvm_reg_field gain;

   function new(string name = "ad7771_channel_gain_up");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.gain = uvm_reg_field::type_id::create("gain",,get_full_name());
      this.gain.configure(this, 8, 0, "RW", 0, 8'h00, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_channel_gain_up)

endclass : ral_reg_ad7771_channel_gain_up

class ral_reg_ad7771_channel_gain_mid extends uvm_reg;
   rand uvm_reg_field gain;

   function new(string name = "ad7771_channel_gain_mid");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.gain = uvm_reg_field::type_id::create("gain",,get_full_name());
      this.gain.configure(this, 8, 0, "RW", 0, 8'h00, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_channel_gain_mid)

endclass : ral_reg_ad7771_channel_gain_mid

class ral_reg_ad7771_channel_gain_low extends uvm_reg;
   rand uvm_reg_field gain;

   function new(string name = "ad7771_channel_gain_low");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.gain = uvm_reg_field::type_id::create("gain",,get_full_name());
      this.gain.configure(this, 8, 0, "RW", 0, 8'h00, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_channel_gain_low)

endclass : ral_reg_ad7771_channel_gain_low

class ral_reg_ad7771_channel_status extends uvm_reg;
   uvm_reg_field err_ref_det;
   uvm_reg_field err_ainp_ov;
   uvm_reg_field err_ainp_uv;
   uvm_reg_field err_ainm_ov;
   uvm_reg_field err_ainm_uv;

   function new(string name = "ad7771_channel_status");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.err_ref_det = uvm_reg_field::type_id::create("err_ref_det",,get_full_name());
      this.err_ref_det.configure(this, 1, 0, "RO", 1, 1'h0, 0, 0, 0);
      this.err_ainp_ov = uvm_reg_field::type_id::create("err_ainp_ov",,get_full_name());
      this.err_ainp_ov.configure(this, 1, 1, "RO", 1, 1'h0, 0, 0, 0);
      this.err_ainp_uv = uvm_reg_field::type_id::create("err_ainp_uv",,get_full_name());
      this.err_ainp_uv.configure(this, 1, 2, "RO", 1, 1'h0, 0, 0, 0);
      this.err_ainm_ov = uvm_reg_field::type_id::create("err_ainm_ov",,get_full_name());
      this.err_ainm_ov.configure(this, 1, 3, "RO", 1, 1'h0, 0, 0, 0);
      this.err_ainm_uv = uvm_reg_field::type_id::create("err_ainm_uv",,get_full_name());
      this.err_ainm_uv.configure(this, 1, 4, "RO", 1, 1'h0, 0, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_channel_status)

endclass : ral_reg_ad7771_channel_status

class ral_reg_ad7771_channel_dsp_err extends uvm_reg;
   uvm_reg_field err_output_sat0;
   uvm_reg_field err_filter_sat0;
   uvm_reg_field err_mod_sat0;
   uvm_reg_field err_output_sat1;
   uvm_reg_field err_filter_sat1;
   uvm_reg_field err_mod_sat1;

   function new(string name = "ad7771_channel_dsp_err");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.err_output_sat0 = uvm_reg_field::type_id::create("err_output_sat0",,get_full_name());
      this.err_output_sat0.configure(this, 1, 0, "RO", 1, 1'h0, 0, 0, 0);
      this.err_filter_sat0 = uvm_reg_field::type_id::create("err_filter_sat0",,get_full_name());
      this.err_filter_sat0.configure(this, 1, 1, "RO", 1, 1'h0, 0, 0, 0);
      this.err_mod_sat0 = uvm_reg_field::type_id::create("err_mod_sat0",,get_full_name());
      this.err_mod_sat0.configure(this, 1, 2, "RO", 1, 1'h0, 0, 0, 0);
      this.err_output_sat1 = uvm_reg_field::type_id::create("err_output_sat1",,get_full_name());
      this.err_output_sat1.configure(this, 1, 3, "RO", 1, 1'h0, 0, 0, 0);
      this.err_filter_sat1 = uvm_reg_field::type_id::create("err_filter_sat1",,get_full_name());
      this.err_filter_sat1.configure(this, 1, 4, "RO", 1, 1'h0, 0, 0, 0);
      this.err_mod_sat1 = uvm_reg_field::type_id::create("err_mod_sat1",,get_full_name());
      this.err_mod_sat1.configure(this, 1, 5, "RO", 1, 1'h0, 0, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_channel_dsp_err)

endclass : ral_reg_ad7771_channel_dsp_err

class ral_reg_ad7771_channel_test_en extends uvm_reg;
   rand uvm_reg_field ref_det_test_en;
   rand uvm_reg_field ainp_ov_test_en;
   rand uvm_reg_field ainp_uv_test_en;
   rand uvm_reg_field ainm_ov_test_en;
   rand uvm_reg_field ainm_uv_test_en;
   rand uvm_reg_field mod_sat_test_en;
   rand uvm_reg_field filter_sat_test_en;
   rand uvm_reg_field output_sat_test_en;

   function new(string name = "ad7771_channel_test_en");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.ref_det_test_en = uvm_reg_field::type_id::create("ref_det_test_en",,get_full_name());
      this.ref_det_test_en.configure(this, 1, 0, "RW", 0, 1'h0, 1, 0, 0);
      this.ainp_ov_test_en = uvm_reg_field::type_id::create("ainp_ov_test_en",,get_full_name());
      this.ainp_ov_test_en.configure(this, 1, 1, "RW", 0, 1'h1, 1, 0, 0);
      this.ainp_uv_test_en = uvm_reg_field::type_id::create("ainp_uv_test_en",,get_full_name());
      this.ainp_uv_test_en.configure(this, 1, 2, "RW", 0, 1'h1, 1, 0, 0);
      this.ainm_ov_test_en = uvm_reg_field::type_id::create("ainm_ov_test_en",,get_full_name());
      this.ainm_ov_test_en.configure(this, 1, 3, "RW", 0, 1'h1, 1, 0, 0);
      this.ainm_uv_test_en = uvm_reg_field::type_id::create("ainm_uv_test_en",,get_full_name());
      this.ainm_uv_test_en.configure(this, 1, 4, "RW", 0, 1'h1, 1, 0, 0);
      this.mod_sat_test_en = uvm_reg_field::type_id::create("mod_sat_test_en",,get_full_name());
      this.mod_sat_test_en.configure(this, 1, 5, "RW", 0, 1'h1, 1, 0, 0);
      this.filter_sat_test_en = uvm_reg_field::type_id::create("filter_sat_test_en",,get_full_name());
      this.filter_sat_test_en.configure(this, 1, 6, "RW", 0, 1'h1, 1, 0, 0);
      this.output_sat_test_en = uvm_reg_field::type_id::create("output_sat_test_en",,get_full_name());
      this.output_sat_test_en.configure(this, 1, 7, "RW", 0, 1'h1, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_channel_test_en)

endclass : ral_reg_ad7771_channel_test_en

class ral_reg_ad7771_general_err1 extends uvm_reg;
   uvm_reg_field spi_crc_err;
   uvm_reg_field spi_invalid_write_err;
   uvm_reg_field spi_invalid_read_err;
   uvm_reg_field spi_clk_count_err;
   uvm_reg_field rom_crc_err;
   uvm_reg_field memmap_crc_err;

   function new(string name = "ad7771_general_err1");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.spi_crc_err = uvm_reg_field::type_id::create("spi_crc_err",,get_full_name());
      this.spi_crc_err.configure(this, 1, 0, "RO", 1, 1'h0, 0, 0, 0);
      this.spi_invalid_write_err = uvm_reg_field::type_id::create("spi_invalid_write_err",,get_full_name());
      this.spi_invalid_write_err.configure(this, 1, 1, "RO", 1, 1'h0, 0, 0, 0);
      this.spi_invalid_read_err = uvm_reg_field::type_id::create("spi_invalid_read_err",,get_full_name());
      this.spi_invalid_read_err.configure(this, 1, 2, "RO", 1, 1'h0, 0, 0, 0);
      this.spi_clk_count_err = uvm_reg_field::type_id::create("spi_clk_count_err",,get_full_name());
      this.spi_clk_count_err.configure(this, 1, 3, "RO", 1, 1'h0, 0, 0, 0);
      this.rom_crc_err = uvm_reg_field::type_id::create("rom_crc_err",,get_full_name());
      this.rom_crc_err.configure(this, 1, 4, "RO", 1, 1'h0, 0, 0, 0);
      this.memmap_crc_err = uvm_reg_field::type_id::create("memmap_crc_err",,get_full_name());
      this.memmap_crc_err.configure(this, 1, 5, "RO", 1, 1'h0, 0, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_general_err1)

endclass : ral_reg_ad7771_general_err1

class ral_reg_ad7771_general_err1_en extends uvm_reg;
   rand uvm_reg_field spi_crc_err_en;
   rand uvm_reg_field spi_invalid_write_err_en;
   rand uvm_reg_field spi_invalid_read_err_en;
   rand uvm_reg_field spi_clk_count_err_en;
   rand uvm_reg_field rom_crc_err_en;
   rand uvm_reg_field memmap_crc_err_en;

   function new(string name = "ad7771_general_err1_en");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.spi_crc_err_en = uvm_reg_field::type_id::create("spi_crc_err_en",,get_full_name());
      this.spi_crc_err_en.configure(this, 1, 0, "RW", 0, 1'h0, 1, 0, 0);
      this.spi_invalid_write_err_en = uvm_reg_field::type_id::create("spi_invalid_write_err_en",,get_full_name());
      this.spi_invalid_write_err_en.configure(this, 1, 1, "RW", 0, 1'h1, 1, 0, 0);
      this.spi_invalid_read_err_en = uvm_reg_field::type_id::create("spi_invalid_read_err_en",,get_full_name());
      this.spi_invalid_read_err_en.configure(this, 1, 2, "RW", 0, 1'h1, 1, 0, 0);
      this.spi_clk_count_err_en = uvm_reg_field::type_id::create("spi_clk_count_err_en",,get_full_name());
      this.spi_clk_count_err_en.configure(this, 1, 3, "RW", 0, 1'h1, 1, 0, 0);
      this.rom_crc_err_en = uvm_reg_field::type_id::create("rom_crc_err_en",,get_full_name());
      this.rom_crc_err_en.configure(this, 1, 4, "RW", 0, 1'h1, 1, 0, 0);
      this.memmap_crc_err_en = uvm_reg_field::type_id::create("memmap_crc_err_en",,get_full_name());
      this.memmap_crc_err_en.configure(this, 1, 5, "RW", 0, 1'h1, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_general_err1_en)

endclass : ral_reg_ad7771_general_err1_en

class ral_reg_ad7771_general_err2 extends uvm_reg;
   uvm_reg_field dldo_psm_err;
   uvm_reg_field aldo2_psm_err;
   uvm_reg_field aldo1_psm_err;
   uvm_reg_field ext_mclk_switch_err;
   uvm_reg_field reset_detected;

   function new(string name = "ad7771_general_err2");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.dldo_psm_err = uvm_reg_field::type_id::create("dldo_psm_err",,get_full_name());
      this.dldo_psm_err.configure(this, 1, 0, "RO", 1, 1'h0, 0, 0, 0);
      this.aldo2_psm_err = uvm_reg_field::type_id::create("aldo2_psm_err",,get_full_name());
      this.aldo2_psm_err.configure(this, 1, 1, "RO", 1, 1'h0, 0, 0, 0);
      this.aldo1_psm_err = uvm_reg_field::type_id::create("aldo1_psm_err",,get_full_name());
      this.aldo1_psm_err.configure(this, 1, 2, "RO", 1, 1'h0, 0, 0, 0);
      this.ext_mclk_switch_err = uvm_reg_field::type_id::create("ext_mclk_switch_err",,get_full_name());
      this.ext_mclk_switch_err.configure(this, 1, 4, "RO", 1, 1'h0, 0, 0, 0);
      this.reset_detected = uvm_reg_field::type_id::create("reset_detected",,get_full_name());
      this.reset_detected.configure(this, 1, 5, "RO", 1, 1'h0, 0, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_general_err2)

endclass : ral_reg_ad7771_general_err2

class ral_reg_ad7771_general_err2_en extends uvm_reg;
   rand uvm_reg_field ldo_psm_trip_test;
   rand uvm_reg_field dldo_psm_err_en;
   rand uvm_reg_field aldo_psm_err_en;
   rand uvm_reg_field reset_detected_en;

   function new(string name = "ad7771_general_err2_en");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.ldo_psm_trip_test = uvm_reg_field::type_id::create("ldo_psm_trip_test",,get_full_name());
      this.ldo_psm_trip_test.configure(this, 2, 0, "RW", 0, 2'h0, 1, 0, 0);
      this.dldo_psm_err_en = uvm_reg_field::type_id::create("dldo_psm_err_en",,get_full_name());
      this.dldo_psm_err_en.configure(this, 1, 2, "RW", 0, 1'h1, 1, 0, 0);
      this.aldo_psm_err_en = uvm_reg_field::type_id::create("aldo_psm_err_en",,get_full_name());
      this.aldo_psm_err_en.configure(this, 1, 3, "RW", 0, 1'h1, 1, 0, 0);
      this.reset_detected_en = uvm_reg_field::type_id::create("reset_detected_en",,get_full_name());
      this.reset_detected_en.configure(this, 1, 5, "RW", 0, 1'h1, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_general_err2_en)

endclass : ral_reg_ad7771_general_err2_en

class ral_reg_ad7771_error_status1 extends uvm_reg;
   uvm_reg_field err_loc_ch0;
   uvm_reg_field err_loc_ch1;
   uvm_reg_field err_loc_ch2;
   uvm_reg_field err_loc_ch3;
   uvm_reg_field err_loc_ch4;
   uvm_reg_field chip_error1;

   function new(string name = "ad7771_error_status1");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.err_loc_ch0 = uvm_reg_field::type_id::create("err_loc_ch0",,get_full_name());
      this.err_loc_ch0.configure(this, 1, 0, "RO", 1, 1'h0, 0, 0, 0);
      this.err_loc_ch1 = uvm_reg_field::type_id::create("err_loc_ch1",,get_full_name());
      this.err_loc_ch1.configure(this, 1, 1, "RO", 1, 1'h0, 0, 0, 0);
      this.err_loc_ch2 = uvm_reg_field::type_id::create("err_loc_ch2",,get_full_name());
      this.err_loc_ch2.configure(this, 1, 2, "RO", 1, 1'h0, 0, 0, 0);
      this.err_loc_ch3 = uvm_reg_field::type_id::create("err_loc_ch3",,get_full_name());
      this.err_loc_ch3.configure(this, 1, 3, "RO", 1, 1'h0, 0, 0, 0);
      this.err_loc_ch4 = uvm_reg_field::type_id::create("err_loc_ch4",,get_full_name());
      this.err_loc_ch4.configure(this, 1, 4, "RO", 1, 1'h0, 0, 0, 0);
      this.chip_error1 = uvm_reg_field::type_id::create("chip_error1",,get_full_name());
      this.chip_error1.configure(this, 1, 5, "RO", 1, 1'h0, 0, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_error_status1)

endclass : ral_reg_ad7771_error_status1

class ral_reg_ad7771_error_status2 extends uvm_reg;
   uvm_reg_field err_loc_ch5;
   uvm_reg_field err_loc_ch6;
   uvm_reg_field err_loc_ch7;
   uvm_reg_field err_loc_gen0;
   uvm_reg_field err_loc_gen1;
   uvm_reg_field chip_error2;

   function new(string name = "ad7771_error_status2");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.err_loc_ch5 = uvm_reg_field::type_id::create("err_loc_ch5",,get_full_name());
      this.err_loc_ch5.configure(this, 1, 0, "RO", 1, 1'h0, 0, 0, 0);
      this.err_loc_ch6 = uvm_reg_field::type_id::create("err_loc_ch6",,get_full_name());
      this.err_loc_ch6.configure(this, 1, 1, "RO", 1, 1'h0, 0, 0, 0);
      this.err_loc_ch7 = uvm_reg_field::type_id::create("err_loc_ch7",,get_full_name());
      this.err_loc_ch7.configure(this, 1, 2, "RO", 1, 1'h0, 0, 0, 0);
      this.err_loc_gen0 = uvm_reg_field::type_id::create("err_loc_gen0",,get_full_name());
      this.err_loc_gen0.configure(this, 1, 3, "RO", 1, 1'h0, 0, 0, 0);
      this.err_loc_gen1 = uvm_reg_field::type_id::create("err_loc_gen1",,get_full_name());
      this.err_loc_gen1.configure(this, 1, 4, "RO", 1, 1'h0, 0, 0, 0);
      this.chip_error2 = uvm_reg_field::type_id::create("chip_error2",,get_full_name());
      this.chip_error2.configure(this, 1, 5, "RO", 1, 1'h0, 0, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_error_status2)

endclass : ral_reg_ad7771_error_status2

class ral_reg_ad7771_error_status3 extends uvm_reg;
   uvm_reg_field err_loc_sat_ch0;
   uvm_reg_field err_loc_sat_ch1;
   uvm_reg_field err_loc_sat_ch2;
   uvm_reg_field err_loc_sat_ch3;
   uvm_reg_field init_complete;
   uvm_reg_field chip_error3;

   function new(string name = "ad7771_error_status3");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.err_loc_sat_ch0 = uvm_reg_field::type_id::create("err_loc_sat_ch0",,get_full_name());
      this.err_loc_sat_ch0.configure(this, 1, 0, "RO", 1, 1'h0, 0, 0, 0);
      this.err_loc_sat_ch1 = uvm_reg_field::type_id::create("err_loc_sat_ch1",,get_full_name());
      this.err_loc_sat_ch1.configure(this, 1, 1, "RO", 1, 1'h0, 0, 0, 0);
      this.err_loc_sat_ch2 = uvm_reg_field::type_id::create("err_loc_sat_ch2",,get_full_name());
      this.err_loc_sat_ch2.configure(this, 1, 2, "RO", 1, 1'h0, 0, 0, 0);
      this.err_loc_sat_ch3 = uvm_reg_field::type_id::create("err_loc_sat_ch3",,get_full_name());
      this.err_loc_sat_ch3.configure(this, 1, 3, "RO", 1, 1'h0, 0, 0, 0);
      this.init_complete = uvm_reg_field::type_id::create("init_complete",,get_full_name());
      this.init_complete.configure(this, 1, 4, "RO", 1, 1'h0, 0, 0, 0);
      this.chip_error3 = uvm_reg_field::type_id::create("chip_error3",,get_full_name());
      this.chip_error3.configure(this, 1, 5, "RO", 1, 1'h0, 0, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_error_status3)

endclass : ral_reg_ad7771_error_status3

class ral_reg_ad7771_src_n_msb extends uvm_reg;
   rand uvm_reg_field src_n;

   function new(string name = "ad7771_src_n_msb");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.src_n = uvm_reg_field::type_id::create("src_n",,get_full_name());
      this.src_n.configure(this, 4, 0, "RW", 0, 4'h0, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_src_n_msb)

endclass : ral_reg_ad7771_src_n_msb

class ral_reg_ad7771_src_n_lsb extends uvm_reg;
   rand uvm_reg_field src_n;

   function new(string name = "ad7771_src_n_lsb");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.src_n = uvm_reg_field::type_id::create("src_n",,get_full_name());
      this.src_n.configure(this, 8, 0, "RW", 0, 8'h00, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_src_n_lsb)

endclass : ral_reg_ad7771_src_n_lsb

class ral_reg_ad7771_src_if_msb extends uvm_reg;
   rand uvm_reg_field src_if;

   function new(string name = "ad7771_src_if_msb");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.src_if = uvm_reg_field::type_id::create("src_if",,get_full_name());
      this.src_if.configure(this, 8, 0, "RW", 0, 8'h00, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_src_if_msb)

endclass : ral_reg_ad7771_src_if_msb

class ral_reg_ad7771_src_if_lsb extends uvm_reg;
   rand uvm_reg_field src_if;

   function new(string name = "ad7771_src_if_lsb");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.src_if = uvm_reg_field::type_id::create("src_if",,get_full_name());
      this.src_if.configure(this, 8, 0, "RW", 0, 8'h00, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_src_if_lsb)

endclass : ral_reg_ad7771_src_if_lsb

class ral_reg_ad7771_src_load extends uvm_reg;
   rand uvm_reg_field load_update;
   rand uvm_reg_field load_source;

   function new(string name = "ad7771_src_load");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.load_update = uvm_reg_field::type_id::create("load_update",,get_full_name());
      this.load_update.configure(this, 1, 0, "RW", 0, 1'h0, 1, 0, 0);
      this.load_source = uvm_reg_field::type_id::create("load_source",,get_full_name());
      this.load_source.configure(this, 1, 7, "RW", 0, 1'h0, 1, 0, 0);
   endfunction : build

   `uvm_object_utils(ral_reg_ad7771_src_load)

endclass : ral_reg_ad7771_src_load

class ral_block_ad7771 extends svm_reg_block;
   rand ral_reg_ad7771_channel_cfg channel_cfg0;
   rand uvm_reg_field channel_cfg0_bias;
   rand uvm_reg_field channel_cfg0_rx;
   rand uvm_reg_field channel_cfg0_ref_mon;
   rand uvm_reg_field channel_cfg0_gain;
   rand ral_reg_ad7771_channel_cfg channel_cfg1;
   rand uvm_reg_field channel_cfg1_bias;
   rand uvm_reg_field channel_cfg1_rx;
   rand uvm_reg_field channel_cfg1_ref_mon;
   rand uvm_reg_field channel_cfg1_gain;
   rand ral_reg_ad7771_channel_cfg channel_cfg2;
   rand uvm_reg_field channel_cfg2_bias;
   rand uvm_reg_field channel_cfg2_rx;
   rand uvm_reg_field channel_cfg2_ref_mon;
   rand uvm_reg_field channel_cfg2_gain;
   rand ral_reg_ad7771_channel_cfg channel_cfg3;
   rand uvm_reg_field channel_cfg3_bias;
   rand uvm_reg_field channel_cfg3_rx;
   rand uvm_reg_field channel_cfg3_ref_mon;
   rand uvm_reg_field channel_cfg3_gain;
   rand ral_reg_ad7771_channel_cfg channel_cfg4;
   rand uvm_reg_field channel_cfg4_bias;
   rand uvm_reg_field channel_cfg4_rx;
   rand uvm_reg_field channel_cfg4_ref_mon;
   rand uvm_reg_field channel_cfg4_gain;
   rand ral_reg_ad7771_channel_cfg channel_cfg5;
   rand uvm_reg_field channel_cfg5_bias;
   rand uvm_reg_field channel_cfg5_rx;
   rand uvm_reg_field channel_cfg5_ref_mon;
   rand uvm_reg_field channel_cfg5_gain;
   rand ral_reg_ad7771_channel_cfg channel_cfg6;
   rand uvm_reg_field channel_cfg6_bias;
   rand uvm_reg_field channel_cfg6_rx;
   rand uvm_reg_field channel_cfg6_ref_mon;
   rand uvm_reg_field channel_cfg6_gain;
   rand ral_reg_ad7771_channel_cfg channel_cfg7;
   rand uvm_reg_field channel_cfg7_bias;
   rand uvm_reg_field channel_cfg7_rx;
   rand uvm_reg_field channel_cfg7_ref_mon;
   rand uvm_reg_field channel_cfg7_gain;
   rand ral_reg_ad7771_clock_disable clock_disable;
   rand uvm_reg_field clock_disable_disable_ch0;
   rand uvm_reg_field clock_disable_disable_ch1;
   rand uvm_reg_field clock_disable_disable_ch2;
   rand uvm_reg_field clock_disable_disable_ch3;
   rand uvm_reg_field clock_disable_disable_ch4;
   rand uvm_reg_field clock_disable_disable_ch5;
   rand uvm_reg_field clock_disable_disable_ch6;
   rand uvm_reg_field clock_disable_disable_ch7;
   rand ral_reg_ad7771_channel_sync_offset channel_sync_offset0;
   rand uvm_reg_field channel_sync_offset0_sync_offset;
   rand ral_reg_ad7771_channel_sync_offset channel_sync_offset1;
   rand uvm_reg_field channel_sync_offset1_sync_offset;
   rand ral_reg_ad7771_channel_sync_offset channel_sync_offset2;
   rand uvm_reg_field channel_sync_offset2_sync_offset;
   rand ral_reg_ad7771_channel_sync_offset channel_sync_offset3;
   rand uvm_reg_field channel_sync_offset3_sync_offset;
   rand ral_reg_ad7771_channel_sync_offset channel_sync_offset4;
   rand uvm_reg_field channel_sync_offset4_sync_offset;
   rand ral_reg_ad7771_channel_sync_offset channel_sync_offset5;
   rand uvm_reg_field channel_sync_offset5_sync_offset;
   rand ral_reg_ad7771_channel_sync_offset channel_sync_offset6;
   rand uvm_reg_field channel_sync_offset6_sync_offset;
   rand ral_reg_ad7771_channel_sync_offset channel_sync_offset7;
   rand uvm_reg_field channel_sync_offset7_sync_offset;
   rand ral_reg_ad7771_user_cfg1 user_cfg1;
   rand uvm_reg_field user_cfg1_soft_reset;
   rand uvm_reg_field user_cfg1_pdb_rc_osc;
   rand uvm_reg_field user_cfg1_pdb_sar;
   rand uvm_reg_field user_cfg1_pdb_refout;
   rand uvm_reg_field user_cfg1_pdb_vcm;
   rand uvm_reg_field user_cfg1_power_mode;
   rand uvm_reg_field user_cfg1_all_ch_dis_mclk;
   rand ral_reg_ad7771_user_cfg2 user_cfg2;
   rand uvm_reg_field user_cfg2_spi_sync;
   rand uvm_reg_field user_cfg2_dout_drive_str;
   rand uvm_reg_field user_cfg2_sdo_drive_str;
   rand uvm_reg_field user_cfg2_sar_diag_en;
   rand uvm_reg_field user_cfg2_filter_mode;
   rand ral_reg_ad7771_user_cfg3 user_cfg3;
   rand uvm_reg_field user_cfg3_clk_qual_dis;
   rand uvm_reg_field user_cfg3_spi_subordinate;
   rand uvm_reg_field user_cfg3_convst_deglitch_dis;
   rand ral_reg_ad7771_data_output data_output;
   rand uvm_reg_field data_output_dclk_div;
   rand uvm_reg_field data_output_header_format;
   rand uvm_reg_field data_output_data_format;
   rand ral_reg_ad7771_mux_ctrl_ref_mtr mux_ctrl_ref_mtr;
   rand uvm_reg_field mux_ctrl_ref_mtr_mtr;
   rand uvm_reg_field mux_ctrl_ref_mtr_ref;
   rand ral_reg_ad7771_mux_ctrl_global mux_ctrl_global;
   rand uvm_reg_field mux_ctrl_global_global;
   rand ral_reg_ad7771_gpio_cfg gpio_cfg;
   rand uvm_reg_field gpio_cfg_op_en;
   rand ral_reg_ad7771_gpio_data gpio_data;
   rand uvm_reg_field gpio_data_write;
   uvm_reg_field gpio_data_read;
   rand ral_reg_ad7771_buffer_cfg1 buffer_cfg1;
   rand uvm_reg_field buffer_cfg1_ref_buf_neg_en;
   rand uvm_reg_field buffer_cfg1_ref_buf_pos_en;
   rand ral_reg_ad7771_buffer_cfg2 buffer_cfg2;
   rand uvm_reg_field buffer_cfg2_pdb_dldo_ovrdrv;
   rand uvm_reg_field buffer_cfg2_pdb_aldo2_ovrdrv;
   rand uvm_reg_field buffer_cfg2_pdb_aldo1_ovrdrv;
   rand uvm_reg_field buffer_cfg2_ref_buf_neg_preq;
   rand uvm_reg_field buffer_cfg2_ref_buf_pos_preq;
   rand ral_reg_ad7771_channel_offset_up channel_offset_up0;
   rand uvm_reg_field channel_offset_up0_offset;
   rand ral_reg_ad7771_channel_offset_up channel_offset_up1;
   rand uvm_reg_field channel_offset_up1_offset;
   rand ral_reg_ad7771_channel_offset_up channel_offset_up2;
   rand uvm_reg_field channel_offset_up2_offset;
   rand ral_reg_ad7771_channel_offset_up channel_offset_up3;
   rand uvm_reg_field channel_offset_up3_offset;
   rand ral_reg_ad7771_channel_offset_up channel_offset_up4;
   rand uvm_reg_field channel_offset_up4_offset;
   rand ral_reg_ad7771_channel_offset_up channel_offset_up5;
   rand uvm_reg_field channel_offset_up5_offset;
   rand ral_reg_ad7771_channel_offset_up channel_offset_up6;
   rand uvm_reg_field channel_offset_up6_offset;
   rand ral_reg_ad7771_channel_offset_up channel_offset_up7;
   rand uvm_reg_field channel_offset_up7_offset;
   rand ral_reg_ad7771_channel_offset_mid channel_offset_mid0;
   rand uvm_reg_field channel_offset_mid0_offset;
   rand ral_reg_ad7771_channel_offset_mid channel_offset_mid1;
   rand uvm_reg_field channel_offset_mid1_offset;
   rand ral_reg_ad7771_channel_offset_mid channel_offset_mid2;
   rand uvm_reg_field channel_offset_mid2_offset;
   rand ral_reg_ad7771_channel_offset_mid channel_offset_mid3;
   rand uvm_reg_field channel_offset_mid3_offset;
   rand ral_reg_ad7771_channel_offset_mid channel_offset_mid4;
   rand uvm_reg_field channel_offset_mid4_offset;
   rand ral_reg_ad7771_channel_offset_mid channel_offset_mid5;
   rand uvm_reg_field channel_offset_mid5_offset;
   rand ral_reg_ad7771_channel_offset_mid channel_offset_mid6;
   rand uvm_reg_field channel_offset_mid6_offset;
   rand ral_reg_ad7771_channel_offset_mid channel_offset_mid7;
   rand uvm_reg_field channel_offset_mid7_offset;
   rand ral_reg_ad7771_channel_offset_low channel_offset_low0;
   rand uvm_reg_field channel_offset_low0_offset;
   rand ral_reg_ad7771_channel_offset_low channel_offset_low1;
   rand uvm_reg_field channel_offset_low1_offset;
   rand ral_reg_ad7771_channel_offset_low channel_offset_low2;
   rand uvm_reg_field channel_offset_low2_offset;
   rand ral_reg_ad7771_channel_offset_low channel_offset_low3;
   rand uvm_reg_field channel_offset_low3_offset;
   rand ral_reg_ad7771_channel_offset_low channel_offset_low4;
   rand uvm_reg_field channel_offset_low4_offset;
   rand ral_reg_ad7771_channel_offset_low channel_offset_low5;
   rand uvm_reg_field channel_offset_low5_offset;
   rand ral_reg_ad7771_channel_offset_low channel_offset_low6;
   rand uvm_reg_field channel_offset_low6_offset;
   rand ral_reg_ad7771_channel_offset_low channel_offset_low7;
   rand uvm_reg_field channel_offset_low7_offset;
   rand ral_reg_ad7771_channel_gain_up channel_gain_up0;
   rand uvm_reg_field channel_gain_up0_gain;
   rand ral_reg_ad7771_channel_gain_up channel_gain_up1;
   rand uvm_reg_field channel_gain_up1_gain;
   rand ral_reg_ad7771_channel_gain_up channel_gain_up2;
   rand uvm_reg_field channel_gain_up2_gain;
   rand ral_reg_ad7771_channel_gain_up channel_gain_up3;
   rand uvm_reg_field channel_gain_up3_gain;
   rand ral_reg_ad7771_channel_gain_up channel_gain_up4;
   rand uvm_reg_field channel_gain_up4_gain;
   rand ral_reg_ad7771_channel_gain_up channel_gain_up5;
   rand uvm_reg_field channel_gain_up5_gain;
   rand ral_reg_ad7771_channel_gain_up channel_gain_up6;
   rand uvm_reg_field channel_gain_up6_gain;
   rand ral_reg_ad7771_channel_gain_up channel_gain_up7;
   rand uvm_reg_field channel_gain_up7_gain;
   rand ral_reg_ad7771_channel_gain_mid channel_gain_mid0;
   rand uvm_reg_field channel_gain_mid0_gain;
   rand ral_reg_ad7771_channel_gain_mid channel_gain_mid1;
   rand uvm_reg_field channel_gain_mid1_gain;
   rand ral_reg_ad7771_channel_gain_mid channel_gain_mid2;
   rand uvm_reg_field channel_gain_mid2_gain;
   rand ral_reg_ad7771_channel_gain_mid channel_gain_mid3;
   rand uvm_reg_field channel_gain_mid3_gain;
   rand ral_reg_ad7771_channel_gain_mid channel_gain_mid4;
   rand uvm_reg_field channel_gain_mid4_gain;
   rand ral_reg_ad7771_channel_gain_mid channel_gain_mid5;
   rand uvm_reg_field channel_gain_mid5_gain;
   rand ral_reg_ad7771_channel_gain_mid channel_gain_mid6;
   rand uvm_reg_field channel_gain_mid6_gain;
   rand ral_reg_ad7771_channel_gain_mid channel_gain_mid7;
   rand uvm_reg_field channel_gain_mid7_gain;
   rand ral_reg_ad7771_channel_gain_low channel_gain_low0;
   rand uvm_reg_field channel_gain_low0_gain;
   rand ral_reg_ad7771_channel_gain_low channel_gain_low1;
   rand uvm_reg_field channel_gain_low1_gain;
   rand ral_reg_ad7771_channel_gain_low channel_gain_low2;
   rand uvm_reg_field channel_gain_low2_gain;
   rand ral_reg_ad7771_channel_gain_low channel_gain_low3;
   rand uvm_reg_field channel_gain_low3_gain;
   rand ral_reg_ad7771_channel_gain_low channel_gain_low4;
   rand uvm_reg_field channel_gain_low4_gain;
   rand ral_reg_ad7771_channel_gain_low channel_gain_low5;
   rand uvm_reg_field channel_gain_low5_gain;
   rand ral_reg_ad7771_channel_gain_low channel_gain_low6;
   rand uvm_reg_field channel_gain_low6_gain;
   rand ral_reg_ad7771_channel_gain_low channel_gain_low7;
   rand uvm_reg_field channel_gain_low7_gain;
   rand ral_reg_ad7771_channel_status channel_status0;
   uvm_reg_field channel_status0_err_ref_det;
   uvm_reg_field channel_status0_err_ainp_ov;
   uvm_reg_field channel_status0_err_ainp_uv;
   uvm_reg_field channel_status0_err_ainm_ov;
   uvm_reg_field channel_status0_err_ainm_uv;
   rand ral_reg_ad7771_channel_status channel_status1;
   uvm_reg_field channel_status1_err_ref_det;
   uvm_reg_field channel_status1_err_ainp_ov;
   uvm_reg_field channel_status1_err_ainp_uv;
   uvm_reg_field channel_status1_err_ainm_ov;
   uvm_reg_field channel_status1_err_ainm_uv;
   rand ral_reg_ad7771_channel_status channel_status2;
   uvm_reg_field channel_status2_err_ref_det;
   uvm_reg_field channel_status2_err_ainp_ov;
   uvm_reg_field channel_status2_err_ainp_uv;
   uvm_reg_field channel_status2_err_ainm_ov;
   uvm_reg_field channel_status2_err_ainm_uv;
   rand ral_reg_ad7771_channel_status channel_status3;
   uvm_reg_field channel_status3_err_ref_det;
   uvm_reg_field channel_status3_err_ainp_ov;
   uvm_reg_field channel_status3_err_ainp_uv;
   uvm_reg_field channel_status3_err_ainm_ov;
   uvm_reg_field channel_status3_err_ainm_uv;
   rand ral_reg_ad7771_channel_status channel_status4;
   uvm_reg_field channel_status4_err_ref_det;
   uvm_reg_field channel_status4_err_ainp_ov;
   uvm_reg_field channel_status4_err_ainp_uv;
   uvm_reg_field channel_status4_err_ainm_ov;
   uvm_reg_field channel_status4_err_ainm_uv;
   rand ral_reg_ad7771_channel_status channel_status5;
   uvm_reg_field channel_status5_err_ref_det;
   uvm_reg_field channel_status5_err_ainp_ov;
   uvm_reg_field channel_status5_err_ainp_uv;
   uvm_reg_field channel_status5_err_ainm_ov;
   uvm_reg_field channel_status5_err_ainm_uv;
   rand ral_reg_ad7771_channel_status channel_status6;
   uvm_reg_field channel_status6_err_ref_det;
   uvm_reg_field channel_status6_err_ainp_ov;
   uvm_reg_field channel_status6_err_ainp_uv;
   uvm_reg_field channel_status6_err_ainm_ov;
   uvm_reg_field channel_status6_err_ainm_uv;
   rand ral_reg_ad7771_channel_status channel_status7;
   uvm_reg_field channel_status7_err_ref_det;
   uvm_reg_field channel_status7_err_ainp_ov;
   uvm_reg_field channel_status7_err_ainp_uv;
   uvm_reg_field channel_status7_err_ainm_ov;
   uvm_reg_field channel_status7_err_ainm_uv;
   rand ral_reg_ad7771_channel_dsp_err channel_dsp_err0;
   uvm_reg_field channel_dsp_err0_err_output_sat0;
   uvm_reg_field channel_dsp_err0_err_filter_sat0;
   uvm_reg_field channel_dsp_err0_err_mod_sat0;
   uvm_reg_field channel_dsp_err0_err_output_sat1;
   uvm_reg_field channel_dsp_err0_err_filter_sat1;
   uvm_reg_field channel_dsp_err0_err_mod_sat1;
   rand ral_reg_ad7771_channel_dsp_err channel_dsp_err1;
   uvm_reg_field channel_dsp_err1_err_output_sat2;
   uvm_reg_field channel_dsp_err1_err_filter_sat2;
   uvm_reg_field channel_dsp_err1_err_mod_sat2;
   uvm_reg_field channel_dsp_err1_err_output_sat3;
   uvm_reg_field channel_dsp_err1_err_filter_sat3;
   uvm_reg_field channel_dsp_err1_err_mod_sat3;
   rand ral_reg_ad7771_channel_dsp_err channel_dsp_err2;
   uvm_reg_field channel_dsp_err2_err_output_sat4;
   uvm_reg_field channel_dsp_err2_err_filter_sat4;
   uvm_reg_field channel_dsp_err2_err_mod_sat4;
   uvm_reg_field channel_dsp_err2_err_output_sat5;
   uvm_reg_field channel_dsp_err2_err_filter_sat5;
   uvm_reg_field channel_dsp_err2_err_mod_sat5;
   rand ral_reg_ad7771_channel_dsp_err channel_dsp_err3;
   uvm_reg_field channel_dsp_err3_err_output_sat6;
   uvm_reg_field channel_dsp_err3_err_filter_sat6;
   uvm_reg_field channel_dsp_err3_err_mod_sat6;
   uvm_reg_field channel_dsp_err3_err_output_sat7;
   uvm_reg_field channel_dsp_err3_err_filter_sat7;
   uvm_reg_field channel_dsp_err3_err_mod_sat7;
   rand ral_reg_ad7771_channel_test_en channel_test_en;
   rand uvm_reg_field channel_test_en_ref_det_test_en;
   rand uvm_reg_field channel_test_en_ainp_ov_test_en;
   rand uvm_reg_field channel_test_en_ainp_uv_test_en;
   rand uvm_reg_field channel_test_en_ainm_ov_test_en;
   rand uvm_reg_field channel_test_en_ainm_uv_test_en;
   rand uvm_reg_field channel_test_en_mod_sat_test_en;
   rand uvm_reg_field channel_test_en_filter_sat_test_en;
   rand uvm_reg_field channel_test_en_output_sat_test_en;
   rand ral_reg_ad7771_general_err1 general_err1;
   uvm_reg_field general_err1_spi_crc_err;
   uvm_reg_field general_err1_spi_invalid_write_err;
   uvm_reg_field general_err1_spi_invalid_read_err;
   uvm_reg_field general_err1_spi_clk_count_err;
   uvm_reg_field general_err1_rom_crc_err;
   uvm_reg_field general_err1_memmap_crc_err;
   rand ral_reg_ad7771_general_err1_en general_err1_en;
   rand uvm_reg_field general_err1_en_spi_crc_err_en;
   rand uvm_reg_field general_err1_en_spi_invalid_write_err_en;
   rand uvm_reg_field general_err1_en_spi_invalid_read_err_en;
   rand uvm_reg_field general_err1_en_spi_clk_count_err_en;
   rand uvm_reg_field general_err1_en_rom_crc_err_en;
   rand uvm_reg_field general_err1_en_memmap_crc_err_en;
   rand ral_reg_ad7771_general_err2 general_err2;
   uvm_reg_field general_err2_dldo_psm_err;
   uvm_reg_field general_err2_aldo2_psm_err;
   uvm_reg_field general_err2_aldo1_psm_err;
   uvm_reg_field general_err2_ext_mclk_switch_err;
   uvm_reg_field general_err2_reset_detected;
   rand ral_reg_ad7771_general_err2_en general_err2_en;
   rand uvm_reg_field general_err2_en_ldo_psm_trip_test;
   rand uvm_reg_field general_err2_en_dldo_psm_err_en;
   rand uvm_reg_field general_err2_en_aldo_psm_err_en;
   rand uvm_reg_field general_err2_en_reset_detected_en;
   rand ral_reg_ad7771_error_status1 error_status1;
   uvm_reg_field error_status1_err_loc_ch0;
   uvm_reg_field error_status1_err_loc_ch1;
   uvm_reg_field error_status1_err_loc_ch2;
   uvm_reg_field error_status1_err_loc_ch3;
   uvm_reg_field error_status1_err_loc_ch4;
   uvm_reg_field error_status1_chip_error1;
   rand ral_reg_ad7771_error_status2 error_status2;
   uvm_reg_field error_status2_err_loc_ch5;
   uvm_reg_field error_status2_err_loc_ch6;
   uvm_reg_field error_status2_err_loc_ch7;
   uvm_reg_field error_status2_err_loc_gen0;
   uvm_reg_field error_status2_err_loc_gen1;
   uvm_reg_field error_status2_chip_error2;
   rand ral_reg_ad7771_error_status3 error_status3;
   uvm_reg_field error_status3_err_loc_sat_ch0;
   uvm_reg_field error_status3_err_loc_sat_ch1;
   uvm_reg_field error_status3_err_loc_sat_ch2;
   uvm_reg_field error_status3_err_loc_sat_ch3;
   uvm_reg_field error_status3_init_complete;
   uvm_reg_field error_status3_chip_error3;
   rand ral_reg_ad7771_src_n_msb src_n_msb;
   rand uvm_reg_field src_n_msb_src_n;
   rand ral_reg_ad7771_src_n_lsb src_n_lsb;
   rand uvm_reg_field src_n_lsb_src_n;
   rand ral_reg_ad7771_src_if_msb src_if_msb;
   rand uvm_reg_field src_if_msb_src_if;
   rand ral_reg_ad7771_src_if_lsb src_if_lsb;
   rand uvm_reg_field src_if_lsb_src_if;
   rand ral_reg_ad7771_src_load src_load;
   rand uvm_reg_field src_load_load_update;
   rand uvm_reg_field src_load_load_source;

   function new(string name = "ad7771");
      super.new(name, UVM_NO_COVERAGE);
   endfunction : new

   virtual function void build();
      this.default_map = create_map("", 0, 1, UVM_LITTLE_ENDIAN, 0);
      this.channel_cfg0 = ral_reg_ad7771_channel_cfg::type_id::create("channel_cfg0",,get_full_name());
      this.channel_cfg0.configure(this, null, "");
      this.channel_cfg0.build();
      this.channel_cfg0.add_hdl_path_slice("channel_cfg0__read_data", 0, 8);
      this.channel_cfg0_bias = this.channel_cfg0.bias;
      this.channel_cfg0_rx = this.channel_cfg0.rx;
      this.channel_cfg0_ref_mon = this.channel_cfg0.ref_mon;
      this.channel_cfg0_gain = this.channel_cfg0.gain;
      this.default_map.add_reg(this.channel_cfg0, `UVM_REG_ADDR_WIDTH'h0, "RW", 0);
      this.channel_cfg1 = ral_reg_ad7771_channel_cfg::type_id::create("channel_cfg1",,get_full_name());
      this.channel_cfg1.configure(this, null, "");
      this.channel_cfg1.build();
      this.channel_cfg1.add_hdl_path_slice("channel_cfg1__read_data", 0, 8);
      this.channel_cfg1_bias = this.channel_cfg1.bias;
      this.channel_cfg1_rx = this.channel_cfg1.rx;
      this.channel_cfg1_ref_mon = this.channel_cfg1.ref_mon;
      this.channel_cfg1_gain = this.channel_cfg1.gain;
      this.default_map.add_reg(this.channel_cfg1, `UVM_REG_ADDR_WIDTH'h1, "RW", 0);
      this.channel_cfg2 = ral_reg_ad7771_channel_cfg::type_id::create("channel_cfg2",,get_full_name());
      this.channel_cfg2.configure(this, null, "");
      this.channel_cfg2.build();
      this.channel_cfg2.add_hdl_path_slice("channel_cfg2__read_data", 0, 8);
      this.channel_cfg2_bias = this.channel_cfg2.bias;
      this.channel_cfg2_rx = this.channel_cfg2.rx;
      this.channel_cfg2_ref_mon = this.channel_cfg2.ref_mon;
      this.channel_cfg2_gain = this.channel_cfg2.gain;
      this.default_map.add_reg(this.channel_cfg2, `UVM_REG_ADDR_WIDTH'h2, "RW", 0);
      this.channel_cfg3 = ral_reg_ad7771_channel_cfg::type_id::create("channel_cfg3",,get_full_name());
      this.channel_cfg3.configure(this, null, "");
      this.channel_cfg3.build();
      this.channel_cfg3.add_hdl_path_slice("channel_cfg3__read_data", 0, 8);
      this.channel_cfg3_bias = this.channel_cfg3.bias;
      this.channel_cfg3_rx = this.channel_cfg3.rx;
      this.channel_cfg3_ref_mon = this.channel_cfg3.ref_mon;
      this.channel_cfg3_gain = this.channel_cfg3.gain;
      this.default_map.add_reg(this.channel_cfg3, `UVM_REG_ADDR_WIDTH'h3, "RW", 0);
      this.channel_cfg4 = ral_reg_ad7771_channel_cfg::type_id::create("channel_cfg4",,get_full_name());
      this.channel_cfg4.configure(this, null, "");
      this.channel_cfg4.build();
      this.channel_cfg4.add_hdl_path_slice("channel_cfg4__read_data", 0, 8);
      this.channel_cfg4_bias = this.channel_cfg4.bias;
      this.channel_cfg4_rx = this.channel_cfg4.rx;
      this.channel_cfg4_ref_mon = this.channel_cfg4.ref_mon;
      this.channel_cfg4_gain = this.channel_cfg4.gain;
      this.default_map.add_reg(this.channel_cfg4, `UVM_REG_ADDR_WIDTH'h4, "RW", 0);
      this.channel_cfg5 = ral_reg_ad7771_channel_cfg::type_id::create("channel_cfg5",,get_full_name());
      this.channel_cfg5.configure(this, null, "");
      this.channel_cfg5.build();
      this.channel_cfg5.add_hdl_path_slice("channel_cfg5__read_data", 0, 8);
      this.channel_cfg5_bias = this.channel_cfg5.bias;
      this.channel_cfg5_rx = this.channel_cfg5.rx;
      this.channel_cfg5_ref_mon = this.channel_cfg5.ref_mon;
      this.channel_cfg5_gain = this.channel_cfg5.gain;
      this.default_map.add_reg(this.channel_cfg5, `UVM_REG_ADDR_WIDTH'h5, "RW", 0);
      this.channel_cfg6 = ral_reg_ad7771_channel_cfg::type_id::create("channel_cfg6",,get_full_name());
      this.channel_cfg6.configure(this, null, "");
      this.channel_cfg6.build();
      this.channel_cfg6.add_hdl_path_slice("channel_cfg6__read_data", 0, 8);
      this.channel_cfg6_bias = this.channel_cfg6.bias;
      this.channel_cfg6_rx = this.channel_cfg6.rx;
      this.channel_cfg6_ref_mon = this.channel_cfg6.ref_mon;
      this.channel_cfg6_gain = this.channel_cfg6.gain;
      this.default_map.add_reg(this.channel_cfg6, `UVM_REG_ADDR_WIDTH'h6, "RW", 0);
      this.channel_cfg7 = ral_reg_ad7771_channel_cfg::type_id::create("channel_cfg7",,get_full_name());
      this.channel_cfg7.configure(this, null, "");
      this.channel_cfg7.build();
      this.channel_cfg7.add_hdl_path_slice("channel_cfg7__read_data", 0, 8);
      this.channel_cfg7_bias = this.channel_cfg7.bias;
      this.channel_cfg7_rx = this.channel_cfg7.rx;
      this.channel_cfg7_ref_mon = this.channel_cfg7.ref_mon;
      this.channel_cfg7_gain = this.channel_cfg7.gain;
      this.default_map.add_reg(this.channel_cfg7, `UVM_REG_ADDR_WIDTH'h7, "RW", 0);
      this.clock_disable = ral_reg_ad7771_clock_disable::type_id::create("clock_disable",,get_full_name());
      this.clock_disable.configure(this, null, "");
      this.clock_disable.build();
      this.clock_disable.add_hdl_path_slice("clock_disable__read_data", 0, 8);
      this.clock_disable_disable_ch0 = this.clock_disable.disable_ch0;
      this.clock_disable_disable_ch1 = this.clock_disable.disable_ch1;
      this.clock_disable_disable_ch2 = this.clock_disable.disable_ch2;
      this.clock_disable_disable_ch3 = this.clock_disable.disable_ch3;
      this.clock_disable_disable_ch4 = this.clock_disable.disable_ch4;
      this.clock_disable_disable_ch5 = this.clock_disable.disable_ch5;
      this.clock_disable_disable_ch6 = this.clock_disable.disable_ch6;
      this.clock_disable_disable_ch7 = this.clock_disable.disable_ch7;
      this.default_map.add_reg(this.clock_disable, `UVM_REG_ADDR_WIDTH'h8, "RW", 0);
      this.channel_sync_offset0 = ral_reg_ad7771_channel_sync_offset::type_id::create("channel_sync_offset0",,get_full_name());
      this.channel_sync_offset0.configure(this, null, "");
      this.channel_sync_offset0.build();
      this.channel_sync_offset0.add_hdl_path_slice("channel_sync_offset0__read_data", 0, 8);
      this.channel_sync_offset0_sync_offset = this.channel_sync_offset0.sync_offset;
      this.default_map.add_reg(this.channel_sync_offset0, `UVM_REG_ADDR_WIDTH'h9, "RW", 0);
      this.channel_sync_offset1 = ral_reg_ad7771_channel_sync_offset::type_id::create("channel_sync_offset1",,get_full_name());
      this.channel_sync_offset1.configure(this, null, "");
      this.channel_sync_offset1.build();
      this.channel_sync_offset1.add_hdl_path_slice("channel_sync_offset1__read_data", 0, 8);
      this.channel_sync_offset1_sync_offset = this.channel_sync_offset1.sync_offset;
      this.default_map.add_reg(this.channel_sync_offset1, `UVM_REG_ADDR_WIDTH'hA, "RW", 0);
      this.channel_sync_offset2 = ral_reg_ad7771_channel_sync_offset::type_id::create("channel_sync_offset2",,get_full_name());
      this.channel_sync_offset2.configure(this, null, "");
      this.channel_sync_offset2.build();
      this.channel_sync_offset2.add_hdl_path_slice("channel_sync_offset2__read_data", 0, 8);
      this.channel_sync_offset2_sync_offset = this.channel_sync_offset2.sync_offset;
      this.default_map.add_reg(this.channel_sync_offset2, `UVM_REG_ADDR_WIDTH'hB, "RW", 0);
      this.channel_sync_offset3 = ral_reg_ad7771_channel_sync_offset::type_id::create("channel_sync_offset3",,get_full_name());
      this.channel_sync_offset3.configure(this, null, "");
      this.channel_sync_offset3.build();
      this.channel_sync_offset3.add_hdl_path_slice("channel_sync_offset3__read_data", 0, 8);
      this.channel_sync_offset3_sync_offset = this.channel_sync_offset3.sync_offset;
      this.default_map.add_reg(this.channel_sync_offset3, `UVM_REG_ADDR_WIDTH'hC, "RW", 0);
      this.channel_sync_offset4 = ral_reg_ad7771_channel_sync_offset::type_id::create("channel_sync_offset4",,get_full_name());
      this.channel_sync_offset4.configure(this, null, "");
      this.channel_sync_offset4.build();
      this.channel_sync_offset4.add_hdl_path_slice("channel_sync_offset4__read_data", 0, 8);
      this.channel_sync_offset4_sync_offset = this.channel_sync_offset4.sync_offset;
      this.default_map.add_reg(this.channel_sync_offset4, `UVM_REG_ADDR_WIDTH'hD, "RW", 0);
      this.channel_sync_offset5 = ral_reg_ad7771_channel_sync_offset::type_id::create("channel_sync_offset5",,get_full_name());
      this.channel_sync_offset5.configure(this, null, "");
      this.channel_sync_offset5.build();
      this.channel_sync_offset5.add_hdl_path_slice("channel_sync_offset5__read_data", 0, 8);
      this.channel_sync_offset5_sync_offset = this.channel_sync_offset5.sync_offset;
      this.default_map.add_reg(this.channel_sync_offset5, `UVM_REG_ADDR_WIDTH'hE, "RW", 0);
      this.channel_sync_offset6 = ral_reg_ad7771_channel_sync_offset::type_id::create("channel_sync_offset6",,get_full_name());
      this.channel_sync_offset6.configure(this, null, "");
      this.channel_sync_offset6.build();
      this.channel_sync_offset6.add_hdl_path_slice("channel_sync_offset6__read_data", 0, 8);
      this.channel_sync_offset6_sync_offset = this.channel_sync_offset6.sync_offset;
      this.default_map.add_reg(this.channel_sync_offset6, `UVM_REG_ADDR_WIDTH'hF, "RW", 0);
      this.channel_sync_offset7 = ral_reg_ad7771_channel_sync_offset::type_id::create("channel_sync_offset7",,get_full_name());
      this.channel_sync_offset7.configure(this, null, "");
      this.channel_sync_offset7.build();
      this.channel_sync_offset7.add_hdl_path_slice("channel_sync_offset7__read_data", 0, 8);
      this.channel_sync_offset7_sync_offset = this.channel_sync_offset7.sync_offset;
      this.default_map.add_reg(this.channel_sync_offset7, `UVM_REG_ADDR_WIDTH'h10, "RW", 0);
      this.user_cfg1 = ral_reg_ad7771_user_cfg1::type_id::create("user_cfg1",,get_full_name());
      this.user_cfg1.configure(this, null, "");
      this.user_cfg1.build();
      this.user_cfg1.add_hdl_path_slice("user_cfg1__read_data", 0, 8);
      this.user_cfg1_soft_reset = this.user_cfg1.soft_reset;
      this.user_cfg1_pdb_rc_osc = this.user_cfg1.pdb_rc_osc;
      this.user_cfg1_pdb_sar = this.user_cfg1.pdb_sar;
      this.user_cfg1_pdb_refout = this.user_cfg1.pdb_refout;
      this.user_cfg1_pdb_vcm = this.user_cfg1.pdb_vcm;
      this.user_cfg1_power_mode = this.user_cfg1.power_mode;
      this.user_cfg1_all_ch_dis_mclk = this.user_cfg1.all_ch_dis_mclk;
      this.default_map.add_reg(this.user_cfg1, `UVM_REG_ADDR_WIDTH'h11, "RW", 0);
      this.user_cfg2 = ral_reg_ad7771_user_cfg2::type_id::create("user_cfg2",,get_full_name());
      this.user_cfg2.configure(this, null, "");
      this.user_cfg2.build();
      this.user_cfg2.add_hdl_path_slice("user_cfg2__read_data", 0, 8);
      this.user_cfg2_spi_sync = this.user_cfg2.spi_sync;
      this.user_cfg2_dout_drive_str = this.user_cfg2.dout_drive_str;
      this.user_cfg2_sdo_drive_str = this.user_cfg2.sdo_drive_str;
      this.user_cfg2_sar_diag_en = this.user_cfg2.sar_diag_en;
      this.user_cfg2_filter_mode = this.user_cfg2.filter_mode;
      this.default_map.add_reg(this.user_cfg2, `UVM_REG_ADDR_WIDTH'h12, "RW", 0);
      this.user_cfg3 = ral_reg_ad7771_user_cfg3::type_id::create("user_cfg3",,get_full_name());
      this.user_cfg3.configure(this, null, "");
      this.user_cfg3.build();
      this.user_cfg3.add_hdl_path_slice("user_cfg3__read_data", 0, 8);
      this.user_cfg3_clk_qual_dis = this.user_cfg3.clk_qual_dis;
      this.user_cfg3_spi_subordinate = this.user_cfg3.spi_subordinate;
      this.user_cfg3_convst_deglitch_dis = this.user_cfg3.convst_deglitch_dis;
      this.default_map.add_reg(this.user_cfg3, `UVM_REG_ADDR_WIDTH'h13, "RW", 0);
      this.data_output = ral_reg_ad7771_data_output::type_id::create("data_output",,get_full_name());
      this.data_output.configure(this, null, "");
      this.data_output.build();
      this.data_output.add_hdl_path_slice("data_output__read_data", 0, 8);
      this.data_output_dclk_div = this.data_output.dclk_div;
      this.data_output_header_format = this.data_output.header_format;
      this.data_output_data_format = this.data_output.data_format;
      this.default_map.add_reg(this.data_output, `UVM_REG_ADDR_WIDTH'h14, "RW", 0);
      this.mux_ctrl_ref_mtr = ral_reg_ad7771_mux_ctrl_ref_mtr::type_id::create("mux_ctrl_ref_mtr",,get_full_name());
      this.mux_ctrl_ref_mtr.configure(this, null, "");
      this.mux_ctrl_ref_mtr.build();
      this.mux_ctrl_ref_mtr.add_hdl_path_slice("mux_ctrl_ref_mtr__read_data", 0, 8);
      this.mux_ctrl_ref_mtr_mtr = this.mux_ctrl_ref_mtr.mtr;
      this.mux_ctrl_ref_mtr_ref = this.mux_ctrl_ref_mtr.ref;
      this.default_map.add_reg(this.mux_ctrl_ref_mtr, `UVM_REG_ADDR_WIDTH'h15, "RW", 0);
      this.mux_ctrl_global = ral_reg_ad7771_mux_ctrl_global::type_id::create("mux_ctrl_global",,get_full_name());
      this.mux_ctrl_global.configure(this, null, "");
      this.mux_ctrl_global.build();
      this.mux_ctrl_global.add_hdl_path_slice("mux_ctrl_global__read_data", 0, 8);
      this.mux_ctrl_global_global = this.mux_ctrl_global.global;
      this.default_map.add_reg(this.mux_ctrl_global, `UVM_REG_ADDR_WIDTH'h16, "RW", 0);
      this.gpio_cfg = ral_reg_ad7771_gpio_cfg::type_id::create("gpio_cfg",,get_full_name());
      this.gpio_cfg.configure(this, null, "");
      this.gpio_cfg.build();
      this.gpio_cfg.add_hdl_path_slice("gpio_cfg__read_data", 0, 8);
      this.gpio_cfg_op_en = this.gpio_cfg.op_en;
      this.default_map.add_reg(this.gpio_cfg, `UVM_REG_ADDR_WIDTH'h17, "RW", 0);
      this.gpio_data = ral_reg_ad7771_gpio_data::type_id::create("gpio_data",,get_full_name());
      this.gpio_data.configure(this, null, "");
      this.gpio_data.build();
      this.gpio_data.add_hdl_path_slice("gpio_data__read_data", 0, 8);
      this.gpio_data_write = this.gpio_data.write;
      this.gpio_data_read = this.gpio_data.read;
      this.default_map.add_reg(this.gpio_data, `UVM_REG_ADDR_WIDTH'h18, "RW", 0);
      this.buffer_cfg1 = ral_reg_ad7771_buffer_cfg1::type_id::create("buffer_cfg1",,get_full_name());
      this.buffer_cfg1.configure(this, null, "");
      this.buffer_cfg1.build();
      this.buffer_cfg1.add_hdl_path_slice("buffer_cfg1__read_data", 0, 8);
      this.buffer_cfg1_ref_buf_neg_en = this.buffer_cfg1.ref_buf_neg_en;
      this.buffer_cfg1_ref_buf_pos_en = this.buffer_cfg1.ref_buf_pos_en;
      this.default_map.add_reg(this.buffer_cfg1, `UVM_REG_ADDR_WIDTH'h19, "RW", 0);
      this.buffer_cfg2 = ral_reg_ad7771_buffer_cfg2::type_id::create("buffer_cfg2",,get_full_name());
      this.buffer_cfg2.configure(this, null, "");
      this.buffer_cfg2.build();
      this.buffer_cfg2.add_hdl_path_slice("buffer_cfg2__read_data", 0, 8);
      this.buffer_cfg2_pdb_dldo_ovrdrv = this.buffer_cfg2.pdb_dldo_ovrdrv;
      this.buffer_cfg2_pdb_aldo2_ovrdrv = this.buffer_cfg2.pdb_aldo2_ovrdrv;
      this.buffer_cfg2_pdb_aldo1_ovrdrv = this.buffer_cfg2.pdb_aldo1_ovrdrv;
      this.buffer_cfg2_ref_buf_neg_preq = this.buffer_cfg2.ref_buf_neg_preq;
      this.buffer_cfg2_ref_buf_pos_preq = this.buffer_cfg2.ref_buf_pos_preq;
      this.default_map.add_reg(this.buffer_cfg2, `UVM_REG_ADDR_WIDTH'h1A, "RW", 0);
      this.channel_offset_up0 = ral_reg_ad7771_channel_offset_up::type_id::create("channel_offset_up0",,get_full_name());
      this.channel_offset_up0.configure(this, null, "");
      this.channel_offset_up0.build();
      this.channel_offset_up0.add_hdl_path_slice("channel_offset_up0__read_data", 0, 8);
      this.channel_offset_up0_offset = this.channel_offset_up0.offset;
      this.default_map.add_reg(this.channel_offset_up0, `UVM_REG_ADDR_WIDTH'h1B, "RW", 0);
      this.channel_offset_up1 = ral_reg_ad7771_channel_offset_up::type_id::create("channel_offset_up1",,get_full_name());
      this.channel_offset_up1.configure(this, null, "");
      this.channel_offset_up1.build();
      this.channel_offset_up1.add_hdl_path_slice("channel_offset_up1__read_data", 0, 8);
      this.channel_offset_up1_offset = this.channel_offset_up1.offset;
      this.default_map.add_reg(this.channel_offset_up1, `UVM_REG_ADDR_WIDTH'h1C, "RW", 0);
      this.channel_offset_up2 = ral_reg_ad7771_channel_offset_up::type_id::create("channel_offset_up2",,get_full_name());
      this.channel_offset_up2.configure(this, null, "");
      this.channel_offset_up2.build();
      this.channel_offset_up2.add_hdl_path_slice("channel_offset_up2__read_data", 0, 8);
      this.channel_offset_up2_offset = this.channel_offset_up2.offset;
      this.default_map.add_reg(this.channel_offset_up2, `UVM_REG_ADDR_WIDTH'h1D, "RW", 0);
      this.channel_offset_up3 = ral_reg_ad7771_channel_offset_up::type_id::create("channel_offset_up3",,get_full_name());
      this.channel_offset_up3.configure(this, null, "");
      this.channel_offset_up3.build();
      this.channel_offset_up3.add_hdl_path_slice("channel_offset_up3__read_data", 0, 8);
      this.channel_offset_up3_offset = this.channel_offset_up3.offset;
      this.default_map.add_reg(this.channel_offset_up3, `UVM_REG_ADDR_WIDTH'h1E, "RW", 0);
      this.channel_offset_up4 = ral_reg_ad7771_channel_offset_up::type_id::create("channel_offset_up4",,get_full_name());
      this.channel_offset_up4.configure(this, null, "");
      this.channel_offset_up4.build();
      this.channel_offset_up4.add_hdl_path_slice("channel_offset_up4__read_data", 0, 8);
      this.channel_offset_up4_offset = this.channel_offset_up4.offset;
      this.default_map.add_reg(this.channel_offset_up4, `UVM_REG_ADDR_WIDTH'h1F, "RW", 0);
      this.channel_offset_up5 = ral_reg_ad7771_channel_offset_up::type_id::create("channel_offset_up5",,get_full_name());
      this.channel_offset_up5.configure(this, null, "");
      this.channel_offset_up5.build();
      this.channel_offset_up5.add_hdl_path_slice("channel_offset_up5__read_data", 0, 8);
      this.channel_offset_up5_offset = this.channel_offset_up5.offset;
      this.default_map.add_reg(this.channel_offset_up5, `UVM_REG_ADDR_WIDTH'h20, "RW", 0);
      this.channel_offset_up6 = ral_reg_ad7771_channel_offset_up::type_id::create("channel_offset_up6",,get_full_name());
      this.channel_offset_up6.configure(this, null, "");
      this.channel_offset_up6.build();
      this.channel_offset_up6.add_hdl_path_slice("channel_offset_up6__read_data", 0, 8);
      this.channel_offset_up6_offset = this.channel_offset_up6.offset;
      this.default_map.add_reg(this.channel_offset_up6, `UVM_REG_ADDR_WIDTH'h21, "RW", 0);
      this.channel_offset_up7 = ral_reg_ad7771_channel_offset_up::type_id::create("channel_offset_up7",,get_full_name());
      this.channel_offset_up7.configure(this, null, "");
      this.channel_offset_up7.build();
      this.channel_offset_up7.add_hdl_path_slice("channel_offset_up7__read_data", 0, 8);
      this.channel_offset_up7_offset = this.channel_offset_up7.offset;
      this.default_map.add_reg(this.channel_offset_up7, `UVM_REG_ADDR_WIDTH'h22, "RW", 0);
      this.channel_offset_mid0 = ral_reg_ad7771_channel_offset_mid::type_id::create("channel_offset_mid0",,get_full_name());
      this.channel_offset_mid0.configure(this, null, "");
      this.channel_offset_mid0.build();
      this.channel_offset_mid0.add_hdl_path_slice("channel_offset_mid0__read_data", 0, 8);
      this.channel_offset_mid0_offset = this.channel_offset_mid0.offset;
      this.default_map.add_reg(this.channel_offset_mid0, `UVM_REG_ADDR_WIDTH'h23, "RW", 0);
      this.channel_offset_mid1 = ral_reg_ad7771_channel_offset_mid::type_id::create("channel_offset_mid1",,get_full_name());
      this.channel_offset_mid1.configure(this, null, "");
      this.channel_offset_mid1.build();
      this.channel_offset_mid1.add_hdl_path_slice("channel_offset_mid1__read_data", 0, 8);
      this.channel_offset_mid1_offset = this.channel_offset_mid1.offset;
      this.default_map.add_reg(this.channel_offset_mid1, `UVM_REG_ADDR_WIDTH'h24, "RW", 0);
      this.channel_offset_mid2 = ral_reg_ad7771_channel_offset_mid::type_id::create("channel_offset_mid2",,get_full_name());
      this.channel_offset_mid2.configure(this, null, "");
      this.channel_offset_mid2.build();
      this.channel_offset_mid2.add_hdl_path_slice("channel_offset_mid2__read_data", 0, 8);
      this.channel_offset_mid2_offset = this.channel_offset_mid2.offset;
      this.default_map.add_reg(this.channel_offset_mid2, `UVM_REG_ADDR_WIDTH'h25, "RW", 0);
      this.channel_offset_mid3 = ral_reg_ad7771_channel_offset_mid::type_id::create("channel_offset_mid3",,get_full_name());
      this.channel_offset_mid3.configure(this, null, "");
      this.channel_offset_mid3.build();
      this.channel_offset_mid3.add_hdl_path_slice("channel_offset_mid3__read_data", 0, 8);
      this.channel_offset_mid3_offset = this.channel_offset_mid3.offset;
      this.default_map.add_reg(this.channel_offset_mid3, `UVM_REG_ADDR_WIDTH'h26, "RW", 0);
      this.channel_offset_mid4 = ral_reg_ad7771_channel_offset_mid::type_id::create("channel_offset_mid4",,get_full_name());
      this.channel_offset_mid4.configure(this, null, "");
      this.channel_offset_mid4.build();
      this.channel_offset_mid4.add_hdl_path_slice("channel_offset_mid4__read_data", 0, 8);
      this.channel_offset_mid4_offset = this.channel_offset_mid4.offset;
      this.default_map.add_reg(this.channel_offset_mid4, `UVM_REG_ADDR_WIDTH'h27, "RW", 0);
      this.channel_offset_mid5 = ral_reg_ad7771_channel_offset_mid::type_id::create("channel_offset_mid5",,get_full_name());
      this.channel_offset_mid5.configure(this, null, "");
      this.channel_offset_mid5.build();
      this.channel_offset_mid5.add_hdl_path_slice("channel_offset_mid5__read_data", 0, 8);
      this.channel_offset_mid5_offset = this.channel_offset_mid5.offset;
      this.default_map.add_reg(this.channel_offset_mid5, `UVM_REG_ADDR_WIDTH'h28, "RW", 0);
      this.channel_offset_mid6 = ral_reg_ad7771_channel_offset_mid::type_id::create("channel_offset_mid6",,get_full_name());
      this.channel_offset_mid6.configure(this, null, "");
      this.channel_offset_mid6.build();
      this.channel_offset_mid6.add_hdl_path_slice("channel_offset_mid6__read_data", 0, 8);
      this.channel_offset_mid6_offset = this.channel_offset_mid6.offset;
      this.default_map.add_reg(this.channel_offset_mid6, `UVM_REG_ADDR_WIDTH'h29, "RW", 0);
      this.channel_offset_mid7 = ral_reg_ad7771_channel_offset_mid::type_id::create("channel_offset_mid7",,get_full_name());
      this.channel_offset_mid7.configure(this, null, "");
      this.channel_offset_mid7.build();
      this.channel_offset_mid7.add_hdl_path_slice("channel_offset_mid7__read_data", 0, 8);
      this.channel_offset_mid7_offset = this.channel_offset_mid7.offset;
      this.default_map.add_reg(this.channel_offset_mid7, `UVM_REG_ADDR_WIDTH'h2A, "RW", 0);
      this.channel_offset_low0 = ral_reg_ad7771_channel_offset_low::type_id::create("channel_offset_low0",,get_full_name());
      this.channel_offset_low0.configure(this, null, "");
      this.channel_offset_low0.build();
      this.channel_offset_low0.add_hdl_path_slice("channel_offset_low0__read_data", 0, 8);
      this.channel_offset_low0_offset = this.channel_offset_low0.offset;
      this.default_map.add_reg(this.channel_offset_low0, `UVM_REG_ADDR_WIDTH'h2B, "RW", 0);
      this.channel_offset_low1 = ral_reg_ad7771_channel_offset_low::type_id::create("channel_offset_low1",,get_full_name());
      this.channel_offset_low1.configure(this, null, "");
      this.channel_offset_low1.build();
      this.channel_offset_low1.add_hdl_path_slice("channel_offset_low1__read_data", 0, 8);
      this.channel_offset_low1_offset = this.channel_offset_low1.offset;
      this.default_map.add_reg(this.channel_offset_low1, `UVM_REG_ADDR_WIDTH'h2C, "RW", 0);
      this.channel_offset_low2 = ral_reg_ad7771_channel_offset_low::type_id::create("channel_offset_low2",,get_full_name());
      this.channel_offset_low2.configure(this, null, "");
      this.channel_offset_low2.build();
      this.channel_offset_low2.add_hdl_path_slice("channel_offset_low2__read_data", 0, 8);
      this.channel_offset_low2_offset = this.channel_offset_low2.offset;
      this.default_map.add_reg(this.channel_offset_low2, `UVM_REG_ADDR_WIDTH'h2D, "RW", 0);
      this.channel_offset_low3 = ral_reg_ad7771_channel_offset_low::type_id::create("channel_offset_low3",,get_full_name());
      this.channel_offset_low3.configure(this, null, "");
      this.channel_offset_low3.build();
      this.channel_offset_low3.add_hdl_path_slice("channel_offset_low3__read_data", 0, 8);
      this.channel_offset_low3_offset = this.channel_offset_low3.offset;
      this.default_map.add_reg(this.channel_offset_low3, `UVM_REG_ADDR_WIDTH'h2E, "RW", 0);
      this.channel_offset_low4 = ral_reg_ad7771_channel_offset_low::type_id::create("channel_offset_low4",,get_full_name());
      this.channel_offset_low4.configure(this, null, "");
      this.channel_offset_low4.build();
      this.channel_offset_low4.add_hdl_path_slice("channel_offset_low4__read_data", 0, 8);
      this.channel_offset_low4_offset = this.channel_offset_low4.offset;
      this.default_map.add_reg(this.channel_offset_low4, `UVM_REG_ADDR_WIDTH'h2F, "RW", 0);
      this.channel_offset_low5 = ral_reg_ad7771_channel_offset_low::type_id::create("channel_offset_low5",,get_full_name());
      this.channel_offset_low5.configure(this, null, "");
      this.channel_offset_low5.build();
      this.channel_offset_low5.add_hdl_path_slice("channel_offset_low5__read_data", 0, 8);
      this.channel_offset_low5_offset = this.channel_offset_low5.offset;
      this.default_map.add_reg(this.channel_offset_low5, `UVM_REG_ADDR_WIDTH'h30, "RW", 0);
      this.channel_offset_low6 = ral_reg_ad7771_channel_offset_low::type_id::create("channel_offset_low6",,get_full_name());
      this.channel_offset_low6.configure(this, null, "");
      this.channel_offset_low6.build();
      this.channel_offset_low6.add_hdl_path_slice("channel_offset_low6__read_data", 0, 8);
      this.channel_offset_low6_offset = this.channel_offset_low6.offset;
      this.default_map.add_reg(this.channel_offset_low6, `UVM_REG_ADDR_WIDTH'h31, "RW", 0);
      this.channel_offset_low7 = ral_reg_ad7771_channel_offset_low::type_id::create("channel_offset_low7",,get_full_name());
      this.channel_offset_low7.configure(this, null, "");
      this.channel_offset_low7.build();
      this.channel_offset_low7.add_hdl_path_slice("channel_offset_low7__read_data", 0, 8);
      this.channel_offset_low7_offset = this.channel_offset_low7.offset;
      this.default_map.add_reg(this.channel_offset_low7, `UVM_REG_ADDR_WIDTH'h32, "RW", 0);
      this.channel_gain_up0 = ral_reg_ad7771_channel_gain_up::type_id::create("channel_gain_up0",,get_full_name());
      this.channel_gain_up0.configure(this, null, "");
      this.channel_gain_up0.build();
      this.channel_gain_up0.add_hdl_path_slice("channel_gain_up0__read_data", 0, 8);
      this.channel_gain_up0_gain = this.channel_gain_up0.gain;
      this.default_map.add_reg(this.channel_gain_up0, `UVM_REG_ADDR_WIDTH'h33, "RW", 0);
      this.channel_gain_up1 = ral_reg_ad7771_channel_gain_up::type_id::create("channel_gain_up1",,get_full_name());
      this.channel_gain_up1.configure(this, null, "");
      this.channel_gain_up1.build();
      this.channel_gain_up1.add_hdl_path_slice("channel_gain_up1__read_data", 0, 8);
      this.channel_gain_up1_gain = this.channel_gain_up1.gain;
      this.default_map.add_reg(this.channel_gain_up1, `UVM_REG_ADDR_WIDTH'h34, "RW", 0);
      this.channel_gain_up2 = ral_reg_ad7771_channel_gain_up::type_id::create("channel_gain_up2",,get_full_name());
      this.channel_gain_up2.configure(this, null, "");
      this.channel_gain_up2.build();
      this.channel_gain_up2.add_hdl_path_slice("channel_gain_up2__read_data", 0, 8);
      this.channel_gain_up2_gain = this.channel_gain_up2.gain;
      this.default_map.add_reg(this.channel_gain_up2, `UVM_REG_ADDR_WIDTH'h35, "RW", 0);
      this.channel_gain_up3 = ral_reg_ad7771_channel_gain_up::type_id::create("channel_gain_up3",,get_full_name());
      this.channel_gain_up3.configure(this, null, "");
      this.channel_gain_up3.build();
      this.channel_gain_up3.add_hdl_path_slice("channel_gain_up3__read_data", 0, 8);
      this.channel_gain_up3_gain = this.channel_gain_up3.gain;
      this.default_map.add_reg(this.channel_gain_up3, `UVM_REG_ADDR_WIDTH'h36, "RW", 0);
      this.channel_gain_up4 = ral_reg_ad7771_channel_gain_up::type_id::create("channel_gain_up4",,get_full_name());
      this.channel_gain_up4.configure(this, null, "");
      this.channel_gain_up4.build();
      this.channel_gain_up4.add_hdl_path_slice("channel_gain_up4__read_data", 0, 8);
      this.channel_gain_up4_gain = this.channel_gain_up4.gain;
      this.default_map.add_reg(this.channel_gain_up4, `UVM_REG_ADDR_WIDTH'h37, "RW", 0);
      this.channel_gain_up5 = ral_reg_ad7771_channel_gain_up::type_id::create("channel_gain_up5",,get_full_name());
      this.channel_gain_up5.configure(this, null, "");
      this.channel_gain_up5.build();
      this.channel_gain_up5.add_hdl_path_slice("channel_gain_up5__read_data", 0, 8);
      this.channel_gain_up5_gain = this.channel_gain_up5.gain;
      this.default_map.add_reg(this.channel_gain_up5, `UVM_REG_ADDR_WIDTH'h38, "RW", 0);
      this.channel_gain_up6 = ral_reg_ad7771_channel_gain_up::type_id::create("channel_gain_up6",,get_full_name());
      this.channel_gain_up6.configure(this, null, "");
      this.channel_gain_up6.build();
      this.channel_gain_up6.add_hdl_path_slice("channel_gain_up6__read_data", 0, 8);
      this.channel_gain_up6_gain = this.channel_gain_up6.gain;
      this.default_map.add_reg(this.channel_gain_up6, `UVM_REG_ADDR_WIDTH'h39, "RW", 0);
      this.channel_gain_up7 = ral_reg_ad7771_channel_gain_up::type_id::create("channel_gain_up7",,get_full_name());
      this.channel_gain_up7.configure(this, null, "");
      this.channel_gain_up7.build();
      this.channel_gain_up7.add_hdl_path_slice("channel_gain_up7__read_data", 0, 8);
      this.channel_gain_up7_gain = this.channel_gain_up7.gain;
      this.default_map.add_reg(this.channel_gain_up7, `UVM_REG_ADDR_WIDTH'h3A, "RW", 0);
      this.channel_gain_mid0 = ral_reg_ad7771_channel_gain_mid::type_id::create("channel_gain_mid0",,get_full_name());
      this.channel_gain_mid0.configure(this, null, "");
      this.channel_gain_mid0.build();
      this.channel_gain_mid0.add_hdl_path_slice("channel_gain_mid0__read_data", 0, 8);
      this.channel_gain_mid0_gain = this.channel_gain_mid0.gain;
      this.default_map.add_reg(this.channel_gain_mid0, `UVM_REG_ADDR_WIDTH'h3B, "RW", 0);
      this.channel_gain_mid1 = ral_reg_ad7771_channel_gain_mid::type_id::create("channel_gain_mid1",,get_full_name());
      this.channel_gain_mid1.configure(this, null, "");
      this.channel_gain_mid1.build();
      this.channel_gain_mid1.add_hdl_path_slice("channel_gain_mid1__read_data", 0, 8);
      this.channel_gain_mid1_gain = this.channel_gain_mid1.gain;
      this.default_map.add_reg(this.channel_gain_mid1, `UVM_REG_ADDR_WIDTH'h3C, "RW", 0);
      this.channel_gain_mid2 = ral_reg_ad7771_channel_gain_mid::type_id::create("channel_gain_mid2",,get_full_name());
      this.channel_gain_mid2.configure(this, null, "");
      this.channel_gain_mid2.build();
      this.channel_gain_mid2.add_hdl_path_slice("channel_gain_mid2__read_data", 0, 8);
      this.channel_gain_mid2_gain = this.channel_gain_mid2.gain;
      this.default_map.add_reg(this.channel_gain_mid2, `UVM_REG_ADDR_WIDTH'h3D, "RW", 0);
      this.channel_gain_mid3 = ral_reg_ad7771_channel_gain_mid::type_id::create("channel_gain_mid3",,get_full_name());
      this.channel_gain_mid3.configure(this, null, "");
      this.channel_gain_mid3.build();
      this.channel_gain_mid3.add_hdl_path_slice("channel_gain_mid3__read_data", 0, 8);
      this.channel_gain_mid3_gain = this.channel_gain_mid3.gain;
      this.default_map.add_reg(this.channel_gain_mid3, `UVM_REG_ADDR_WIDTH'h3E, "RW", 0);
      this.channel_gain_mid4 = ral_reg_ad7771_channel_gain_mid::type_id::create("channel_gain_mid4",,get_full_name());
      this.channel_gain_mid4.configure(this, null, "");
      this.channel_gain_mid4.build();
      this.channel_gain_mid4.add_hdl_path_slice("channel_gain_mid4__read_data", 0, 8);
      this.channel_gain_mid4_gain = this.channel_gain_mid4.gain;
      this.default_map.add_reg(this.channel_gain_mid4, `UVM_REG_ADDR_WIDTH'h3F, "RW", 0);
      this.channel_gain_mid5 = ral_reg_ad7771_channel_gain_mid::type_id::create("channel_gain_mid5",,get_full_name());
      this.channel_gain_mid5.configure(this, null, "");
      this.channel_gain_mid5.build();
      this.channel_gain_mid5.add_hdl_path_slice("channel_gain_mid5__read_data", 0, 8);
      this.channel_gain_mid5_gain = this.channel_gain_mid5.gain;
      this.default_map.add_reg(this.channel_gain_mid5, `UVM_REG_ADDR_WIDTH'h40, "RW", 0);
      this.channel_gain_mid6 = ral_reg_ad7771_channel_gain_mid::type_id::create("channel_gain_mid6",,get_full_name());
      this.channel_gain_mid6.configure(this, null, "");
      this.channel_gain_mid6.build();
      this.channel_gain_mid6.add_hdl_path_slice("channel_gain_mid6__read_data", 0, 8);
      this.channel_gain_mid6_gain = this.channel_gain_mid6.gain;
      this.default_map.add_reg(this.channel_gain_mid6, `UVM_REG_ADDR_WIDTH'h41, "RW", 0);
      this.channel_gain_mid7 = ral_reg_ad7771_channel_gain_mid::type_id::create("channel_gain_mid7",,get_full_name());
      this.channel_gain_mid7.configure(this, null, "");
      this.channel_gain_mid7.build();
      this.channel_gain_mid7.add_hdl_path_slice("channel_gain_mid7__read_data", 0, 8);
      this.channel_gain_mid7_gain = this.channel_gain_mid7.gain;
      this.default_map.add_reg(this.channel_gain_mid7, `UVM_REG_ADDR_WIDTH'h42, "RW", 0);
      this.channel_gain_low0 = ral_reg_ad7771_channel_gain_low::type_id::create("channel_gain_low0",,get_full_name());
      this.channel_gain_low0.configure(this, null, "");
      this.channel_gain_low0.build();
      this.channel_gain_low0.add_hdl_path_slice("channel_gain_low0__read_data", 0, 8);
      this.channel_gain_low0_gain = this.channel_gain_low0.gain;
      this.default_map.add_reg(this.channel_gain_low0, `UVM_REG_ADDR_WIDTH'h43, "RW", 0);
      this.channel_gain_low1 = ral_reg_ad7771_channel_gain_low::type_id::create("channel_gain_low1",,get_full_name());
      this.channel_gain_low1.configure(this, null, "");
      this.channel_gain_low1.build();
      this.channel_gain_low1.add_hdl_path_slice("channel_gain_low1__read_data", 0, 8);
      this.channel_gain_low1_gain = this.channel_gain_low1.gain;
      this.default_map.add_reg(this.channel_gain_low1, `UVM_REG_ADDR_WIDTH'h44, "RW", 0);
      this.channel_gain_low2 = ral_reg_ad7771_channel_gain_low::type_id::create("channel_gain_low2",,get_full_name());
      this.channel_gain_low2.configure(this, null, "");
      this.channel_gain_low2.build();
      this.channel_gain_low2.add_hdl_path_slice("channel_gain_low2__read_data", 0, 8);
      this.channel_gain_low2_gain = this.channel_gain_low2.gain;
      this.default_map.add_reg(this.channel_gain_low2, `UVM_REG_ADDR_WIDTH'h45, "RW", 0);
      this.channel_gain_low3 = ral_reg_ad7771_channel_gain_low::type_id::create("channel_gain_low3",,get_full_name());
      this.channel_gain_low3.configure(this, null, "");
      this.channel_gain_low3.build();
      this.channel_gain_low3.add_hdl_path_slice("channel_gain_low3__read_data", 0, 8);
      this.channel_gain_low3_gain = this.channel_gain_low3.gain;
      this.default_map.add_reg(this.channel_gain_low3, `UVM_REG_ADDR_WIDTH'h46, "RW", 0);
      this.channel_gain_low4 = ral_reg_ad7771_channel_gain_low::type_id::create("channel_gain_low4",,get_full_name());
      this.channel_gain_low4.configure(this, null, "");
      this.channel_gain_low4.build();
      this.channel_gain_low4.add_hdl_path_slice("channel_gain_low4__read_data", 0, 8);
      this.channel_gain_low4_gain = this.channel_gain_low4.gain;
      this.default_map.add_reg(this.channel_gain_low4, `UVM_REG_ADDR_WIDTH'h47, "RW", 0);
      this.channel_gain_low5 = ral_reg_ad7771_channel_gain_low::type_id::create("channel_gain_low5",,get_full_name());
      this.channel_gain_low5.configure(this, null, "");
      this.channel_gain_low5.build();
      this.channel_gain_low5.add_hdl_path_slice("channel_gain_low5__read_data", 0, 8);
      this.channel_gain_low5_gain = this.channel_gain_low5.gain;
      this.default_map.add_reg(this.channel_gain_low5, `UVM_REG_ADDR_WIDTH'h48, "RW", 0);
      this.channel_gain_low6 = ral_reg_ad7771_channel_gain_low::type_id::create("channel_gain_low6",,get_full_name());
      this.channel_gain_low6.configure(this, null, "");
      this.channel_gain_low6.build();
      this.channel_gain_low6.add_hdl_path_slice("channel_gain_low6__read_data", 0, 8);
      this.channel_gain_low6_gain = this.channel_gain_low6.gain;
      this.default_map.add_reg(this.channel_gain_low6, `UVM_REG_ADDR_WIDTH'h49, "RW", 0);
      this.channel_gain_low7 = ral_reg_ad7771_channel_gain_low::type_id::create("channel_gain_low7",,get_full_name());
      this.channel_gain_low7.configure(this, null, "");
      this.channel_gain_low7.build();
      this.channel_gain_low7.add_hdl_path_slice("channel_gain_low7__read_data", 0, 8);
      this.channel_gain_low7_gain = this.channel_gain_low7.gain;
      this.default_map.add_reg(this.channel_gain_low7, `UVM_REG_ADDR_WIDTH'h4A, "RW", 0);
      this.channel_status0 = ral_reg_ad7771_channel_status::type_id::create("channel_status0",,get_full_name());
      this.channel_status0.configure(this, null, "");
      this.channel_status0.build();
      this.channel_status0.add_hdl_path_slice("channel_status0__read_data", 0, 8);
      this.channel_status0_err_ref_det = this.channel_status0.err_ref_det;
      this.channel_status0_err_ainp_ov = this.channel_status0.err_ainp_ov;
      this.channel_status0_err_ainp_uv = this.channel_status0.err_ainp_uv;
      this.channel_status0_err_ainm_ov = this.channel_status0.err_ainm_ov;
      this.channel_status0_err_ainm_uv = this.channel_status0.err_ainm_uv;
      this.default_map.add_reg(this.channel_status0, `UVM_REG_ADDR_WIDTH'h4B, "RO", 0);
      this.channel_status1 = ral_reg_ad7771_channel_status::type_id::create("channel_status1",,get_full_name());
      this.channel_status1.configure(this, null, "");
      this.channel_status1.build();
      this.channel_status1.add_hdl_path_slice("channel_status1__read_data", 0, 8);
      this.channel_status1_err_ref_det = this.channel_status1.err_ref_det;
      this.channel_status1_err_ainp_ov = this.channel_status1.err_ainp_ov;
      this.channel_status1_err_ainp_uv = this.channel_status1.err_ainp_uv;
      this.channel_status1_err_ainm_ov = this.channel_status1.err_ainm_ov;
      this.channel_status1_err_ainm_uv = this.channel_status1.err_ainm_uv;
      this.default_map.add_reg(this.channel_status1, `UVM_REG_ADDR_WIDTH'h4C, "RO", 0);
      this.channel_status2 = ral_reg_ad7771_channel_status::type_id::create("channel_status2",,get_full_name());
      this.channel_status2.configure(this, null, "");
      this.channel_status2.build();
      this.channel_status2.add_hdl_path_slice("channel_status2__read_data", 0, 8);
      this.channel_status2_err_ref_det = this.channel_status2.err_ref_det;
      this.channel_status2_err_ainp_ov = this.channel_status2.err_ainp_ov;
      this.channel_status2_err_ainp_uv = this.channel_status2.err_ainp_uv;
      this.channel_status2_err_ainm_ov = this.channel_status2.err_ainm_ov;
      this.channel_status2_err_ainm_uv = this.channel_status2.err_ainm_uv;
      this.default_map.add_reg(this.channel_status2, `UVM_REG_ADDR_WIDTH'h4D, "RO", 0);
      this.channel_status3 = ral_reg_ad7771_channel_status::type_id::create("channel_status3",,get_full_name());
      this.channel_status3.configure(this, null, "");
      this.channel_status3.build();
      this.channel_status3.add_hdl_path_slice("channel_status3__read_data", 0, 8);
      this.channel_status3_err_ref_det = this.channel_status3.err_ref_det;
      this.channel_status3_err_ainp_ov = this.channel_status3.err_ainp_ov;
      this.channel_status3_err_ainp_uv = this.channel_status3.err_ainp_uv;
      this.channel_status3_err_ainm_ov = this.channel_status3.err_ainm_ov;
      this.channel_status3_err_ainm_uv = this.channel_status3.err_ainm_uv;
      this.default_map.add_reg(this.channel_status3, `UVM_REG_ADDR_WIDTH'h4E, "RO", 0);
      this.channel_status4 = ral_reg_ad7771_channel_status::type_id::create("channel_status4",,get_full_name());
      this.channel_status4.configure(this, null, "");
      this.channel_status4.build();
      this.channel_status4.add_hdl_path_slice("channel_status4__read_data", 0, 8);
      this.channel_status4_err_ref_det = this.channel_status4.err_ref_det;
      this.channel_status4_err_ainp_ov = this.channel_status4.err_ainp_ov;
      this.channel_status4_err_ainp_uv = this.channel_status4.err_ainp_uv;
      this.channel_status4_err_ainm_ov = this.channel_status4.err_ainm_ov;
      this.channel_status4_err_ainm_uv = this.channel_status4.err_ainm_uv;
      this.default_map.add_reg(this.channel_status4, `UVM_REG_ADDR_WIDTH'h4F, "RO", 0);
      this.channel_status5 = ral_reg_ad7771_channel_status::type_id::create("channel_status5",,get_full_name());
      this.channel_status5.configure(this, null, "");
      this.channel_status5.build();
      this.channel_status5.add_hdl_path_slice("channel_status5__read_data", 0, 8);
      this.channel_status5_err_ref_det = this.channel_status5.err_ref_det;
      this.channel_status5_err_ainp_ov = this.channel_status5.err_ainp_ov;
      this.channel_status5_err_ainp_uv = this.channel_status5.err_ainp_uv;
      this.channel_status5_err_ainm_ov = this.channel_status5.err_ainm_ov;
      this.channel_status5_err_ainm_uv = this.channel_status5.err_ainm_uv;
      this.default_map.add_reg(this.channel_status5, `UVM_REG_ADDR_WIDTH'h50, "RO", 0);
      this.channel_status6 = ral_reg_ad7771_channel_status::type_id::create("channel_status6",,get_full_name());
      this.channel_status6.configure(this, null, "");
      this.channel_status6.build();
      this.channel_status6.add_hdl_path_slice("channel_status6__read_data", 0, 8);
      this.channel_status6_err_ref_det = this.channel_status6.err_ref_det;
      this.channel_status6_err_ainp_ov = this.channel_status6.err_ainp_ov;
      this.channel_status6_err_ainp_uv = this.channel_status6.err_ainp_uv;
      this.channel_status6_err_ainm_ov = this.channel_status6.err_ainm_ov;
      this.channel_status6_err_ainm_uv = this.channel_status6.err_ainm_uv;
      this.default_map.add_reg(this.channel_status6, `UVM_REG_ADDR_WIDTH'h51, "RO", 0);
      this.channel_status7 = ral_reg_ad7771_channel_status::type_id::create("channel_status7",,get_full_name());
      this.channel_status7.configure(this, null, "");
      this.channel_status7.build();
      this.channel_status7.add_hdl_path_slice("channel_status7__read_data", 0, 8);
      this.channel_status7_err_ref_det = this.channel_status7.err_ref_det;
      this.channel_status7_err_ainp_ov = this.channel_status7.err_ainp_ov;
      this.channel_status7_err_ainp_uv = this.channel_status7.err_ainp_uv;
      this.channel_status7_err_ainm_ov = this.channel_status7.err_ainm_ov;
      this.channel_status7_err_ainm_uv = this.channel_status7.err_ainm_uv;
      this.default_map.add_reg(this.channel_status7, `UVM_REG_ADDR_WIDTH'h52, "RO", 0);
      this.channel_dsp_err0 = ral_reg_ad7771_channel_dsp_err::type_id::create("channel_dsp_err0",,get_full_name());
      this.channel_dsp_err0.configure(this, null, "");
      this.channel_dsp_err0.build();
      this.channel_dsp_err0.add_hdl_path_slice("channel_dsp_err0__read_data", 0, 8);
      this.channel_dsp_err0_err_output_sat0 = this.channel_dsp_err0.err_output_sat0;
      this.channel_dsp_err0_err_filter_sat0 = this.channel_dsp_err0.err_filter_sat0;
      this.channel_dsp_err0_err_mod_sat0 = this.channel_dsp_err0.err_mod_sat0;
      this.channel_dsp_err0_err_output_sat1 = this.channel_dsp_err0.err_output_sat1;
      this.channel_dsp_err0_err_filter_sat1 = this.channel_dsp_err0.err_filter_sat1;
      this.channel_dsp_err0_err_mod_sat1 = this.channel_dsp_err0.err_mod_sat1;
      this.default_map.add_reg(this.channel_dsp_err0, `UVM_REG_ADDR_WIDTH'h53, "RO", 0);
      this.channel_dsp_err1 = ral_reg_ad7771_channel_dsp_err::type_id::create("channel_dsp_err1",,get_full_name());
      this.channel_dsp_err1.configure(this, null, "");
      this.channel_dsp_err1.build();
      this.channel_dsp_err1.add_hdl_path_slice("channel_dsp_err1__read_data", 0, 8);
      this.channel_dsp_err1_err_output_sat2 = this.channel_dsp_err1.err_output_sat0;
      this.channel_dsp_err1_err_filter_sat2 = this.channel_dsp_err1.err_filter_sat0;
      this.channel_dsp_err1_err_mod_sat2 = this.channel_dsp_err1.err_mod_sat0;
      this.channel_dsp_err1_err_output_sat3 = this.channel_dsp_err1.err_output_sat1;
      this.channel_dsp_err1_err_filter_sat3 = this.channel_dsp_err1.err_filter_sat1;
      this.channel_dsp_err1_err_mod_sat3 = this.channel_dsp_err1.err_mod_sat1;
      this.default_map.add_reg(this.channel_dsp_err1, `UVM_REG_ADDR_WIDTH'h54, "RO", 0);
      this.channel_dsp_err2 = ral_reg_ad7771_channel_dsp_err::type_id::create("channel_dsp_err2",,get_full_name());
      this.channel_dsp_err2.configure(this, null, "");
      this.channel_dsp_err2.build();
      this.channel_dsp_err2.add_hdl_path_slice("channel_dsp_err2__read_data", 0, 8);
      this.channel_dsp_err2_err_output_sat4 = this.channel_dsp_err2.err_output_sat0;
      this.channel_dsp_err2_err_filter_sat4 = this.channel_dsp_err2.err_filter_sat0;
      this.channel_dsp_err2_err_mod_sat4 = this.channel_dsp_err2.err_mod_sat0;
      this.channel_dsp_err2_err_output_sat5 = this.channel_dsp_err2.err_output_sat1;
      this.channel_dsp_err2_err_filter_sat5 = this.channel_dsp_err2.err_filter_sat1;
      this.channel_dsp_err2_err_mod_sat5 = this.channel_dsp_err2.err_mod_sat1;
      this.default_map.add_reg(this.channel_dsp_err2, `UVM_REG_ADDR_WIDTH'h55, "RO", 0);
      this.channel_dsp_err3 = ral_reg_ad7771_channel_dsp_err::type_id::create("channel_dsp_err3",,get_full_name());
      this.channel_dsp_err3.configure(this, null, "");
      this.channel_dsp_err3.build();
      this.channel_dsp_err3.add_hdl_path_slice("channel_dsp_err3__read_data", 0, 8);
      this.channel_dsp_err3_err_output_sat6 = this.channel_dsp_err3.err_output_sat0;
      this.channel_dsp_err3_err_filter_sat6 = this.channel_dsp_err3.err_filter_sat0;
      this.channel_dsp_err3_err_mod_sat6 = this.channel_dsp_err3.err_mod_sat0;
      this.channel_dsp_err3_err_output_sat7 = this.channel_dsp_err3.err_output_sat1;
      this.channel_dsp_err3_err_filter_sat7 = this.channel_dsp_err3.err_filter_sat1;
      this.channel_dsp_err3_err_mod_sat7 = this.channel_dsp_err3.err_mod_sat1;
      this.default_map.add_reg(this.channel_dsp_err3, `UVM_REG_ADDR_WIDTH'h56, "RO", 0);
      this.channel_test_en = ral_reg_ad7771_channel_test_en::type_id::create("channel_test_en",,get_full_name());
      this.channel_test_en.configure(this, null, "");
      this.channel_test_en.build();
      this.channel_test_en.add_hdl_path_slice("channel_test_en__read_data", 0, 8);
      this.channel_test_en_ref_det_test_en = this.channel_test_en.ref_det_test_en;
      this.channel_test_en_ainp_ov_test_en = this.channel_test_en.ainp_ov_test_en;
      this.channel_test_en_ainp_uv_test_en = this.channel_test_en.ainp_uv_test_en;
      this.channel_test_en_ainm_ov_test_en = this.channel_test_en.ainm_ov_test_en;
      this.channel_test_en_ainm_uv_test_en = this.channel_test_en.ainm_uv_test_en;
      this.channel_test_en_mod_sat_test_en = this.channel_test_en.mod_sat_test_en;
      this.channel_test_en_filter_sat_test_en = this.channel_test_en.filter_sat_test_en;
      this.channel_test_en_output_sat_test_en = this.channel_test_en.output_sat_test_en;
      this.default_map.add_reg(this.channel_test_en, `UVM_REG_ADDR_WIDTH'h57, "RW", 0);
      this.general_err1 = ral_reg_ad7771_general_err1::type_id::create("general_err1",,get_full_name());
      this.general_err1.configure(this, null, "");
      this.general_err1.build();
      this.general_err1.add_hdl_path_slice("general_err1__read_data", 0, 8);
      this.general_err1_spi_crc_err = this.general_err1.spi_crc_err;
      this.general_err1_spi_invalid_write_err = this.general_err1.spi_invalid_write_err;
      this.general_err1_spi_invalid_read_err = this.general_err1.spi_invalid_read_err;
      this.general_err1_spi_clk_count_err = this.general_err1.spi_clk_count_err;
      this.general_err1_rom_crc_err = this.general_err1.rom_crc_err;
      this.general_err1_memmap_crc_err = this.general_err1.memmap_crc_err;
      this.default_map.add_reg(this.general_err1, `UVM_REG_ADDR_WIDTH'h58, "RO", 0);
      this.general_err1_en = ral_reg_ad7771_general_err1_en::type_id::create("general_err1_en",,get_full_name());
      this.general_err1_en.configure(this, null, "");
      this.general_err1_en.build();
      this.general_err1_en.add_hdl_path_slice("general_err1_en__read_data", 0, 8);
      this.general_err1_en_spi_crc_err_en = this.general_err1_en.spi_crc_err_en;
      this.general_err1_en_spi_invalid_write_err_en = this.general_err1_en.spi_invalid_write_err_en;
      this.general_err1_en_spi_invalid_read_err_en = this.general_err1_en.spi_invalid_read_err_en;
      this.general_err1_en_spi_clk_count_err_en = this.general_err1_en.spi_clk_count_err_en;
      this.general_err1_en_rom_crc_err_en = this.general_err1_en.rom_crc_err_en;
      this.general_err1_en_memmap_crc_err_en = this.general_err1_en.memmap_crc_err_en;
      this.default_map.add_reg(this.general_err1_en, `UVM_REG_ADDR_WIDTH'h59, "RW", 0);
      this.general_err2 = ral_reg_ad7771_general_err2::type_id::create("general_err2",,get_full_name());
      this.general_err2.configure(this, null, "");
      this.general_err2.build();
      this.general_err2.add_hdl_path_slice("general_err2__read_data", 0, 8);
      this.general_err2_dldo_psm_err = this.general_err2.dldo_psm_err;
      this.general_err2_aldo2_psm_err = this.general_err2.aldo2_psm_err;
      this.general_err2_aldo1_psm_err = this.general_err2.aldo1_psm_err;
      this.general_err2_ext_mclk_switch_err = this.general_err2.ext_mclk_switch_err;
      this.general_err2_reset_detected = this.general_err2.reset_detected;
      this.default_map.add_reg(this.general_err2, `UVM_REG_ADDR_WIDTH'h5A, "RO", 0);
      this.general_err2_en = ral_reg_ad7771_general_err2_en::type_id::create("general_err2_en",,get_full_name());
      this.general_err2_en.configure(this, null, "");
      this.general_err2_en.build();
      this.general_err2_en.add_hdl_path_slice("general_err2_en__read_data", 0, 8);
      this.general_err2_en_ldo_psm_trip_test = this.general_err2_en.ldo_psm_trip_test;
      this.general_err2_en_dldo_psm_err_en = this.general_err2_en.dldo_psm_err_en;
      this.general_err2_en_aldo_psm_err_en = this.general_err2_en.aldo_psm_err_en;
      this.general_err2_en_reset_detected_en = this.general_err2_en.reset_detected_en;
      this.default_map.add_reg(this.general_err2_en, `UVM_REG_ADDR_WIDTH'h5B, "RW", 0);
      this.error_status1 = ral_reg_ad7771_error_status1::type_id::create("error_status1",,get_full_name());
      this.error_status1.configure(this, null, "");
      this.error_status1.build();
      this.error_status1.add_hdl_path_slice("error_status1__read_data", 0, 8);
      this.error_status1_err_loc_ch0 = this.error_status1.err_loc_ch0;
      this.error_status1_err_loc_ch1 = this.error_status1.err_loc_ch1;
      this.error_status1_err_loc_ch2 = this.error_status1.err_loc_ch2;
      this.error_status1_err_loc_ch3 = this.error_status1.err_loc_ch3;
      this.error_status1_err_loc_ch4 = this.error_status1.err_loc_ch4;
      this.error_status1_chip_error1 = this.error_status1.chip_error1;
      this.default_map.add_reg(this.error_status1, `UVM_REG_ADDR_WIDTH'h5C, "RO", 0);
      this.error_status2 = ral_reg_ad7771_error_status2::type_id::create("error_status2",,get_full_name());
      this.error_status2.configure(this, null, "");
      this.error_status2.build();
      this.error_status2.add_hdl_path_slice("error_status2__read_data", 0, 8);
      this.error_status2_err_loc_ch5 = this.error_status2.err_loc_ch5;
      this.error_status2_err_loc_ch6 = this.error_status2.err_loc_ch6;
      this.error_status2_err_loc_ch7 = this.error_status2.err_loc_ch7;
      this.error_status2_err_loc_gen0 = this.error_status2.err_loc_gen0;
      this.error_status2_err_loc_gen1 = this.error_status2.err_loc_gen1;
      this.error_status2_chip_error2 = this.error_status2.chip_error2;
      this.default_map.add_reg(this.error_status2, `UVM_REG_ADDR_WIDTH'h5D, "RO", 0);
      this.error_status3 = ral_reg_ad7771_error_status3::type_id::create("error_status3",,get_full_name());
      this.error_status3.configure(this, null, "");
      this.error_status3.build();
      this.error_status3.add_hdl_path_slice("error_status3__read_data", 0, 8);
      this.error_status3_err_loc_sat_ch0 = this.error_status3.err_loc_sat_ch0;
      this.error_status3_err_loc_sat_ch1 = this.error_status3.err_loc_sat_ch1;
      this.error_status3_err_loc_sat_ch2 = this.error_status3.err_loc_sat_ch2;
      this.error_status3_err_loc_sat_ch3 = this.error_status3.err_loc_sat_ch3;
      this.error_status3_init_complete = this.error_status3.init_complete;
      this.error_status3_chip_error3 = this.error_status3.chip_error3;
      this.default_map.add_reg(this.error_status3, `UVM_REG_ADDR_WIDTH'h5E, "RO", 0);
      this.src_n_msb = ral_reg_ad7771_src_n_msb::type_id::create("src_n_msb",,get_full_name());
      this.src_n_msb.configure(this, null, "");
      this.src_n_msb.build();
      this.src_n_msb.add_hdl_path_slice("src_n_msb__read_data", 0, 8);
      this.src_n_msb_src_n = this.src_n_msb.src_n;
      this.default_map.add_reg(this.src_n_msb, `UVM_REG_ADDR_WIDTH'h5F, "RW", 0);
      this.src_n_lsb = ral_reg_ad7771_src_n_lsb::type_id::create("src_n_lsb",,get_full_name());
      this.src_n_lsb.configure(this, null, "");
      this.src_n_lsb.build();
      this.src_n_lsb.add_hdl_path_slice("src_n_lsb__read_data", 0, 8);
      this.src_n_lsb_src_n = this.src_n_lsb.src_n;
      this.default_map.add_reg(this.src_n_lsb, `UVM_REG_ADDR_WIDTH'h60, "RW", 0);
      this.src_if_msb = ral_reg_ad7771_src_if_msb::type_id::create("src_if_msb",,get_full_name());
      this.src_if_msb.configure(this, null, "");
      this.src_if_msb.build();
      this.src_if_msb.add_hdl_path_slice("src_if_msb__read_data", 0, 8);
      this.src_if_msb_src_if = this.src_if_msb.src_if;
      this.default_map.add_reg(this.src_if_msb, `UVM_REG_ADDR_WIDTH'h61, "RW", 0);
      this.src_if_lsb = ral_reg_ad7771_src_if_lsb::type_id::create("src_if_lsb",,get_full_name());
      this.src_if_lsb.configure(this, null, "");
      this.src_if_lsb.build();
      this.src_if_lsb.add_hdl_path_slice("src_if_lsb__read_data", 0, 8);
      this.src_if_lsb_src_if = this.src_if_lsb.src_if;
      this.default_map.add_reg(this.src_if_lsb, `UVM_REG_ADDR_WIDTH'h62, "RW", 0);
      this.src_load = ral_reg_ad7771_src_load::type_id::create("src_load",,get_full_name());
      this.src_load.configure(this, null, "");
      this.src_load.build();
      this.src_load.add_hdl_path_slice("src_load__read_data", 0, 8);
      this.src_load_load_update = this.src_load.load_update;
      this.src_load_load_source = this.src_load.load_source;
      this.default_map.add_reg(this.src_load, `UVM_REG_ADDR_WIDTH'h63, "RW", 0);
   endfunction : build

   `uvm_object_utils(ral_block_ad7771)

endclass : ral_block_ad7771

`endif // RAL_AD7771_RIF
