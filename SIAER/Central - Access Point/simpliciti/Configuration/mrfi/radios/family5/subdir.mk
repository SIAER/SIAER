################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../simpliciti/Configuration/mrfi/radios/family5/mrfi_radio.c \
../simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_interface.c 

OBJS += \
./simpliciti/Configuration/mrfi/radios/family5/mrfi_radio.obj \
./simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_interface.obj 

C_DEPS += \
./simpliciti/Configuration/mrfi/radios/family5/mrfi_radio.pp \
./simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_interface.pp 

OBJS__QTD += \
".\simpliciti\Configuration\mrfi\radios\family5\mrfi_radio.obj" \
".\simpliciti\Configuration\mrfi\radios\family5\mrfi_radio_interface.obj" 

C_DEPS__QTD += \
".\simpliciti\Configuration\mrfi\radios\family5\mrfi_radio.pp" \
".\simpliciti\Configuration\mrfi\radios\family5\mrfi_radio_interface.pp" 

C_SRCS_QUOTED += \
"../simpliciti/Configuration/mrfi/radios/family5/mrfi_radio.c" \
"../simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_interface.c" 


# Each subdirectory must supply rules for building sources it contributes
simpliciti/Configuration/mrfi/radios/family5/mrfi_radio.obj: ../simpliciti/Configuration/mrfi/radios/family5/mrfi_radio.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo -vmspx > "simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_ccsCompiler.opt")
	$(shell echo -g >> "simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_ccsCompiler.opt")
	$(shell echo -O2 >> "simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=MRFI_CC430 --define=__CC430F6137__ >> "simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_ccsCompiler.opt")
	$(shell echo --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Applications/application/Access Point" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/nwk" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/nwk_applications" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/mrfi" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/mrfi/smartrf" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/mrfi/smartrf/CC430" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/mrfi/radios/family5" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/mrfi/radios" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/bsp" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/bsp/mcus" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/bsp/drivers/code" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/bsp/drivers" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/bsp/boards/CC430EM" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/bsp/boards" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/bsp" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" >> "simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_ccsCompiler.opt")
	$(shell echo --preproc_dependency="simpliciti/Configuration/mrfi/radios/family5/mrfi_radio.pp" >> "simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_ccsCompiler.opt")
	$(shell echo --obj_directory="simpliciti/Configuration/mrfi/radios/family5" >> "simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_interface.obj: ../simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_interface.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo -vmspx > "simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_interface_ccsCompiler.opt")
	$(shell echo -g >> "simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_interface_ccsCompiler.opt")
	$(shell echo -O2 >> "simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_interface_ccsCompiler.opt")
	$(shell echo --define=__CCE__ --define=MRFI_CC430 --define=__CC430F6137__ >> "simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_interface_ccsCompiler.opt")
	$(shell echo --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Applications/application/Access Point" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/nwk" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/nwk_applications" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/mrfi" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/mrfi/smartrf" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/mrfi/smartrf/CC430" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/mrfi/radios/family5" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/mrfi/radios" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/bsp" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/bsp/mcus" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/bsp/drivers/code" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/bsp/drivers" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/bsp/boards/CC430EM" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/bsp/boards" --include_path="C:/Users/Patrick/Downloads/_PROJETO FINAL/Software/SIAER/project/SIAER/simpliciti/Configuration/bsp" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" >> "simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_interface_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_interface_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_interface_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_interface_ccsCompiler.opt")
	$(shell echo --preproc_dependency="simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_interface.pp" >> "simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_interface_ccsCompiler.opt")
	$(shell echo --obj_directory="simpliciti/Configuration/mrfi/radios/family5" >> "simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_interface_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_interface_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_interface_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"simpliciti/Configuration/mrfi/radios/family5/mrfi_radio_interface_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '


