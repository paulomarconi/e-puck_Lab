#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Example.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Example.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS
SUB_IMAGE_ADDRESS_COMMAND=--image-address $(SUB_IMAGE_ADDRESS)
else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../epucklibs/motor_led/advance_one_timer/e_agenda.c ../epucklibs/motor_led/advance_one_timer/e_led.c ../epucklibs/motor_led/advance_one_timer/e_motors.c ../epucklibs/motor_led/advance_one_timer/e_remote_control.c ../epucklibs/a_d/advance_ad_scan/e_prox.c ../epucklibs/motor_led/e_init_port.c ../epucklibs/a_d/advance_ad_scan/e_ad_conv.c ../epucklibs/uart/e_init_uart1.s ../epucklibs/uart/e_init_uart2.s ../epucklibs/uart/e_uart1_rx_char.s ../epucklibs/uart/e_uart1_tx_char.s ../epucklibs/uart/e_uart2_rx_char.s ../epucklibs/uart/e_uart2_tx_char.s main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/105629/e_agenda.o ${OBJECTDIR}/_ext/105629/e_led.o ${OBJECTDIR}/_ext/105629/e_motors.o ${OBJECTDIR}/_ext/105629/e_remote_control.o ${OBJECTDIR}/_ext/1074974123/e_prox.o ${OBJECTDIR}/_ext/1971588547/e_init_port.o ${OBJECTDIR}/_ext/1074974123/e_ad_conv.o ${OBJECTDIR}/_ext/1586682380/e_init_uart1.o ${OBJECTDIR}/_ext/1586682380/e_init_uart2.o ${OBJECTDIR}/_ext/1586682380/e_uart1_rx_char.o ${OBJECTDIR}/_ext/1586682380/e_uart1_tx_char.o ${OBJECTDIR}/_ext/1586682380/e_uart2_rx_char.o ${OBJECTDIR}/_ext/1586682380/e_uart2_tx_char.o ${OBJECTDIR}/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/105629/e_agenda.o.d ${OBJECTDIR}/_ext/105629/e_led.o.d ${OBJECTDIR}/_ext/105629/e_motors.o.d ${OBJECTDIR}/_ext/105629/e_remote_control.o.d ${OBJECTDIR}/_ext/1074974123/e_prox.o.d ${OBJECTDIR}/_ext/1971588547/e_init_port.o.d ${OBJECTDIR}/_ext/1074974123/e_ad_conv.o.d ${OBJECTDIR}/_ext/1586682380/e_init_uart1.o.d ${OBJECTDIR}/_ext/1586682380/e_init_uart2.o.d ${OBJECTDIR}/_ext/1586682380/e_uart1_rx_char.o.d ${OBJECTDIR}/_ext/1586682380/e_uart1_tx_char.o.d ${OBJECTDIR}/_ext/1586682380/e_uart2_rx_char.o.d ${OBJECTDIR}/_ext/1586682380/e_uart2_tx_char.o.d ${OBJECTDIR}/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/105629/e_agenda.o ${OBJECTDIR}/_ext/105629/e_led.o ${OBJECTDIR}/_ext/105629/e_motors.o ${OBJECTDIR}/_ext/105629/e_remote_control.o ${OBJECTDIR}/_ext/1074974123/e_prox.o ${OBJECTDIR}/_ext/1971588547/e_init_port.o ${OBJECTDIR}/_ext/1074974123/e_ad_conv.o ${OBJECTDIR}/_ext/1586682380/e_init_uart1.o ${OBJECTDIR}/_ext/1586682380/e_init_uart2.o ${OBJECTDIR}/_ext/1586682380/e_uart1_rx_char.o ${OBJECTDIR}/_ext/1586682380/e_uart1_tx_char.o ${OBJECTDIR}/_ext/1586682380/e_uart2_rx_char.o ${OBJECTDIR}/_ext/1586682380/e_uart2_tx_char.o ${OBJECTDIR}/main.o

# Source Files
SOURCEFILES=../epucklibs/motor_led/advance_one_timer/e_agenda.c ../epucklibs/motor_led/advance_one_timer/e_led.c ../epucklibs/motor_led/advance_one_timer/e_motors.c ../epucklibs/motor_led/advance_one_timer/e_remote_control.c ../epucklibs/a_d/advance_ad_scan/e_prox.c ../epucklibs/motor_led/e_init_port.c ../epucklibs/a_d/advance_ad_scan/e_ad_conv.c ../epucklibs/uart/e_init_uart1.s ../epucklibs/uart/e_init_uart2.s ../epucklibs/uart/e_uart1_rx_char.s ../epucklibs/uart/e_uart1_tx_char.s ../epucklibs/uart/e_uart2_rx_char.s ../epucklibs/uart/e_uart2_tx_char.s main.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Example.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=30F6014A
MP_LINKER_FILE_OPTION=,--script=p30F6014A.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/105629/e_agenda.o: ../epucklibs/motor_led/advance_one_timer/e_agenda.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/105629" 
	@${RM} ${OBJECTDIR}/_ext/105629/e_agenda.o.d 
	@${RM} ${OBJECTDIR}/_ext/105629/e_agenda.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../epucklibs/motor_led/advance_one_timer/e_agenda.c  -o ${OBJECTDIR}/_ext/105629/e_agenda.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/105629/e_agenda.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../epucklibs" -I"../epucklibs/btcom" -I"../epucklibs/ircom" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/105629/e_agenda.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/105629/e_led.o: ../epucklibs/motor_led/advance_one_timer/e_led.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/105629" 
	@${RM} ${OBJECTDIR}/_ext/105629/e_led.o.d 
	@${RM} ${OBJECTDIR}/_ext/105629/e_led.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../epucklibs/motor_led/advance_one_timer/e_led.c  -o ${OBJECTDIR}/_ext/105629/e_led.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/105629/e_led.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../epucklibs" -I"../epucklibs/btcom" -I"../epucklibs/ircom" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/105629/e_led.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/105629/e_motors.o: ../epucklibs/motor_led/advance_one_timer/e_motors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/105629" 
	@${RM} ${OBJECTDIR}/_ext/105629/e_motors.o.d 
	@${RM} ${OBJECTDIR}/_ext/105629/e_motors.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../epucklibs/motor_led/advance_one_timer/e_motors.c  -o ${OBJECTDIR}/_ext/105629/e_motors.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/105629/e_motors.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../epucklibs" -I"../epucklibs/btcom" -I"../epucklibs/ircom" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/105629/e_motors.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/105629/e_remote_control.o: ../epucklibs/motor_led/advance_one_timer/e_remote_control.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/105629" 
	@${RM} ${OBJECTDIR}/_ext/105629/e_remote_control.o.d 
	@${RM} ${OBJECTDIR}/_ext/105629/e_remote_control.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../epucklibs/motor_led/advance_one_timer/e_remote_control.c  -o ${OBJECTDIR}/_ext/105629/e_remote_control.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/105629/e_remote_control.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../epucklibs" -I"../epucklibs/btcom" -I"../epucklibs/ircom" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/105629/e_remote_control.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1074974123/e_prox.o: ../epucklibs/a_d/advance_ad_scan/e_prox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1074974123" 
	@${RM} ${OBJECTDIR}/_ext/1074974123/e_prox.o.d 
	@${RM} ${OBJECTDIR}/_ext/1074974123/e_prox.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../epucklibs/a_d/advance_ad_scan/e_prox.c  -o ${OBJECTDIR}/_ext/1074974123/e_prox.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1074974123/e_prox.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../epucklibs" -I"../epucklibs/btcom" -I"../epucklibs/ircom" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1074974123/e_prox.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1971588547/e_init_port.o: ../epucklibs/motor_led/e_init_port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1971588547" 
	@${RM} ${OBJECTDIR}/_ext/1971588547/e_init_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/1971588547/e_init_port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../epucklibs/motor_led/e_init_port.c  -o ${OBJECTDIR}/_ext/1971588547/e_init_port.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1971588547/e_init_port.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../epucklibs" -I"../epucklibs/btcom" -I"../epucklibs/ircom" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1971588547/e_init_port.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1074974123/e_ad_conv.o: ../epucklibs/a_d/advance_ad_scan/e_ad_conv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1074974123" 
	@${RM} ${OBJECTDIR}/_ext/1074974123/e_ad_conv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1074974123/e_ad_conv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../epucklibs/a_d/advance_ad_scan/e_ad_conv.c  -o ${OBJECTDIR}/_ext/1074974123/e_ad_conv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1074974123/e_ad_conv.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../epucklibs" -I"../epucklibs/btcom" -I"../epucklibs/ircom" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1074974123/e_ad_conv.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../epucklibs" -I"../epucklibs/btcom" -I"../epucklibs/ircom" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/105629/e_agenda.o: ../epucklibs/motor_led/advance_one_timer/e_agenda.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/105629" 
	@${RM} ${OBJECTDIR}/_ext/105629/e_agenda.o.d 
	@${RM} ${OBJECTDIR}/_ext/105629/e_agenda.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../epucklibs/motor_led/advance_one_timer/e_agenda.c  -o ${OBJECTDIR}/_ext/105629/e_agenda.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/105629/e_agenda.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../epucklibs" -I"../epucklibs/btcom" -I"../epucklibs/ircom" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/105629/e_agenda.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/105629/e_led.o: ../epucklibs/motor_led/advance_one_timer/e_led.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/105629" 
	@${RM} ${OBJECTDIR}/_ext/105629/e_led.o.d 
	@${RM} ${OBJECTDIR}/_ext/105629/e_led.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../epucklibs/motor_led/advance_one_timer/e_led.c  -o ${OBJECTDIR}/_ext/105629/e_led.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/105629/e_led.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../epucklibs" -I"../epucklibs/btcom" -I"../epucklibs/ircom" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/105629/e_led.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/105629/e_motors.o: ../epucklibs/motor_led/advance_one_timer/e_motors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/105629" 
	@${RM} ${OBJECTDIR}/_ext/105629/e_motors.o.d 
	@${RM} ${OBJECTDIR}/_ext/105629/e_motors.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../epucklibs/motor_led/advance_one_timer/e_motors.c  -o ${OBJECTDIR}/_ext/105629/e_motors.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/105629/e_motors.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../epucklibs" -I"../epucklibs/btcom" -I"../epucklibs/ircom" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/105629/e_motors.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/105629/e_remote_control.o: ../epucklibs/motor_led/advance_one_timer/e_remote_control.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/105629" 
	@${RM} ${OBJECTDIR}/_ext/105629/e_remote_control.o.d 
	@${RM} ${OBJECTDIR}/_ext/105629/e_remote_control.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../epucklibs/motor_led/advance_one_timer/e_remote_control.c  -o ${OBJECTDIR}/_ext/105629/e_remote_control.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/105629/e_remote_control.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../epucklibs" -I"../epucklibs/btcom" -I"../epucklibs/ircom" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/105629/e_remote_control.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1074974123/e_prox.o: ../epucklibs/a_d/advance_ad_scan/e_prox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1074974123" 
	@${RM} ${OBJECTDIR}/_ext/1074974123/e_prox.o.d 
	@${RM} ${OBJECTDIR}/_ext/1074974123/e_prox.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../epucklibs/a_d/advance_ad_scan/e_prox.c  -o ${OBJECTDIR}/_ext/1074974123/e_prox.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1074974123/e_prox.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../epucklibs" -I"../epucklibs/btcom" -I"../epucklibs/ircom" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1074974123/e_prox.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1971588547/e_init_port.o: ../epucklibs/motor_led/e_init_port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1971588547" 
	@${RM} ${OBJECTDIR}/_ext/1971588547/e_init_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/1971588547/e_init_port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../epucklibs/motor_led/e_init_port.c  -o ${OBJECTDIR}/_ext/1971588547/e_init_port.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1971588547/e_init_port.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../epucklibs" -I"../epucklibs/btcom" -I"../epucklibs/ircom" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1971588547/e_init_port.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1074974123/e_ad_conv.o: ../epucklibs/a_d/advance_ad_scan/e_ad_conv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1074974123" 
	@${RM} ${OBJECTDIR}/_ext/1074974123/e_ad_conv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1074974123/e_ad_conv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../epucklibs/a_d/advance_ad_scan/e_ad_conv.c  -o ${OBJECTDIR}/_ext/1074974123/e_ad_conv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1074974123/e_ad_conv.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../epucklibs" -I"../epucklibs/btcom" -I"../epucklibs/ircom" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1074974123/e_ad_conv.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../epucklibs" -I"../epucklibs/btcom" -I"../epucklibs/ircom" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1586682380/e_init_uart1.o: ../epucklibs/uart/e_init_uart1.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1586682380" 
	@${RM} ${OBJECTDIR}/_ext/1586682380/e_init_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1586682380/e_init_uart1.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../epucklibs/uart/e_init_uart1.s  -o ${OBJECTDIR}/_ext/1586682380/e_init_uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -Wa,-MD,"${OBJECTDIR}/_ext/1586682380/e_init_uart1.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1586682380/e_init_uart1.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1586682380/e_init_uart2.o: ../epucklibs/uart/e_init_uart2.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1586682380" 
	@${RM} ${OBJECTDIR}/_ext/1586682380/e_init_uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1586682380/e_init_uart2.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../epucklibs/uart/e_init_uart2.s  -o ${OBJECTDIR}/_ext/1586682380/e_init_uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -Wa,-MD,"${OBJECTDIR}/_ext/1586682380/e_init_uart2.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1586682380/e_init_uart2.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1586682380/e_uart1_rx_char.o: ../epucklibs/uart/e_uart1_rx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1586682380" 
	@${RM} ${OBJECTDIR}/_ext/1586682380/e_uart1_rx_char.o.d 
	@${RM} ${OBJECTDIR}/_ext/1586682380/e_uart1_rx_char.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../epucklibs/uart/e_uart1_rx_char.s  -o ${OBJECTDIR}/_ext/1586682380/e_uart1_rx_char.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -Wa,-MD,"${OBJECTDIR}/_ext/1586682380/e_uart1_rx_char.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1586682380/e_uart1_rx_char.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1586682380/e_uart1_tx_char.o: ../epucklibs/uart/e_uart1_tx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1586682380" 
	@${RM} ${OBJECTDIR}/_ext/1586682380/e_uart1_tx_char.o.d 
	@${RM} ${OBJECTDIR}/_ext/1586682380/e_uart1_tx_char.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../epucklibs/uart/e_uart1_tx_char.s  -o ${OBJECTDIR}/_ext/1586682380/e_uart1_tx_char.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -Wa,-MD,"${OBJECTDIR}/_ext/1586682380/e_uart1_tx_char.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1586682380/e_uart1_tx_char.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1586682380/e_uart2_rx_char.o: ../epucklibs/uart/e_uart2_rx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1586682380" 
	@${RM} ${OBJECTDIR}/_ext/1586682380/e_uart2_rx_char.o.d 
	@${RM} ${OBJECTDIR}/_ext/1586682380/e_uart2_rx_char.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../epucklibs/uart/e_uart2_rx_char.s  -o ${OBJECTDIR}/_ext/1586682380/e_uart2_rx_char.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -Wa,-MD,"${OBJECTDIR}/_ext/1586682380/e_uart2_rx_char.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1586682380/e_uart2_rx_char.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1586682380/e_uart2_tx_char.o: ../epucklibs/uart/e_uart2_tx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1586682380" 
	@${RM} ${OBJECTDIR}/_ext/1586682380/e_uart2_tx_char.o.d 
	@${RM} ${OBJECTDIR}/_ext/1586682380/e_uart2_tx_char.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../epucklibs/uart/e_uart2_tx_char.s  -o ${OBJECTDIR}/_ext/1586682380/e_uart2_tx_char.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -Wa,-MD,"${OBJECTDIR}/_ext/1586682380/e_uart2_tx_char.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1586682380/e_uart2_tx_char.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/1586682380/e_init_uart1.o: ../epucklibs/uart/e_init_uart1.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1586682380" 
	@${RM} ${OBJECTDIR}/_ext/1586682380/e_init_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1586682380/e_init_uart1.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../epucklibs/uart/e_init_uart1.s  -o ${OBJECTDIR}/_ext/1586682380/e_init_uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -Wa,-MD,"${OBJECTDIR}/_ext/1586682380/e_init_uart1.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1586682380/e_init_uart1.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1586682380/e_init_uart2.o: ../epucklibs/uart/e_init_uart2.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1586682380" 
	@${RM} ${OBJECTDIR}/_ext/1586682380/e_init_uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1586682380/e_init_uart2.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../epucklibs/uart/e_init_uart2.s  -o ${OBJECTDIR}/_ext/1586682380/e_init_uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -Wa,-MD,"${OBJECTDIR}/_ext/1586682380/e_init_uart2.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1586682380/e_init_uart2.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1586682380/e_uart1_rx_char.o: ../epucklibs/uart/e_uart1_rx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1586682380" 
	@${RM} ${OBJECTDIR}/_ext/1586682380/e_uart1_rx_char.o.d 
	@${RM} ${OBJECTDIR}/_ext/1586682380/e_uart1_rx_char.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../epucklibs/uart/e_uart1_rx_char.s  -o ${OBJECTDIR}/_ext/1586682380/e_uart1_rx_char.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -Wa,-MD,"${OBJECTDIR}/_ext/1586682380/e_uart1_rx_char.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1586682380/e_uart1_rx_char.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1586682380/e_uart1_tx_char.o: ../epucklibs/uart/e_uart1_tx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1586682380" 
	@${RM} ${OBJECTDIR}/_ext/1586682380/e_uart1_tx_char.o.d 
	@${RM} ${OBJECTDIR}/_ext/1586682380/e_uart1_tx_char.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../epucklibs/uart/e_uart1_tx_char.s  -o ${OBJECTDIR}/_ext/1586682380/e_uart1_tx_char.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -Wa,-MD,"${OBJECTDIR}/_ext/1586682380/e_uart1_tx_char.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1586682380/e_uart1_tx_char.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1586682380/e_uart2_rx_char.o: ../epucklibs/uart/e_uart2_rx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1586682380" 
	@${RM} ${OBJECTDIR}/_ext/1586682380/e_uart2_rx_char.o.d 
	@${RM} ${OBJECTDIR}/_ext/1586682380/e_uart2_rx_char.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../epucklibs/uart/e_uart2_rx_char.s  -o ${OBJECTDIR}/_ext/1586682380/e_uart2_rx_char.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -Wa,-MD,"${OBJECTDIR}/_ext/1586682380/e_uart2_rx_char.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1586682380/e_uart2_rx_char.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1586682380/e_uart2_tx_char.o: ../epucklibs/uart/e_uart2_tx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1586682380" 
	@${RM} ${OBJECTDIR}/_ext/1586682380/e_uart2_tx_char.o.d 
	@${RM} ${OBJECTDIR}/_ext/1586682380/e_uart2_tx_char.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../epucklibs/uart/e_uart2_tx_char.s  -o ${OBJECTDIR}/_ext/1586682380/e_uart2_tx_char.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -Wa,-MD,"${OBJECTDIR}/_ext/1586682380/e_uart2_tx_char.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1586682380/e_uart2_tx_char.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Example.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Example.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--heap=512,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Example.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Example.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--heap=512,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Example.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf  
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
