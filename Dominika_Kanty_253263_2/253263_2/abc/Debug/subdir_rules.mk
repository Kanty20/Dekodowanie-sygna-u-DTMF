################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
%.obj: ../%.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/ccs12/ccs/tools/compiler/ti-cgt-c6000_8.3.12/bin/cl6x" -mv6600 --include_path="D:/253263_2/abc" --include_path="C:/ti/ccs12/ccs/tools/compiler/ti-cgt-c6000_8.3.12/include" --define=SOC_AM572x --define=am5728 --define=core1 -g --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="$(basename $(<F)).d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

build-2089148751:
	@$(MAKE) --no-print-directory -Onone -f subdir_rules.mk build-2089148751-inproc

build-2089148751-inproc: ../abc.cfg
	@echo 'Building file: "$<"'
	@echo 'Invoking: XDCtools'
	"C:/ti/processor_sdk_rtos_am57xx_08_01_00_09/xdctools_3_55_02_22_core/xs" --xdcpath="C:/ti/processor_sdk_rtos_am57xx_08_01_00_09/openmp_dsp_am57xx_2_06_03_00/packages;C:/ti/processor_sdk_rtos_am57xx_08_01_00_09/pdk_am57xx_1_0_19/packages;C:/ti/processor_sdk_rtos_am57xx_08_01_00_09/ctoolslib_2_2_0_0/packages;C:/ti/processor_sdk_rtos_am57xx_08_01_00_09/edma3_lld_2_12_05_30E/packages;C:/ti/processor_sdk_rtos_am57xx_08_01_00_09/framework_components_3_40_02_07/packages;C:/ti/processor_sdk_rtos_am57xx_08_01_00_09/framework_components_3_40_02_07/examples;C:/ti/processor_sdk_rtos_am57xx_08_01_00_09/imglib_c66x_3_1_1_0/packages;C:/ti/processor_sdk_rtos_am57xx_08_01_00_09/ipc_3_50_04_08/packages;C:/ti/processor_sdk_rtos_am57xx_08_01_00_09/ndk_3_61_01_01/packages;C:/ti/processor_sdk_rtos_am57xx_08_01_00_09/bios_6_76_03_01/packages;C:/ti/processor_sdk_rtos_am57xx_08_01_00_09/uia_2_30_01_02/packages;C:/ti/processor_sdk_rtos_am57xx_08_01_00_09/xdais_7_24_00_04/packages;C:/ti/processor_sdk_rtos_am57xx_08_01_00_09/xdais_7_24_00_04/examples;" xdc.tools.configuro -o configPkg -t ti.targets.elf.C66 -p ti.platforms.evmAM572X -r release -c "C:/ti/ccs12/ccs/tools/compiler/ti-cgt-c6000_8.3.12" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

configPkg/linker.cmd: build-2089148751 ../abc.cfg
configPkg/compiler.opt: build-2089148751
configPkg/: build-2089148751


