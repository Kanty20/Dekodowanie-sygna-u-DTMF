/*
 * Do not modify this file; it is automatically generated from the template
 * linkcmd.xdt in the ti.targets.elf package and will be overwritten.
 */

/*
 * put '"'s around paths because, without this, the linker
 * considers '-' as minus operator, not a file name character.
 */


-l"D:\253263_2\abc\Debug\configPkg\package\cfg\abc_pe66.oe66"
-l"C:\ti\processor_sdk_rtos_am57xx_08_01_00_09\pdk_am57xx_1_0_19\packages\ti\drv\i2c\lib\am572x\c66\release\ti.drv.i2c.ae66"
-l"C:\ti\processor_sdk_rtos_am57xx_08_01_00_09\pdk_am57xx_1_0_19\packages\ti\osal\lib\tirtos\c66\release\ti.osal.ae66"
-l"D:\253263_2\abc\src\sysbios\sysbios.ae66"
-l"C:\ti\processor_sdk_rtos_am57xx_08_01_00_09\pdk_am57xx_1_0_19\packages\ti\csl\lib\am572x\c66\release\ti.csl.ae66"
-l"C:\ti\processor_sdk_rtos_am57xx_08_01_00_09\bios_6_76_03_01\packages\ti\targets\rts6000\lib\ti.targets.rts6000.ae66"
-l"C:\ti\processor_sdk_rtos_am57xx_08_01_00_09\bios_6_76_03_01\packages\ti\targets\rts6000\lib\boot.ae66"

--retain="*(xdc.meta)"


--args 0x0
-heap  0x0
-stack 0x1000

// *
MEMORY
{
    L2SRAM (RWX) : org = 0x800000, len = 0x48000
    OCMC_RAM1 (RWX) : org = 0x40300000, len = 0x80000
    OCMC_RAM2 (RWX) : org = 0x40400000, len = 0x100000
    OCMC_RAM3 (RWX) : org = 0x40500000, len = 0x100000
    EXT_RAM : org = 0x80000000, len = 0x40000000
}
// *

/*
 * Linker command file contributions from all loaded packages:
 */

/* Content from xdc.services.global (null): */

/* Content from xdc (null): */

/* Content from xdc.corevers (null): */

/* Content from xdc.rov (null): */

/* Content from xdc.runtime (null): */

/* Content from xdc.rov.runtime (null): */

/* Content from xdc.shelf (null): */

/* Content from xdc.services.spec (null): */

/* Content from xdc.services.intern.xsr (null): */

/* Content from xdc.services.intern.gen (null): */

/* Content from xdc.services.intern.cmd (null): */

/* Content from xdc.bld (null): */

/* Content from ti.targets (null): */

/* Content from ti.targets.elf (null): */

/* Content from ti.targets.rts6000 (null): */

/* Content from ti.sysbios.interfaces (null): */

/* Content from ti.sysbios.family (null): */

/* Content from xdc.services.getset (null): */

/* Content from ti.csl (null): */

/* Content from ti.sysbios.family.c62 (null): */

/* Content from xdc.runtime.knl (null): */

/* Content from ti.catalog.c6000 (null): */

/* Content from ti.catalog (null): */

/* Content from ti.catalog.peripherals.hdvicp2 (null): */

/* Content from xdc.platform (null): */

/* Content from xdc.cfg (null): */

/* Content from ti.catalog.arm.cortexm4 (null): */

/* Content from ti.catalog.arm.cortexa15 (null): */

/* Content from ti.platforms.evmAM572X (null): */

/* Content from ti.sysbios.hal (null): */

/* Content from ti.sysbios (null): */

/* Content from ti.sysbios.rts (null): */

/* Content from ti.sysbios.rts.ti (ti/sysbios/rts/ti/linkcmd.xdt): */

/* Content from ti.sysbios.knl (null): */

/* Content from ti.sysbios.timers.dmtimer (null): */

/* Content from ti.osal (null): */

/* Content from ti.drv.i2c (null): */

/* Content from ti.sysbios.family.c66 (ti/sysbios/family/c66/linkcmd.xdt): */
ti_sysbios_family_c66_Cache_l1dSize = 32768;
ti_sysbios_family_c66_Cache_l1pSize = 32768;
ti_sysbios_family_c66_Cache_l2Size = 0;

/* Content from ti.sysbios.family.c64p (ti/sysbios/family/c64p/linkcmd.xdt): */

/* Content from ti.sysbios.gates (null): */

/* Content from ti.sysbios.xdcruntime (null): */

/* Content from ti.sysbios.heaps (null): */

/* Content from ti.sysbios.family.shared.vayu (null): */

/* Content from ti.sysbios.utils (null): */

/* Content from configPkg (null): */

/* Content from xdc.services.io (null): */


/*
 * symbolic aliases for static instance objects
 */
xdc_runtime_Startup__EXECFXN__C = 1;
xdc_runtime_Startup__RESETFXN__C = 1;
xdc_rov_runtime_Mon__checksum = 1;
xdc_rov_runtime_Mon__write = 1;

SECTIONS
{
    .text: load >> EXT_RAM
    .ti.decompress: load > EXT_RAM
    .stack: load > EXT_RAM
    GROUP: load > EXT_RAM
    {
        .bss:
        .neardata:
        .rodata:
    }
    .cinit: load > EXT_RAM
    .pinit: load >> EXT_RAM
    .init_array: load > EXT_RAM
    .const: load >> EXT_RAM
    .data: load >> EXT_RAM
    .fardata: load >> EXT_RAM
    .switch: load >> EXT_RAM
    .sysmem: load > EXT_RAM
    .far: load >> EXT_RAM
    .args: load > EXT_RAM align = 0x4, fill = 0 {_argsize = 0x0; }
    .cio: load >> EXT_RAM
    .ti.handler_table: load > EXT_RAM
    .c6xabi.exidx: load > EXT_RAM
    .c6xabi.extab: load >> EXT_RAM
    .vecs: load > EXT_RAM
    xdc.meta: load > EXT_RAM, type = COPY

}
