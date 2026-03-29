import typing
from enum import IntEnum
from .regmap import Field, Register, Peripheral


@typing.final
class Ad7771(Peripheral):

    class e_power_mode(IntEnum):
        """Power down VCM buffer (active low)"""
        LOW_PWR = 0
        """Low power (1/4)"""
        HIGH_RES = 1
        """High resolution"""

    class e_soft_reset(IntEnum):
        """Soft reset"""
        NONE = 0
        """No effect"""
        SECOND = 2
        """2nd write"""
        FIRST = 3
        """1st write"""

    class e_filter_mode(IntEnum):
        """Power down VCM buffer (active low)"""
        SINC3 = 0
        """3-tap Sinc"""
        SINC5 = 1
        """5-tap Sinc"""

    class e_drive_str(IntEnum):
        """Configure drive strength for SDO"""
        NOMINAL = 0
        """Nominal"""
        STRONG = 1
        """Strong"""
        WEAK = 2
        """Weak"""
        EXTRA_STRONG = 3
        """Extra Strong"""

    class e_deglitch(IntEnum):
        """Disable deglitching of CONVST_SAR pin"""
        DEGLITCH_1P5 = 2
        """Deglitch 1.5 MCLK"""
        DISABLE = 3
        """No deglitch circuit"""

    class e_data_format(IntEnum):
        """Data out format"""
        QUAD = 0
        """4 DOUT lines"""
        DOUBLE = 1
        """2 DOUT lines"""
        SINGLE = 2
        """1 DOUT lines"""

    class e_header_format(IntEnum):
        """Header format"""
        STATUS = 0
        """Status header"""
        CRC = 1
        """CRC header"""

    class e_ref_mux(IntEnum):
        """SD ADC reference mux"""
        EXT_PM = 0
        """External reference REFx+/REFx−"""
        INTERNAL = 1
        """Internal reference"""
        EXT_SUP = 2
        """External supply AVDD1x/AVSSx"""
        EXT_MP = 3
        """External reference REFx-/REFx+"""

    class e_mtr_mux(IntEnum):
        """SD ADC Meter mux"""
        FIXED_280 = 0
        """280mV"""
        EXT_PM = 1
        """External reference REFx+/REFx−"""
        EXT_MP = 2
        """External reference REFx-/REFx+"""
        EXT_MM = 3
        """External reference REFx-/REFx-"""
        INT_PM = 4
        """Internal reference +/-"""
        INT_MP = 5
        """Internal reference -/+"""
        INT_MM = 6
        """Internal reference -/-"""
        EXT_PP = 7
        """External reference REFx+/REFx+"""

    class e_glob_mux(IntEnum):
        """SD ADC reference mux"""
        AUXAIN = 0
        """AUXAIN+/AUXAIN−."""
        DVBE = 1
        """DVBE/AVSSx."""
        REF1_PM = 2
        """REF1+/REF1−."""
        REF2_PM = 3
        """REF2+/REF2−."""
        REF_OUT = 4
        """REF_OUT/AVSSx."""
        VCM = 5
        """VCM/AVSSx."""
        AREG1CAP = 6
        """AREG1CAP/AVSSx."""
        AREG2CAP = 7
        """AREG2CAP/AVSSx."""
        DREGCAP = 8
        """DREGCAP/DGND."""
        AVDD1A = 9
        """AVDD1A/AVSSx."""
        AVDD1B = 10
        """AVDD1B/AVSSx."""
        AVDD2A = 11
        """AVDD2A/AVSSx."""
        AVDD2B = 12
        """AVDD2B/AVSSx."""
        IOVDD = 13
        """IOVDD/DGND."""
        AVDD4 = 14
        """AVDD4/AVSSx."""
        DGND_A = 15
        """DGND/AVSS1A."""
        DGND_B = 16
        """DGND/AVSS1B."""
        DGND_X = 17
        """DGND/AVSSx."""
        AVDD4_X = 18
        """AVDD4/AVSSx."""
        REF1_PX = 19
        """REF1+/AVSSx."""
        REF2_PX = 20
        """REF2+/AVSSx."""
        AVDD4_ATT = 21
        """AVDD4/AVSSx. Attenuated."""

    @typing.final
    class ChannelCfg(Register):
        """Channel  configuration"""

        class Bias(Field):
            """Hidden tuning register"""
            pos: int = 0
            width: int = 4
            value: int = 0
            signed: bool = False
            kind: str = "RW"

        class Rx(Field):
            """Channel meter Mux RX mode"""
            pos: int = 4
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RW"

        class RefMon(Field):
            """Channel used as reference monitor"""
            pos: int = 5
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RW"

        class Gain(Field):
            """AFE Gain (power of 2)"""
            pos: int = 6
            width: int = 2
            value: int = 0
            signed: bool = False
            kind: str = "RW"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.bias = Ad7771.ChannelCfg.Bias(self, 'bias')
            """Hidden tuning register"""
            self.rx = Ad7771.ChannelCfg.Rx(self, 'rx')
            """Channel meter Mux RX mode"""
            self.ref_mon = Ad7771.ChannelCfg.RefMon(self, 'ref_mon')
            """Channel used as reference monitor"""
            self.gain = Ad7771.ChannelCfg.Gain(self, 'gain')
            """AFE Gain (power of 2)"""

    @typing.final
    class ClockDisable(Register):
        """Clock disable per channel"""

        class DisableCh(Field):
            """Channel 0 Disable"""
            pos: int = 0
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RW"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.disable_ch: dict[int, Ad7771.ClockDisable.DisableCh] = {}
            self.disable_ch[0] = Ad7771.ClockDisable.DisableCh(self, 'disable_ch[0]')
            """Channel 0 Disable"""
            self.disable_ch[0].pos = 0
            self.disable_ch[1] = Ad7771.ClockDisable.DisableCh(self, 'disable_ch[1]')
            """Channel 1 Disable"""
            self.disable_ch[1].pos = 1
            self.disable_ch[2] = Ad7771.ClockDisable.DisableCh(self, 'disable_ch[2]')
            """Channel 2 Disable"""
            self.disable_ch[2].pos = 2
            self.disable_ch[3] = Ad7771.ClockDisable.DisableCh(self, 'disable_ch[3]')
            """Channel 3 Disable"""
            self.disable_ch[3].pos = 3
            self.disable_ch[4] = Ad7771.ClockDisable.DisableCh(self, 'disable_ch[4]')
            """Channel 4 Disable"""
            self.disable_ch[4].pos = 4
            self.disable_ch[5] = Ad7771.ClockDisable.DisableCh(self, 'disable_ch[5]')
            """Channel 5 Disable"""
            self.disable_ch[5].pos = 5
            self.disable_ch[6] = Ad7771.ClockDisable.DisableCh(self, 'disable_ch[6]')
            """Channel 6 Disable"""
            self.disable_ch[6].pos = 6
            self.disable_ch[7] = Ad7771.ClockDisable.DisableCh(self, 'disable_ch[7]')
            """Channel 7 Disable"""
            self.disable_ch[7].pos = 7

    @typing.final
    class ChannelSyncOffset(Register):
        """Channel  Sync offset"""

        class SyncOffset(Field):
            """Sync offset"""
            pos: int = 0
            width: int = 8
            value: int = 0
            signed: bool = True
            kind: str = "RW"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.sync_offset = Ad7771.ChannelSyncOffset.SyncOffset(self, 'sync_offset')
            """Sync offset"""

    @typing.final
    class UserCfg1(Register):
        """General user configuration 1 (power-down/reset)"""

        class SoftReset(Field):
            """Soft reset"""
            pos: int = 0
            width: int = 2
            value: int = 0
            signed: bool = False
            kind: str = "RW"

            def enum_kind(self) -> None| type[IntEnum]:
               return Ad7771.e_soft_reset

        class PdbRcOsc(Field):
            """Power down internal oscillator (active low)"""
            pos: int = 2
            width: int = 1
            value: int = 1
            signed: bool = False
            kind: str = "RW"

        class PdbSar(Field):
            """Power down SAR (active low)"""
            pos: int = 3
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RW"

        class PdbRefout(Field):
            """Power down Reference output buffer (active low)"""
            pos: int = 4
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RW"

        class PdbVcm(Field):
            """Power down VCM buffer (active low)"""
            pos: int = 5
            width: int = 1
            value: int = 1
            signed: bool = False
            kind: str = "RW"

        class PowerMode(Field):
            """Power down VCM buffer (active low)"""
            pos: int = 6
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RW"

            def enum_kind(self) -> None| type[IntEnum]:
               return Ad7771.e_power_mode

        class AllChDisMclk(Field):
            """Keep DCLK even when all channel are disabled"""
            pos: int = 7
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RW"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.soft_reset = Ad7771.UserCfg1.SoftReset(self, 'soft_reset')
            """Soft reset"""
            self.pdb_rc_osc = Ad7771.UserCfg1.PdbRcOsc(self, 'pdb_rc_osc')
            """Power down internal oscillator (active low)"""
            self.pdb_sar = Ad7771.UserCfg1.PdbSar(self, 'pdb_sar')
            """Power down SAR (active low)"""
            self.pdb_refout = Ad7771.UserCfg1.PdbRefout(self, 'pdb_refout')
            """Power down Reference output buffer (active low)"""
            self.pdb_vcm = Ad7771.UserCfg1.PdbVcm(self, 'pdb_vcm')
            """Power down VCM buffer (active low)"""
            self.power_mode = Ad7771.UserCfg1.PowerMode(self, 'power_mode')
            """Power down VCM buffer (active low)"""
            self.all_ch_dis_mclk = Ad7771.UserCfg1.AllChDisMclk(self, 'all_ch_dis_mclk')
            """Keep DCLK even when all channel are disabled"""

    @typing.final
    class UserCfg2(Register):
        """General user configuration 2 (drive/filter)"""

        class SpiSync(Field):
            """SYNC pulse generated through SPI

            When low, this signal is AND’ed with the value on the START pin in the control module and generates a pulse in the SYNC_IN pin.
            When high, this bit is AND’ed with the value on START pin in the control module"""
            pos: int = 0
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RW"

        class DoutDriveStr(Field):
            """Configure drive strength for DOUT"""
            pos: int = 1
            width: int = 2
            value: int = 0
            signed: bool = False
            kind: str = "RW"

            def enum_kind(self) -> None| type[IntEnum]:
               return Ad7771.e_drive_str

        class SdoDriveStr(Field):
            """Configure drive strength for SDO"""
            pos: int = 3
            width: int = 2
            value: int = 1
            signed: bool = False
            kind: str = "RW"

            def enum_kind(self) -> None| type[IntEnum]:
               return Ad7771.e_drive_str

        class SarDiagEn(Field):
            """Sets SPI interface to read back SAR result on SDO"""
            pos: int = 5
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RW"

        class FilterMode(Field):
            """Power down VCM buffer (active low)"""
            pos: int = 6
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RW"

            def enum_kind(self) -> None| type[IntEnum]:
               return Ad7771.e_filter_mode

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.spi_sync = Ad7771.UserCfg2.SpiSync(self, 'spi_sync')
            """SYNC pulse generated through SPI

            When low, this signal is AND’ed with the value on the START pin in the control module and generates a pulse in the SYNC_IN pin.
            When high, this bit is AND’ed with the value on START pin in the control module"""
            self.dout_drive_str = Ad7771.UserCfg2.DoutDriveStr(self, 'dout_drive_str')
            """Configure drive strength for DOUT"""
            self.sdo_drive_str = Ad7771.UserCfg2.SdoDriveStr(self, 'sdo_drive_str')
            """Configure drive strength for SDO"""
            self.sar_diag_en = Ad7771.UserCfg2.SarDiagEn(self, 'sar_diag_en')
            """Sets SPI interface to read back SAR result on SDO"""
            self.filter_mode = Ad7771.UserCfg2.FilterMode(self, 'filter_mode')
            """Power down VCM buffer (active low)"""

    @typing.final
    class UserCfg3(Register):
        """General user configuration 3"""

        class ClkQualDis(Field):
            """Disable clock qualifier check if user reqyire to use an MCLK < 256 kHz"""
            pos: int = 0
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RW"

        class SpiSubordinate(Field):
            """Enable SPI subordinate to read-back ADC on SDO"""
            pos: int = 4
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RW"

        class ConvstDeglitchDis(Field):
            """Disable deglitching of CONVST_SAR pin"""
            pos: int = 6
            width: int = 2
            value: int = 2
            signed: bool = False
            kind: str = "RW"

            def enum_kind(self) -> None| type[IntEnum]:
               return Ad7771.e_deglitch

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.clk_qual_dis = Ad7771.UserCfg3.ClkQualDis(self, 'clk_qual_dis')
            """Disable clock qualifier check if user reqyire to use an MCLK < 256 kHz"""
            self.spi_subordinate = Ad7771.UserCfg3.SpiSubordinate(self, 'spi_subordinate')
            """Enable SPI subordinate to read-back ADC on SDO"""
            self.convst_deglitch_dis = Ad7771.UserCfg3.ConvstDeglitchDis(self, 'convst_deglitch_dis')
            """Disable deglitching of CONVST_SAR pin"""

    @typing.final
    class DataOutput(Register):
        """Data output format"""

        class DclkDiv(Field):
            """MCLK divider (power of 2)"""
            pos: int = 1
            width: int = 3
            value: int = 0
            signed: bool = False
            kind: str = "RW"

        class HeaderFormat(Field):
            """Header format"""
            pos: int = 5
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RW"

            def enum_kind(self) -> None| type[IntEnum]:
               return Ad7771.e_header_format

        class DataFormat(Field):
            """Data out format"""
            pos: int = 6
            width: int = 2
            value: int = 0
            signed: bool = False
            kind: str = "RW"

            def enum_kind(self) -> None| type[IntEnum]:
               return Ad7771.e_data_format

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.dclk_div = Ad7771.DataOutput.DclkDiv(self, 'dclk_div')
            """MCLK divider (power of 2)"""
            self.header_format = Ad7771.DataOutput.HeaderFormat(self, 'header_format')
            """Header format"""
            self.data_format = Ad7771.DataOutput.DataFormat(self, 'data_format')
            """Data out format"""

    @typing.final
    class MuxCtrlRefMtr(Register):
        """ADC/Reference muc control"""

        class Mtr(Field):
            """SD ADC Meter mux"""
            pos: int = 2
            width: int = 4
            value: int = 0
            signed: bool = False
            kind: str = "RW"

            def enum_kind(self) -> None| type[IntEnum]:
               return Ad7771.e_mtr_mux

        class Ref(Field):
            """SD ADC reference mux"""
            pos: int = 6
            width: int = 2
            value: int = 0
            signed: bool = False
            kind: str = "RW"

            def enum_kind(self) -> None| type[IntEnum]:
               return Ad7771.e_ref_mux

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.mtr = Ad7771.MuxCtrlRefMtr.Mtr(self, 'mtr')
            """SD ADC Meter mux"""
            self.ref = Ad7771.MuxCtrlRefMtr.Ref(self, 'ref')
            """SD ADC reference mux"""

    @typing.final
    class MuxCtrlGlobal(Register):
        """ADC/Reference muc control"""

        class Global(Field):
            """SD ADC reference mux"""
            pos: int = 3
            width: int = 5
            value: int = 0
            signed: bool = False
            kind: str = "RW"

            def enum_kind(self) -> None| type[IntEnum]:
               return Ad7771.e_glob_mux

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.global = Ad7771.MuxCtrlGlobal.Global(self, 'global')
            """SD ADC reference mux"""

    @typing.final
    class GpioCfg(Register):
        """GPIO configuration register"""

        class OpEn(Field):
            """Input/Output"""
            pos: int = 0
            width: int = 3
            value: int = 0
            signed: bool = False
            kind: str = "RW"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.op_en = Ad7771.GpioCfg.OpEn(self, 'op_en')
            """Input/Output"""

    @typing.final
    class GpioData(Register):
        """GPIO configuration register"""

        class Write(Field):
            """Value sent to the GPIO pins"""
            pos: int = 0
            width: int = 3
            value: int = 0
            signed: bool = False
            kind: str = "RW"

        class Read(Field):
            """Data read from the GPIO pins"""
            pos: int = 3
            width: int = 3
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.write = Ad7771.GpioData.Write(self, 'write')
            """Value sent to the GPIO pins"""
            self.read = Ad7771.GpioData.Read(self, 'read')
            """Data read from the GPIO pins"""

    @typing.final
    class BufferCfg1(Register):
        """Buffer configuration 1"""

        class RefBufNegEn(Field):
            """Reference buffer negative enable"""
            pos: int = 3
            width: int = 1
            value: int = 1
            signed: bool = False
            kind: str = "RW"

        class RefBufPosEn(Field):
            """Reference buffer positive enable"""
            pos: int = 4
            width: int = 1
            value: int = 1
            signed: bool = False
            kind: str = "RW"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.ref_buf_neg_en = Ad7771.BufferCfg1.RefBufNegEn(self, 'ref_buf_neg_en')
            """Reference buffer negative enable"""
            self.ref_buf_pos_en = Ad7771.BufferCfg1.RefBufPosEn(self, 'ref_buf_pos_en')
            """Reference buffer positive enable"""

    @typing.final
    class BufferCfg2(Register):
        """Buffer configuration (reference)"""

        class PdbDldoOvrdrv(Field):
            """DREGCAP Overdrive Enable"""
            pos: int = 0
            width: int = 1
            value: int = 1
            signed: bool = False
            kind: str = "RW"

        class PdbAldo2Ovrdrv(Field):
            """AREG2CAP Overdrive Enable"""
            pos: int = 1
            width: int = 1
            value: int = 1
            signed: bool = False
            kind: str = "RW"

        class PdbAldo1Ovrdrv(Field):
            """AREG1CAP Overdrive Enable"""
            pos: int = 2
            width: int = 1
            value: int = 1
            signed: bool = False
            kind: str = "RW"

        class RefBufNegPreq(Field):
            """Reference Buffer Negative Precharge Enable"""
            pos: int = 6
            width: int = 1
            value: int = 1
            signed: bool = False
            kind: str = "RW"

        class RefBufPosPreq(Field):
            """Reference Buffer Positive Precharge Enable"""
            pos: int = 7
            width: int = 1
            value: int = 1
            signed: bool = False
            kind: str = "RW"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.pdb_dldo_ovrdrv = Ad7771.BufferCfg2.PdbDldoOvrdrv(self, 'pdb_dldo_ovrdrv')
            """DREGCAP Overdrive Enable"""
            self.pdb_aldo2_ovrdrv = Ad7771.BufferCfg2.PdbAldo2Ovrdrv(self, 'pdb_aldo2_ovrdrv')
            """AREG2CAP Overdrive Enable"""
            self.pdb_aldo1_ovrdrv = Ad7771.BufferCfg2.PdbAldo1Ovrdrv(self, 'pdb_aldo1_ovrdrv')
            """AREG1CAP Overdrive Enable"""
            self.ref_buf_neg_preq = Ad7771.BufferCfg2.RefBufNegPreq(self, 'ref_buf_neg_preq')
            """Reference Buffer Negative Precharge Enable"""
            self.ref_buf_pos_preq = Ad7771.BufferCfg2.RefBufPosPreq(self, 'ref_buf_pos_preq')
            """Reference Buffer Positive Precharge Enable"""

    @typing.final
    class ChannelOffsetUp(Register):
        """Channel  offset (upper byte)"""

        class Offset(Field):
            """Offset (bit 23:16)"""
            pos: int = 0
            width: int = 8
            value: int = 0
            signed: bool = True
            kind: str = "RW"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.offset = Ad7771.ChannelOffsetUp.Offset(self, 'offset')
            """Offset (bit 23:16)"""

    @typing.final
    class ChannelOffsetMid(Register):
        """Channel  offset (middle byte)"""

        class Offset(Field):
            """Offset (bit 15:8)"""
            pos: int = 0
            width: int = 8
            value: int = 0
            signed: bool = True
            kind: str = "RW"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.offset = Ad7771.ChannelOffsetMid.Offset(self, 'offset')
            """Offset (bit 15:8)"""

    @typing.final
    class ChannelOffsetLow(Register):
        """Channel  offset (lower byte)"""

        class Offset(Field):
            """Offset (bit 7:0)"""
            pos: int = 0
            width: int = 8
            value: int = 0
            signed: bool = True
            kind: str = "RW"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.offset = Ad7771.ChannelOffsetLow.Offset(self, 'offset')
            """Offset (bit 7:0)"""

    @typing.final
    class ChannelGainUp(Register):
        """Channel  gain (upper byte)"""

        class Gain(Field):
            """Gain (bit 23:16)"""
            pos: int = 0
            width: int = 8
            value: int = 0
            signed: bool = False
            kind: str = "RW"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.gain = Ad7771.ChannelGainUp.Gain(self, 'gain')
            """Gain (bit 23:16)"""

    @typing.final
    class ChannelGainMid(Register):
        """Channel  gain (middle byte)"""

        class Gain(Field):
            """Gain (bit 15:8)"""
            pos: int = 0
            width: int = 8
            value: int = 0
            signed: bool = False
            kind: str = "RW"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.gain = Ad7771.ChannelGainMid.Gain(self, 'gain')
            """Gain (bit 15:8)"""

    @typing.final
    class ChannelGainLow(Register):
        """Channel  gain (lower byte)"""

        class Gain(Field):
            """Gain (bit 7:0)"""
            pos: int = 0
            width: int = 8
            value: int = 0
            signed: bool = False
            kind: str = "RW"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.gain = Ad7771.ChannelGainLow.Gain(self, 'gain')
            """Gain (bit 7:0)"""

    @typing.final
    class ChannelStatus(Register):
        """Channel  status"""

        class ErrRefDet(Field):
            """Channel 0 — Reference Detect Error"""
            pos: int = 0
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        class ErrAinpOv(Field):
            """Channel 0 — AIN0+ Overvoltage Error"""
            pos: int = 1
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        class ErrAinpUv(Field):
            """Channel 0 — AIN0+ Undervoltage Error"""
            pos: int = 2
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        class ErrAinmOv(Field):
            """Channel 0 — AIN0− Overvoltage Error"""
            pos: int = 3
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        class ErrAinmUv(Field):
            """Channel 0 — AIN0− Undervoltage Error"""
            pos: int = 4
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, True, init)
            self.err_ref_det = Ad7771.ChannelStatus.ErrRefDet(self, 'err_ref_det')
            """Channel 0 — Reference Detect Error"""
            self.err_ainp_ov = Ad7771.ChannelStatus.ErrAinpOv(self, 'err_ainp_ov')
            """Channel 0 — AIN0+ Overvoltage Error"""
            self.err_ainp_uv = Ad7771.ChannelStatus.ErrAinpUv(self, 'err_ainp_uv')
            """Channel 0 — AIN0+ Undervoltage Error"""
            self.err_ainm_ov = Ad7771.ChannelStatus.ErrAinmOv(self, 'err_ainm_ov')
            """Channel 0 — AIN0− Overvoltage Error"""
            self.err_ainm_uv = Ad7771.ChannelStatus.ErrAinmUv(self, 'err_ainm_uv')
            """Channel 0 — AIN0− Undervoltage Error"""

    @typing.final
    class ChannelDspErr(Register):
        """Channel (2*i)/(2*i+1) DSP errors"""

        class ErrOutputSat(Field):
            """Channel 0 — ADC conversion has exceeded limits and has been clamped"""
            pos: int = 0
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        class ErrFilterSat(Field):
            """Channel 0 — Filter result has exceeded a reasonable level, before offset and gain calibration has been applied"""
            pos: int = 1
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        class ErrModSat(Field):
            """Channel 0 — Modulator Output Saturation Error"""
            pos: int = 2
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, True, init)
            self.err_output_sat: dict[int, Ad7771.ChannelDspErr.ErrOutputSat] = {}
            self.err_output_sat[0] = Ad7771.ChannelDspErr.ErrOutputSat(self, 'err_output_sat[0]')
            """Channel 0 — ADC conversion has exceeded limits and has been clamped"""
            self.err_output_sat[0].pos = 0
            self.err_filter_sat: dict[int, Ad7771.ChannelDspErr.ErrFilterSat] = {}
            self.err_filter_sat[0] = Ad7771.ChannelDspErr.ErrFilterSat(self, 'err_filter_sat[0]')
            """Channel 0 — Filter result has exceeded a reasonable level, before offset and gain calibration has been applied"""
            self.err_filter_sat[0].pos = 1
            self.err_mod_sat: dict[int, Ad7771.ChannelDspErr.ErrModSat] = {}
            self.err_mod_sat[0] = Ad7771.ChannelDspErr.ErrModSat(self, 'err_mod_sat[0]')
            """Channel 0 — Modulator Output Saturation Error"""
            self.err_mod_sat[0].pos = 2
            self.err_output_sat[1] = Ad7771.ChannelDspErr.ErrOutputSat(self, 'err_output_sat[1]')
            """Channel 1 — ADC conversion has exceeded limits and has been clamped"""
            self.err_output_sat[1].pos = 3
            self.err_filter_sat[1] = Ad7771.ChannelDspErr.ErrFilterSat(self, 'err_filter_sat[1]')
            """Channel 1 — Filter result has exceeded a reasonable level, before offset and gain calibration has been applied"""
            self.err_filter_sat[1].pos = 4
            self.err_mod_sat[1] = Ad7771.ChannelDspErr.ErrModSat(self, 'err_mod_sat[1]')
            """Channel 1 — Modulator Output Saturation Error"""
            self.err_mod_sat[1].pos = 5

    @typing.final
    class ChannelTestEn(Register):
        """Channel 0 to 7 test enable"""

        class RefDetTestEn(Field):
            """Reference Detect Test Enable"""
            pos: int = 0
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RW"

        class AinpOvTestEn(Field):
            """AINx+ Overvoltage Test Enable"""
            pos: int = 1
            width: int = 1
            value: int = 1
            signed: bool = False
            kind: str = "RW"

        class AinpUvTestEn(Field):
            """AINx+ Undervoltage Test Enable"""
            pos: int = 2
            width: int = 1
            value: int = 1
            signed: bool = False
            kind: str = "RW"

        class AinmOvTestEn(Field):
            """AINx− Overvoltage Test Enable"""
            pos: int = 3
            width: int = 1
            value: int = 1
            signed: bool = False
            kind: str = "RW"

        class AinmUvTestEn(Field):
            """AINx− Undervoltage Test Enable"""
            pos: int = 4
            width: int = 1
            value: int = 1
            signed: bool = False
            kind: str = "RW"

        class ModSatTestEn(Field):
            """Enable Error Flag for Modulator Saturation"""
            pos: int = 5
            width: int = 1
            value: int = 1
            signed: bool = False
            kind: str = "RW"

        class FilterSatTestEn(Field):
            """Filter Saturation Test Enable"""
            pos: int = 6
            width: int = 1
            value: int = 1
            signed: bool = False
            kind: str = "RW"

        class OutputSatTestEn(Field):
            """ADC Conversion Error Test Enable"""
            pos: int = 7
            width: int = 1
            value: int = 1
            signed: bool = False
            kind: str = "RW"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.ref_det_test_en = Ad7771.ChannelTestEn.RefDetTestEn(self, 'ref_det_test_en')
            """Reference Detect Test Enable"""
            self.ainp_ov_test_en = Ad7771.ChannelTestEn.AinpOvTestEn(self, 'ainp_ov_test_en')
            """AINx+ Overvoltage Test Enable"""
            self.ainp_uv_test_en = Ad7771.ChannelTestEn.AinpUvTestEn(self, 'ainp_uv_test_en')
            """AINx+ Undervoltage Test Enable"""
            self.ainm_ov_test_en = Ad7771.ChannelTestEn.AinmOvTestEn(self, 'ainm_ov_test_en')
            """AINx− Overvoltage Test Enable"""
            self.ainm_uv_test_en = Ad7771.ChannelTestEn.AinmUvTestEn(self, 'ainm_uv_test_en')
            """AINx− Undervoltage Test Enable"""
            self.mod_sat_test_en = Ad7771.ChannelTestEn.ModSatTestEn(self, 'mod_sat_test_en')
            """Enable Error Flag for Modulator Saturation"""
            self.filter_sat_test_en = Ad7771.ChannelTestEn.FilterSatTestEn(self, 'filter_sat_test_en')
            """Filter Saturation Test Enable"""
            self.output_sat_test_en = Ad7771.ChannelTestEn.OutputSatTestEn(self, 'output_sat_test_en')
            """ADC Conversion Error Test Enable"""

    @typing.final
    class GeneralErr1(Register):
        """General Error 1"""

        class SpiCrcErr(Field):
            """SPI CRC error"""
            pos: int = 0
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        class SpiInvalidWriteErr(Field):
            """SPI invalid write address"""
            pos: int = 1
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        class SpiInvalidReadErr(Field):
            """SPI invalid read address"""
            pos: int = 2
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        class SpiClkCountErr(Field):
            """SPI clock counter error"""
            pos: int = 3
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        class RomCrcErr(Field):
            """A CRC of the fuse contents is run periodically to check for errors in the fuses"""
            pos: int = 4
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        class MemmapCrcErr(Field):
            """A CRC of the memory map contents is run periodically to check for errors"""
            pos: int = 5
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, True, init)
            self.spi_crc_err = Ad7771.GeneralErr1.SpiCrcErr(self, 'spi_crc_err')
            """SPI CRC error"""
            self.spi_invalid_write_err = Ad7771.GeneralErr1.SpiInvalidWriteErr(self, 'spi_invalid_write_err')
            """SPI invalid write address"""
            self.spi_invalid_read_err = Ad7771.GeneralErr1.SpiInvalidReadErr(self, 'spi_invalid_read_err')
            """SPI invalid read address"""
            self.spi_clk_count_err = Ad7771.GeneralErr1.SpiClkCountErr(self, 'spi_clk_count_err')
            """SPI clock counter error"""
            self.rom_crc_err = Ad7771.GeneralErr1.RomCrcErr(self, 'rom_crc_err')
            """A CRC of the fuse contents is run periodically to check for errors in the fuses"""
            self.memmap_crc_err = Ad7771.GeneralErr1.MemmapCrcErr(self, 'memmap_crc_err')
            """A CRC of the memory map contents is run periodically to check for errors"""

    @typing.final
    class GeneralErr1En(Register):
        """General Error 1 Enable"""

        class SpiCrcErrEn(Field):
            """Enable SPI CRC error"""
            pos: int = 0
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RW"

        class SpiInvalidWriteErrEn(Field):
            """Enable SPI invalid write address"""
            pos: int = 1
            width: int = 1
            value: int = 1
            signed: bool = False
            kind: str = "RW"

        class SpiInvalidReadErrEn(Field):
            """Enable SPI invalid read address"""
            pos: int = 2
            width: int = 1
            value: int = 1
            signed: bool = False
            kind: str = "RW"

        class SpiClkCountErrEn(Field):
            """Enable SPI clock counter error"""
            pos: int = 3
            width: int = 1
            value: int = 1
            signed: bool = False
            kind: str = "RW"

        class RomCrcErrEn(Field):
            """Enable a CRC of the fuse contents is run periodically to check for errors in the fuses"""
            pos: int = 4
            width: int = 1
            value: int = 1
            signed: bool = False
            kind: str = "RW"

        class MemmapCrcErrEn(Field):
            """Enable a CRC of the memory map contents is run periodically to check for errors"""
            pos: int = 5
            width: int = 1
            value: int = 1
            signed: bool = False
            kind: str = "RW"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.spi_crc_err_en = Ad7771.GeneralErr1En.SpiCrcErrEn(self, 'spi_crc_err_en')
            """Enable SPI CRC error"""
            self.spi_invalid_write_err_en = Ad7771.GeneralErr1En.SpiInvalidWriteErrEn(self, 'spi_invalid_write_err_en')
            """Enable SPI invalid write address"""
            self.spi_invalid_read_err_en = Ad7771.GeneralErr1En.SpiInvalidReadErrEn(self, 'spi_invalid_read_err_en')
            """Enable SPI invalid read address"""
            self.spi_clk_count_err_en = Ad7771.GeneralErr1En.SpiClkCountErrEn(self, 'spi_clk_count_err_en')
            """Enable SPI clock counter error"""
            self.rom_crc_err_en = Ad7771.GeneralErr1En.RomCrcErrEn(self, 'rom_crc_err_en')
            """Enable a CRC of the fuse contents is run periodically to check for errors in the fuses"""
            self.memmap_crc_err_en = Ad7771.GeneralErr1En.MemmapCrcErrEn(self, 'memmap_crc_err_en')
            """Enable a CRC of the memory map contents is run periodically to check for errors"""

    @typing.final
    class GeneralErr2(Register):
        """General Error 2"""

        class DldoPsmErr(Field):
            """DREGCAP Power Supply Error"""
            pos: int = 0
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        class Aldo2PsmErr(Field):
            """AREG2CAP Power Supply Error"""
            pos: int = 1
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        class Aldo1PsmErr(Field):
            """AREG1CAP Power Supply Error"""
            pos: int = 2
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        class ExtMclkSwitchErr(Field):
            """Clock Not Switched Over"""
            pos: int = 4
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        class ResetDetected(Field):
            """Reset Detected"""
            pos: int = 5
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, True, init)
            self.dldo_psm_err = Ad7771.GeneralErr2.DldoPsmErr(self, 'dldo_psm_err')
            """DREGCAP Power Supply Error"""
            self.aldo2_psm_err = Ad7771.GeneralErr2.Aldo2PsmErr(self, 'aldo2_psm_err')
            """AREG2CAP Power Supply Error"""
            self.aldo1_psm_err = Ad7771.GeneralErr2.Aldo1PsmErr(self, 'aldo1_psm_err')
            """AREG1CAP Power Supply Error"""
            self.ext_mclk_switch_err = Ad7771.GeneralErr2.ExtMclkSwitchErr(self, 'ext_mclk_switch_err')
            """Clock Not Switched Over"""
            self.reset_detected = Ad7771.GeneralErr2.ResetDetected(self, 'reset_detected')
            """Reset Detected"""

    @typing.final
    class GeneralErr2En(Register):
        """General Error 2"""

        class LdoPsmTripTest(Field):
            """Run PSM Trip

            00 — no trip detect test enabled
            01 — run trip detect test on AREG1CAP
            10 — run trip detect test on AREG2CAP
            11 — run trip detect test on DREGCAP"""
            pos: int = 0
            width: int = 2
            value: int = 0
            signed: bool = False
            kind: str = "Pulse"

        class DldoPsmErrEn(Field):
            """Enable digital Power Supply Error"""
            pos: int = 2
            width: int = 1
            value: int = 1
            signed: bool = False
            kind: str = "RW"

        class AldoPsmErrEn(Field):
            """Enable analog Power Supply Error"""
            pos: int = 3
            width: int = 1
            value: int = 1
            signed: bool = False
            kind: str = "RW"

        class ResetDetectedEn(Field):
            """Enable Reset Detected"""
            pos: int = 5
            width: int = 1
            value: int = 1
            signed: bool = False
            kind: str = "RW"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.ldo_psm_trip_test = Ad7771.GeneralErr2En.LdoPsmTripTest(self, 'ldo_psm_trip_test')
            """Run PSM Trip

            00 — no trip detect test enabled
            01 — run trip detect test on AREG1CAP
            10 — run trip detect test on AREG2CAP
            11 — run trip detect test on DREGCAP"""
            self.dldo_psm_err_en = Ad7771.GeneralErr2En.DldoPsmErrEn(self, 'dldo_psm_err_en')
            """Enable digital Power Supply Error"""
            self.aldo_psm_err_en = Ad7771.GeneralErr2En.AldoPsmErrEn(self, 'aldo_psm_err_en')
            """Enable analog Power Supply Error"""
            self.reset_detected_en = Ad7771.GeneralErr2En.ResetDetectedEn(self, 'reset_detected_en')
            """Enable Reset Detected"""

    @typing.final
    class ErrorStatus1(Register):
        """Error Status 1"""

        class ErrLocCh(Field):
            """Error specific to channel 0"""
            pos: int = 0
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        class ChipError1(Field):
            """High when any error bit is high"""
            pos: int = 5
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, True, init)
            self.err_loc_ch: dict[int, Ad7771.ErrorStatus1.ErrLocCh] = {}
            self.err_loc_ch[0] = Ad7771.ErrorStatus1.ErrLocCh(self, 'err_loc_ch[0]')
            """Error specific to channel 0"""
            self.err_loc_ch[0].pos = 0
            self.err_loc_ch[1] = Ad7771.ErrorStatus1.ErrLocCh(self, 'err_loc_ch[1]')
            """Error specific to channel 1"""
            self.err_loc_ch[1].pos = 1
            self.err_loc_ch[2] = Ad7771.ErrorStatus1.ErrLocCh(self, 'err_loc_ch[2]')
            """Error specific to channel 2"""
            self.err_loc_ch[2].pos = 2
            self.err_loc_ch[3] = Ad7771.ErrorStatus1.ErrLocCh(self, 'err_loc_ch[3]')
            """Error specific to channel 3"""
            self.err_loc_ch[3].pos = 3
            self.err_loc_ch[4] = Ad7771.ErrorStatus1.ErrLocCh(self, 'err_loc_ch[4]')
            """Error specific to channel 4"""
            self.err_loc_ch[4].pos = 4
            self.chip_error1 = Ad7771.ErrorStatus1.ChipError1(self, 'chip_error1')
            """High when any error bit is high"""

    @typing.final
    class ErrorStatus2(Register):
        """Error Status 2"""

        class ErrLocGen(Field):
            """Error specific to gen_err[1]"""
            pos: int = 3
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        class ChipError2(Field):
            """High when any error bit is high"""
            pos: int = 5
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, True, init)
            self.err_loc_ch: dict[int, Ad7771.ErrorStatus1.ErrLocCh] = {}
            self.err_loc_ch[5] = Ad7771.ErrorStatus1.ErrLocCh(self, 'err_loc_ch[5]')
            """Error specific to channel 5"""
            self.err_loc_ch[5].pos = 0
            self.err_loc_ch[6] = Ad7771.ErrorStatus1.ErrLocCh(self, 'err_loc_ch[6]')
            """Error specific to channel 6"""
            self.err_loc_ch[6].pos = 1
            self.err_loc_ch[7] = Ad7771.ErrorStatus1.ErrLocCh(self, 'err_loc_ch[7]')
            """Error specific to channel 7"""
            self.err_loc_ch[7].pos = 2
            self.err_loc_gen: dict[int, Ad7771.ErrorStatus2.ErrLocGen] = {}
            self.err_loc_gen[0] = Ad7771.ErrorStatus2.ErrLocGen(self, 'err_loc_gen[0]')
            """Error specific to gen_err[1]"""
            self.err_loc_gen[0].pos = 3
            self.err_loc_gen[1] = Ad7771.ErrorStatus2.ErrLocGen(self, 'err_loc_gen[1]')
            """Error specific to gen_err[2]"""
            self.err_loc_gen[1].pos = 4
            self.chip_error2 = Ad7771.ErrorStatus2.ChipError2(self, 'chip_error2')
            """High when any error bit is high"""

    @typing.final
    class ErrorStatus3(Register):
        """Error Status 3"""

        class ErrLocSatCh(Field):
            """Sat Error specific to channel 0 / 1"""
            pos: int = 0
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        class InitComplete(Field):
            """Fuse init complete"""
            pos: int = 4
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        class ChipError3(Field):
            """High when any error bit is high"""
            pos: int = 5
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RO"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, True, init)
            self.err_loc_sat_ch: dict[int, Ad7771.ErrorStatus3.ErrLocSatCh] = {}
            self.err_loc_sat_ch[0] = Ad7771.ErrorStatus3.ErrLocSatCh(self, 'err_loc_sat_ch[0]')
            """Sat Error specific to channel 0 / 1"""
            self.err_loc_sat_ch[0].pos = 0
            self.err_loc_sat_ch[1] = Ad7771.ErrorStatus3.ErrLocSatCh(self, 'err_loc_sat_ch[1]')
            """Sat Error specific to channel 1 / 2"""
            self.err_loc_sat_ch[1].pos = 1
            self.err_loc_sat_ch[2] = Ad7771.ErrorStatus3.ErrLocSatCh(self, 'err_loc_sat_ch[2]')
            """Sat Error specific to channel 2 / 3"""
            self.err_loc_sat_ch[2].pos = 2
            self.err_loc_sat_ch[3] = Ad7771.ErrorStatus3.ErrLocSatCh(self, 'err_loc_sat_ch[3]')
            """Sat Error specific to channel 3 / 4"""
            self.err_loc_sat_ch[3].pos = 3
            self.init_complete = Ad7771.ErrorStatus3.InitComplete(self, 'init_complete')
            """Fuse init complete"""
            self.chip_error3 = Ad7771.ErrorStatus3.ChipError3(self, 'chip_error3')
            """High when any error bit is high"""

    @typing.final
    class SrcNMsb(Register):
        """Sample Rate converter N MSB"""

        class SrcN(Field):
            """Sample Rate converter N[11:8]"""
            pos: int = 0
            width: int = 4
            value: int = 0
            signed: bool = False
            kind: str = "RW"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.src_n = Ad7771.SrcNMsb.SrcN(self, 'src_n')
            """Sample Rate converter N[11:8]"""

    @typing.final
    class SrcNLsb(Register):
        """Sample Rate converter N LSB"""

        class SrcN(Field):
            """Sample Rate converter N[7:0]"""
            pos: int = 0
            width: int = 8
            value: int = 0
            signed: bool = False
            kind: str = "RW"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.src_n = Ad7771.SrcNLsb.SrcN(self, 'src_n')
            """Sample Rate converter N[7:0]"""

    @typing.final
    class SrcIfMsb(Register):
        """Sample Rate converter IF MSB"""

        class SrcIf(Field):
            """Sample Rate converter IF[15:8]"""
            pos: int = 0
            width: int = 8
            value: int = 0
            signed: bool = False
            kind: str = "RW"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.src_if = Ad7771.SrcIfMsb.SrcIf(self, 'src_if')
            """Sample Rate converter IF[15:8]"""

    @typing.final
    class SrcIfLsb(Register):
        """Sample Rate converter IF LSB"""

        class SrcIf(Field):
            """Sample Rate converter IF[7:0]"""
            pos: int = 0
            width: int = 8
            value: int = 0
            signed: bool = False
            kind: str = "RW"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.src_if = Ad7771.SrcIfLsb.SrcIf(self, 'src_if')
            """Sample Rate converter IF[7:0]"""

    @typing.final
    class SrcLoad(Register):
        """Sample Rate converter load"""

        class LoadUpdate(Field):
            """Assert to load SRC registers into SRC"""
            pos: int = 0
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "Pulse"

        class LoadSource(Field):
            """Select which option to load an SRC update"""
            pos: int = 7
            width: int = 1
            value: int = 0
            signed: bool = False
            kind: str = "RW"

        def __init__(self, parent: None | Peripheral, name: str, addr: int, init: None | int = None):
            super().__init__(parent, name, addr, False, init)
            self.load_update = Ad7771.SrcLoad.LoadUpdate(self, 'load_update')
            """Assert to load SRC registers into SRC"""
            self.load_source = Ad7771.SrcLoad.LoadSource(self, 'load_source')
            """Select which option to load an SRC update"""

    def __init__(self, name: str, addr: int):
        super().__init__(name, addr)
        self.channel_cfg: list[Ad7771.ChannelCfg] = []
        """Channel  configuration"""
        self.channel_cfg.append(Ad7771.ChannelCfg(self, "channel_cfg0", 0, 0x0))
        self.channel_cfg.append(Ad7771.ChannelCfg(self, "channel_cfg1", 1, 0x0))
        self.channel_cfg.append(Ad7771.ChannelCfg(self, "channel_cfg2", 2, 0x0))
        self.channel_cfg.append(Ad7771.ChannelCfg(self, "channel_cfg3", 3, 0x0))
        self.channel_cfg.append(Ad7771.ChannelCfg(self, "channel_cfg4", 4, 0x0))
        self.channel_cfg.append(Ad7771.ChannelCfg(self, "channel_cfg5", 5, 0x0))
        self.channel_cfg.append(Ad7771.ChannelCfg(self, "channel_cfg6", 6, 0x0))
        self.channel_cfg.append(Ad7771.ChannelCfg(self, "channel_cfg7", 7, 0x0))
        self.clock_disable = Ad7771.ClockDisable(self, "clock_disable", 8, 0x0)
        """Clock disable per channel"""
        self.channel_sync_offset: list[Ad7771.ChannelSyncOffset] = []
        """Channel  Sync offset"""
        self.channel_sync_offset.append(Ad7771.ChannelSyncOffset(self, "channel_sync_offset0", 9, 0x0))
        self.channel_sync_offset.append(Ad7771.ChannelSyncOffset(self, "channel_sync_offset1", 10, 0x0))
        self.channel_sync_offset.append(Ad7771.ChannelSyncOffset(self, "channel_sync_offset2", 11, 0x0))
        self.channel_sync_offset.append(Ad7771.ChannelSyncOffset(self, "channel_sync_offset3", 12, 0x0))
        self.channel_sync_offset.append(Ad7771.ChannelSyncOffset(self, "channel_sync_offset4", 13, 0x0))
        self.channel_sync_offset.append(Ad7771.ChannelSyncOffset(self, "channel_sync_offset5", 14, 0x0))
        self.channel_sync_offset.append(Ad7771.ChannelSyncOffset(self, "channel_sync_offset6", 15, 0x0))
        self.channel_sync_offset.append(Ad7771.ChannelSyncOffset(self, "channel_sync_offset7", 16, 0x0))
        self.user_cfg1 = Ad7771.UserCfg1(self, "user_cfg1", 17, 0x24)
        """General user configuration 1 (power-down/reset)"""
        self.user_cfg2 = Ad7771.UserCfg2(self, "user_cfg2", 18, 0x8)
        """General user configuration 2 (drive/filter)"""
        self.user_cfg3 = Ad7771.UserCfg3(self, "user_cfg3", 19, 0x80)
        """General user configuration 3"""
        self.data_output = Ad7771.DataOutput(self, "data_output", 20, 0x0)
        """Data output format"""
        self.mux_ctrl_ref_mtr = Ad7771.MuxCtrlRefMtr(self, "mux_ctrl_ref_mtr", 21, 0x0)
        """ADC/Reference muc control"""
        self.mux_ctrl_global = Ad7771.MuxCtrlGlobal(self, "mux_ctrl_global", 22, 0x0)
        """ADC/Reference muc control"""
        self.gpio_cfg = Ad7771.GpioCfg(self, "gpio_cfg", 23, 0x0)
        """GPIO configuration register"""
        self.gpio_data = Ad7771.GpioData(self, "gpio_data", 24, 0x0)
        """GPIO configuration register"""
        self.buffer_cfg1 = Ad7771.BufferCfg1(self, "buffer_cfg1", 25, 0x18)
        """Buffer configuration 1"""
        self.buffer_cfg2 = Ad7771.BufferCfg2(self, "buffer_cfg2", 26, 0xc7)
        """Buffer configuration (reference)"""
        self.channel_offset_up: list[Ad7771.ChannelOffsetUp] = []
        """Channel  offset (upper byte)"""
        self.channel_offset_up.append(Ad7771.ChannelOffsetUp(self, "channel_offset_up0", 27, 0x0))
        self.channel_offset_up.append(Ad7771.ChannelOffsetUp(self, "channel_offset_up1", 28, 0x0))
        self.channel_offset_up.append(Ad7771.ChannelOffsetUp(self, "channel_offset_up2", 29, 0x0))
        self.channel_offset_up.append(Ad7771.ChannelOffsetUp(self, "channel_offset_up3", 30, 0x0))
        self.channel_offset_up.append(Ad7771.ChannelOffsetUp(self, "channel_offset_up4", 31, 0x0))
        self.channel_offset_up.append(Ad7771.ChannelOffsetUp(self, "channel_offset_up5", 32, 0x0))
        self.channel_offset_up.append(Ad7771.ChannelOffsetUp(self, "channel_offset_up6", 33, 0x0))
        self.channel_offset_up.append(Ad7771.ChannelOffsetUp(self, "channel_offset_up7", 34, 0x0))
        self.channel_offset_mid: list[Ad7771.ChannelOffsetMid] = []
        """Channel  offset (middle byte)"""
        self.channel_offset_mid.append(Ad7771.ChannelOffsetMid(self, "channel_offset_mid0", 35, 0x0))
        self.channel_offset_mid.append(Ad7771.ChannelOffsetMid(self, "channel_offset_mid1", 36, 0x0))
        self.channel_offset_mid.append(Ad7771.ChannelOffsetMid(self, "channel_offset_mid2", 37, 0x0))
        self.channel_offset_mid.append(Ad7771.ChannelOffsetMid(self, "channel_offset_mid3", 38, 0x0))
        self.channel_offset_mid.append(Ad7771.ChannelOffsetMid(self, "channel_offset_mid4", 39, 0x0))
        self.channel_offset_mid.append(Ad7771.ChannelOffsetMid(self, "channel_offset_mid5", 40, 0x0))
        self.channel_offset_mid.append(Ad7771.ChannelOffsetMid(self, "channel_offset_mid6", 41, 0x0))
        self.channel_offset_mid.append(Ad7771.ChannelOffsetMid(self, "channel_offset_mid7", 42, 0x0))
        self.channel_offset_low: list[Ad7771.ChannelOffsetLow] = []
        """Channel  offset (lower byte)"""
        self.channel_offset_low.append(Ad7771.ChannelOffsetLow(self, "channel_offset_low0", 43, 0x0))
        self.channel_offset_low.append(Ad7771.ChannelOffsetLow(self, "channel_offset_low1", 44, 0x0))
        self.channel_offset_low.append(Ad7771.ChannelOffsetLow(self, "channel_offset_low2", 45, 0x0))
        self.channel_offset_low.append(Ad7771.ChannelOffsetLow(self, "channel_offset_low3", 46, 0x0))
        self.channel_offset_low.append(Ad7771.ChannelOffsetLow(self, "channel_offset_low4", 47, 0x0))
        self.channel_offset_low.append(Ad7771.ChannelOffsetLow(self, "channel_offset_low5", 48, 0x0))
        self.channel_offset_low.append(Ad7771.ChannelOffsetLow(self, "channel_offset_low6", 49, 0x0))
        self.channel_offset_low.append(Ad7771.ChannelOffsetLow(self, "channel_offset_low7", 50, 0x0))
        self.channel_gain_up: list[Ad7771.ChannelGainUp] = []
        """Channel  gain (upper byte)"""
        self.channel_gain_up.append(Ad7771.ChannelGainUp(self, "channel_gain_up0", 51, 0x0))
        self.channel_gain_up.append(Ad7771.ChannelGainUp(self, "channel_gain_up1", 52, 0x0))
        self.channel_gain_up.append(Ad7771.ChannelGainUp(self, "channel_gain_up2", 53, 0x0))
        self.channel_gain_up.append(Ad7771.ChannelGainUp(self, "channel_gain_up3", 54, 0x0))
        self.channel_gain_up.append(Ad7771.ChannelGainUp(self, "channel_gain_up4", 55, 0x0))
        self.channel_gain_up.append(Ad7771.ChannelGainUp(self, "channel_gain_up5", 56, 0x0))
        self.channel_gain_up.append(Ad7771.ChannelGainUp(self, "channel_gain_up6", 57, 0x0))
        self.channel_gain_up.append(Ad7771.ChannelGainUp(self, "channel_gain_up7", 58, 0x0))
        self.channel_gain_mid: list[Ad7771.ChannelGainMid] = []
        """Channel  gain (middle byte)"""
        self.channel_gain_mid.append(Ad7771.ChannelGainMid(self, "channel_gain_mid0", 59, 0x0))
        self.channel_gain_mid.append(Ad7771.ChannelGainMid(self, "channel_gain_mid1", 60, 0x0))
        self.channel_gain_mid.append(Ad7771.ChannelGainMid(self, "channel_gain_mid2", 61, 0x0))
        self.channel_gain_mid.append(Ad7771.ChannelGainMid(self, "channel_gain_mid3", 62, 0x0))
        self.channel_gain_mid.append(Ad7771.ChannelGainMid(self, "channel_gain_mid4", 63, 0x0))
        self.channel_gain_mid.append(Ad7771.ChannelGainMid(self, "channel_gain_mid5", 64, 0x0))
        self.channel_gain_mid.append(Ad7771.ChannelGainMid(self, "channel_gain_mid6", 65, 0x0))
        self.channel_gain_mid.append(Ad7771.ChannelGainMid(self, "channel_gain_mid7", 66, 0x0))
        self.channel_gain_low: list[Ad7771.ChannelGainLow] = []
        """Channel  gain (lower byte)"""
        self.channel_gain_low.append(Ad7771.ChannelGainLow(self, "channel_gain_low0", 67, 0x0))
        self.channel_gain_low.append(Ad7771.ChannelGainLow(self, "channel_gain_low1", 68, 0x0))
        self.channel_gain_low.append(Ad7771.ChannelGainLow(self, "channel_gain_low2", 69, 0x0))
        self.channel_gain_low.append(Ad7771.ChannelGainLow(self, "channel_gain_low3", 70, 0x0))
        self.channel_gain_low.append(Ad7771.ChannelGainLow(self, "channel_gain_low4", 71, 0x0))
        self.channel_gain_low.append(Ad7771.ChannelGainLow(self, "channel_gain_low5", 72, 0x0))
        self.channel_gain_low.append(Ad7771.ChannelGainLow(self, "channel_gain_low6", 73, 0x0))
        self.channel_gain_low.append(Ad7771.ChannelGainLow(self, "channel_gain_low7", 74, 0x0))
        self.channel_status: list[Ad7771.ChannelStatus] = []
        """Channel  status"""
        self.channel_status.append(Ad7771.ChannelStatus(self, "channel_status0", 75, 0x0))
        self.channel_status.append(Ad7771.ChannelStatus(self, "channel_status1", 76, 0x0))
        self.channel_status.append(Ad7771.ChannelStatus(self, "channel_status2", 77, 0x0))
        self.channel_status.append(Ad7771.ChannelStatus(self, "channel_status3", 78, 0x0))
        self.channel_status.append(Ad7771.ChannelStatus(self, "channel_status4", 79, 0x0))
        self.channel_status.append(Ad7771.ChannelStatus(self, "channel_status5", 80, 0x0))
        self.channel_status.append(Ad7771.ChannelStatus(self, "channel_status6", 81, 0x0))
        self.channel_status.append(Ad7771.ChannelStatus(self, "channel_status7", 82, 0x0))
        self.channel_dsp_err: list[Ad7771.ChannelDspErr] = []
        """Channel (2*i)/(2*i+1) DSP errors"""
        self.channel_dsp_err.append(Ad7771.ChannelDspErr(self, "channel_dsp_err0", 83, 0x0))
        self.channel_dsp_err.append(Ad7771.ChannelDspErr(self, "channel_dsp_err1", 84, 0x0))
        self.channel_dsp_err.append(Ad7771.ChannelDspErr(self, "channel_dsp_err2", 85, 0x0))
        self.channel_dsp_err.append(Ad7771.ChannelDspErr(self, "channel_dsp_err3", 86, 0x0))
        self.channel_test_en = Ad7771.ChannelTestEn(self, "channel_test_en", 87, 0xfe)
        """Channel 0 to 7 test enable"""
        self.general_err1 = Ad7771.GeneralErr1(self, "general_err1", 88, 0x0)
        """General Error 1"""
        self.general_err1_en = Ad7771.GeneralErr1En(self, "general_err1_en", 89, 0x3e)
        """General Error 1 Enable"""
        self.general_err2 = Ad7771.GeneralErr2(self, "general_err2", 90, 0x0)
        """General Error 2"""
        self.general_err2_en = Ad7771.GeneralErr2En(self, "general_err2_en", 91, 0x2c)
        """General Error 2"""
        self.error_status1 = Ad7771.ErrorStatus1(self, "error_status1", 92, 0x0)
        """Error Status 1"""
        self.error_status2 = Ad7771.ErrorStatus2(self, "error_status2", 93, 0x0)
        """Error Status 2"""
        self.error_status3 = Ad7771.ErrorStatus3(self, "error_status3", 94, 0x0)
        """Error Status 3"""
        self.src_n_msb = Ad7771.SrcNMsb(self, "src_n_msb", 95, 0x0)
        """Sample Rate converter N MSB"""
        self.src_n_lsb = Ad7771.SrcNLsb(self, "src_n_lsb", 96, 0x0)
        """Sample Rate converter N LSB"""
        self.src_if_msb = Ad7771.SrcIfMsb(self, "src_if_msb", 97, 0x0)
        """Sample Rate converter IF MSB"""
        self.src_if_lsb = Ad7771.SrcIfLsb(self, "src_if_lsb", 98, 0x0)
        """Sample Rate converter IF LSB"""
        self.src_load = Ad7771.SrcLoad(self, "src_load", 99, 0x0)
        """Sample Rate converter load"""
