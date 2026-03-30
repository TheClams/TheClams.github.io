---
layout: post
title: Introduction to YARIG
description: "YARIG: a Rust register-interface generator for SystemVerilog, SVD, C, Python, HTML, and more."
keywords: [yarig, rust, register, systemverilog, csr, embedded]
---

## What is YARIG ?

### Description
YARIG is both a binary and library to generate the register description of an hardware block, available on [crate.io](https://crates.io/crates/yarig).
It stands for "Yet Another Register Interface Generator", a reference to the fact that there is almost as many generator as there is company developping hardware IP or chips.
There is fun [blog post](https://www.chipstitcher.com/2021-04-register-generation-a-right-of-passage/) explaining on the subject and why you should not make it yourself and use a more standard solution :P

For those not familiar with the concept: most hardware block needs to be configurable and provides some status information easily accessible by a micro-controller
(often called Control & status register (CSR) or more simply register interface).
This is quite trivial to implement (an address decoder and a structure for each register) but it gets quickly repetitive
 and you need to maintain not only the hardware implementation (SystemVerilog, VHDL) but also the documentation (HTML, AsciiDoc, IP XAct, ..) and the software description (C, Rust or Python).
 So the idea is to have "one source of truth" to describe the registers and then use the generator to get all the needed views.
 While there is a standardized format for that (RDL or Register Description Language), I have opted to define my own format: 
 it reuses a lot of concept used in RDL, like the separation of register definition and register instance but uses a format easier to read/write (at least for me :P)
 and more importantly this allows me to introduce features not existing in RDL. The syntax is fully described in the [GitHub repo](https://github.com/TheClams/yarig/blob/dev/doc/syntax.md).

### Why in Rust ?
Since this is a Rust oriented blog, I wanted to explain the language choice.

Funny enough, it did not start as Rust, but as a python script, more than 15 years ago when the commercial tool used in my old company was unceremoniously abandoned ...
Exactly like described in the blog post I referenced, creating a first version of the tool is quite easy, but it complexify over time: supporting more views and always adding more features.

I had two main issues with my python implementation:
 - Each generator is a script independent from all the others. This means that when you add a feature or correct a bug in the SystemVerilog generator, you need the replicate the work in the others HDL generator.
 	And same for all the software or documentation views. And a related issue, is that it gets difficult to keep a perfectly coherent approach in each generator: the order in which each code line is generated
 	was slightly different between the views and same for the signal naming.
 - As I was starting to re-use IPs between chips but each with a different configuration (and so set of register to control it), I needed a way to easily override parameter value at the top level for each IP register interface.
 	And this was implying a significant rewrite of the python parser.

So that's when I started to get interested in Rust and decided to use this project to learn the language:
 - For the parsing aspect I selected the crate [winnow](https://crates.io/crates/winnow), a fork of [nom](https://crates.io/crates/nom): it allowed to have an easy to update parser while being extremely performant.
 - To improve code sharing between generators I used two feature of the language. First is simply using the type system to ensure the different class have a good set of methods that can be used in each generator
 (like common iterator to through all the register, including defining filter like public/private). And the second one is the trait system. I defined three traits for the main possible views: one for hardware,
 one for documentation and a last one for software, each with enough configuration that it should cover most needs (which is the case of the more than 12 different views currently supported).

And finally I also used Rust to experiment with a [small GUI](https://github.com/TheClams/yargui) to explore easily a register definition, especially useful at chip level, where you have multiple level of register definition.
This uses the [eGui crate](https://crates.io/crates/egui) which I found really nice to use for this kind of simple interface.

### Syntax highlight
Syntax highlighting is available for both [SublimeText](https://github.com/TheClams/rif) (my editor of choice) or [VS Code](https://marketplace.visualstudio.com/items?itemName=Clamsax.rifgen-syntax).
In this blog post I will simply use the yaml highlight syntax as it is close enough.

## Creating the register description of the Analog Device AD7771

This post will focus on the register description part. When I have time, I will do a separate post to explain how to implement a custom generator using the trait system
Rather than writing a wall of test trying to introduce the different features of the library (there is already quite a lot of documentation on [GitHub](https://github.com/TheClams/yarig/tree/dev/doc),
I thought it would be more effective to try to write a register description using the datasheet of an existing chip.
For this small introduction, I have selected the Analog Device AD7771 : this multi-channel ADC seems to be have a good mix of register kind, 
like register array, enumerated field, pulse field and field larger than the register size.

You can find the full datasheet [here](https://www.analog.com/media/en/technical-documentation/data-sheets/ad7771.pdf) and have a look at the register summary/details chapters at the end

### Top description
The first thing to describe is the name of the block, the software bus (like APB for example) and the clock and reset kind used.

Looking at the register summary the max address is 0x64 with 8 bits wide register: so we can use an interface
with address on 7 bits and the data bus on 8 bits. I will name the software clock `clk_rif`
so that it can be different from the hardware clock (`clk` by default) allowing clock gating, and a dedicated reset signal name `rst_rif_n` active low and asynchronous.

The syntax is:
```yaml
rif: ad7771_rif
  interface: apb
  addrWidth:     7
  dataWidth:     8
  swClock  : clk_rif
  swReset  : rst_rif_n activeLow async
 ```

Registers can be group in pages (useful when some optional feature require many register).
Here we will do something simple with only one page name `Main`
```yaml
  - Main :
  	# Registers declaration
    registers:
 ```

### Register/Field array
First set of registers for this ADC is the configuration per channel: it contains a gain on 2 bits, one bit to configured the channel as monitor, one to enable a channel meter multiplexer and 4 reserved bits.

Here we have two possible approach:
 - 1) Defining a simple register and creating one instance per channel, simply defining the instance as an array of size 8 (the number of channel).
 - 2) Defining directly the register with an array of field (one per channel).

For the first approach the syntax would be:
```yaml
    registers:
      - channel_cfg : "Channel configuration"
        - gain    = 0  7:6   "AFE Gain (power of 2)"
        - ref_mon = 0  5:5   "Channel used as reference monitor"
        - rx      = 0  4:4   "Channel meter Mux RX mode"
        - bias    = 0  2:0   "Hidden tuning register"
          hidden
    instances:
      - channel_cfg[8] @ 0x000
      	description: "Channel $i configuration"
```
For each field the reset value is set to 0, with a range to indicate the position inside the 8b register, followed by a simple description.
Since I saw that the first three bits are marked as reserved with a split between the the 3 LSB and the bit 3,
I thought I would demonstrate here the idea of public/private field: by flagging the `bias` field as `hidden`,
it will appear differently in the generated view depending if the generator is called with a private or public flag:
it will be renamed as reserved when the generator is set to public, with no description and named `bias` with its full description when set to private.

And as for the instance description the `$i` is used to reference the index of the instance so we can have different description for each instance. And note that it is also possible to change the reset value or even field description per instance.

For the second approach, the syntax is:
```yaml
    registers:
      - channel_cfg[8] : "Channel $i configuration"
        - gain[1]    = 0  7:6   "AFE Gain (power of 2)"
        - ref_mon[1] = 0  5:5   "Channel used as reference monitor"
        - rx[1]      = 0  4:4   "Channel meter Mux RX mode"
        - bias[1]    = 0  2:0   "Hidden tuning register"
          hidden
    instances: auto
```
When defining the register directly as an array it means that all the register instances will be part of the same struct,
and all fields must be arrays, with the final field array depth being a multiplication of the register and the field depth.

The corresponding SystemVerilog structure looks like this:
```v
   typedef struct {
      logic [1:0] gain[8]; // AFE Gain (power of 2)
      logic ref_mon[8]; // Channel used as reference monitor
      logic rx[8]; // Channel meter Mux RX mode
      logic [3:0] bias[8]; // Hidden tuning register
   } t_channel_cfg_sw;
```
Note: The type of the register is suffixed with `_sw` as this is the structure controlled by the software. If part of the register were driven by the hardware, there would be another struct suffixed by `_hw`.


### Grouping register in a single struct
Related to the per channel configuration, there is also one register containing one bit to disable each channel individually and another group of 8 register (one per channel) to provide a SyncOffset.
At the hardware level it would be nice to have everything under the same struct, as all those signals likely goes to the same block.

To do that, the syntax is simply to provide a group name after the register name:
```yaml
    registers:
      - channel_cfg[8] : (channel) "Channel $i configuration"
        - gain[1]    = 0  7:6   "AFE Gain (power of 2)"
        - ref_mon[1] = 0  5:5   "Channel used as reference monitor"
        - rx[1]      = 0  4:4   "Channel meter Mux RX mode"
        - bias[1] = 0 3:0 "Hidden tuning register"
          hidden
      - clock_disable : (channel) "Clock disable per channel"
        - disable_ch[8] = 0  0:0   "Channel $i Disable"
      - channel_sync_offset[8] : (channel) "Channel $i Sync offset"
        - sync_offset[1]  = +0  7:0   "Sync offset"
```
For the sync_offset field, I have decided to demonstrate here a simple way to specify that the register contains a signed value (using +0 as the reset value).
Another approach would have been to add a `signed` property to the field.

And now we have the following structure:

```v
   typedef struct {
      logic [1:0] gain[8]; // AFE Gain (power of 2)
      logic ref_mon[8]; // Channel used as reference monitor
      logic rx[8]; // Channel meter Mux RX mode
      logic [3:0] bias[8]; // Hidden tuning register
      logic disable_ch[8]; // Channel  Disable
      logic signed [7:0] sync_offset[8]; // Sync offset
   } t_channel_sw;
```

### Enumerated field

One of the general user configuration register contains fields to control the drive strength of two different pins (SDO and DOUT).
This is an enumerated value (Nominal, Strong, weak and extra Strong).

The syntax allows to re-use the definition of an enum, and also use a named value rather than the decimal one for the reset:
```yaml
  - user_cfg2 : (user_cfg) "General user configuration 2 (drive/filter)"
    - filter_mode = 0  6:6   "Power down VCM buffer (active low)"
      enum: e_filter_mode
        - SINC3  = 0 "3-tap Sinc"
        - SINC5  = 1 "5-tap Sinc"
    - sar_diag_en = 0  5:5   "Sets SPI interface to read back SAR result on SDO"
    - sdo_drive_str = STRONG  4:3   "Configure drive strength for SDO"
      enum: e_drive_str
        - NOMINAL      = 0 "Nominal"
        - STRONG       = 1 "Strong"
        - WEAK         = 2 "Weak"
        - EXTRA_STRONG = 3 "Extra Strong"
    - dout_drive_str = NOMINAL 2:1   "Configure drive strength for DOUT"
      enum: e_drive_str
    - spi_sync = 0  0:0   "SYNC pulse generated through SPI"
      description:
        When low, this signal is AND’ed with the value on the START pin in the control module and generates a pulse in the SYNC_IN pin.
        When high, this bit is AND’ed with the value on START pin in the control module
```
In the SystemVerilog Package, this will add an enum definition, which can then be re-used easily in the design:
```v
   typedef enum logic [1:0] {
      NOMINAL = 0, // Nominal
      STRONG = 1, // Strong
      WEAK = 2, // Weak
      EXTRA_STRONG = 3  // Extra Strong
   } e_drive_str;
```
And similar definition in the C header view:
```c
/// Soft reset
typedef enum ad7771_soft_reset_t {
    AD7771_NONE = 0, //!< No effect
    AD7771_SECOND = 2, //!< 2nd write
    AD7771_FIRST = 3 //!< 1st write
} ad7771_soft_reset_t;
```

### Field larger than register width
Register width is mainly decided by the micro-controller used (typically 8, 16 or 32 bits), so it is quite common to have to handle fields larger than that.

This device has a few of those field, for example the Sample Rate Converter configuration: the IF is on 16b, the divider on 12b.

This is easily achieved with the `partial` property: it flags a field as being only partially defined and the associated value correspond to the LSB position in the whole field:
```yaml
  - src_n_msb : (decimation) "Sample Rate converter N MSB"
    - src_n = 0 3:0 "Sample Rate converter N[11:8]"
      partial 8
  - src_n_lsb : (decimation) "Sample Rate converter N LSB"
    - src_n = 0 7:0 "Sample Rate converter N[7:0]"
      partial 0
  - src_if_msb : (decimation) "Sample Rate converter IF MSB"
    - src_if = 0 7:0 "Sample Rate converter IF[15:8]"
      partial 8
  - src_if_lsb : (decimation) "Sample Rate converter IF LSB"
    - src_if = 0 7:0 "Sample Rate converter IF[7:0]"
      partial 0
  - src_load : (decimation) "Sample Rate converter load"
    - load_source = 0 7:7 "Select which option to load an SRC update"
    - load_update = 0 0:0 "Assert to load SRC registers into SRC"
      pulse
```
Note: I also added here one of the field with a `pulse` property: this means that when writing one to this field,
it will automatically reset to 0 after one clock cycle (using the hardware clock).

### Field array split on multiple registers
The error status register contains a field array or "error_loc" for each channel split on two registers.
This is handled with the `arrayPartial` property:

```yaml
  - error_status1 : (error_status) "Error Status 1"
    - chip_error1    5:5 "High when any error bit is high"
    - err_loc_ch[5]  0:0 "Error specific to channel $i"
  - error_status2 : (error_status) "Error Status 2"
    - chip_error2    5:5 "High when any error bit is high"
    - err_loc_gen[2] 3:3 "Error specific to gen_err[$(i+1)]"
    - err_loc_ch[3]  0:0 "Error specific to channel $i"
      arrayPartial 5
```
The resulting systemVerilog structure is:
```v
    typedef struct {
       logic chip_error1; // High when any error bit is high
       logic err_loc_ch[8]; // Error specific to channel
       logic chip_error2; // High when any error bit is high
       logic err_loc_gen[2]; // Error specific to gen_err[(i+1)]
    } t_error_status_hw;
```

Note: those register are read-only and this is simply done by not providing a reset value. If you want to specify the reset value (because the hardware might set the value at something different from 0)
you can be explicit by specifying `- chip_error1 = 1 5:5 ro "High when any error bit if high"`.


## Conclusion

The full description is available in he same repository as this blog [here](https://github.com/TheClams/TheClams.github.io/tree/main/assets/ad7771.rif)
and a few views (SystemVerilog (both RTL and UVM RAL), HTML, Python and SVD) can be seen in the directory [yarig](https://github.com/TheClams/TheClams.github.io/tree/main/assets/yarig) just below.

This real use-case is just a small example of what is possible to achieve with YARIG, and it was a good test for to ensure that it is generic enough to handle things I am not familiar with.
I used it for dozens of hardware and combined with all my teammates this was used to close to one hundred blocks
(many are used as part of my regression tests to ensure update do not introduce bugs).

Among the many features not shown here I would mention the fact that you can create what I call a `rifmux`,
a multiplexer of register interface allowing to put together many register description to describe a full SoC.
It is also possible to include a RIF file in order to re-use register definition, reserve an address range for internal memory, define register as being external,
meaning the register logic is outside of the generated file in case you have complex behavior not supported.