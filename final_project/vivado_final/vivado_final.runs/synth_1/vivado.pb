
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental Z:/schoolfiles/school_files/cpe333/final_project/vivado_final/vivado_final.srcs/utils_1/imports/synth_1/OTTER_MCU.dcp2default:defaultZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2�
uZ:/schoolfiles/school_files/cpe333/final_project/vivado_final/vivado_final.srcs/utils_1/imports/synth_1/OTTER_MCU.dcp2default:defaultZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
v
Command: %s
53*	vivadotcl2E
1synth_design -top OTTER_MCU -part xc7k70tfbv676-12default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7k70t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7k70t2default:defaultZ17-349h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
`
#Helper process launched with PID %s4824*oasys2
350522default:defaultZ8-7075h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
REGCCE2default:default2
wire2default:default2[
EC:/Xilinx/Vivado/2022.2/data/verilog/src/unimacro/BRAM_SINGLE_MACRO.v2default:default2
21702default:default8@Z8-11241h px� 
�
6overflow of 32-bit signed integer %s; using %s instead7318*oasys2

21474836482default:default2
-21474836482default:default2j
TZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/alu.sv2default:default2
832default:default8@Z8-11057h px� 
�
6overflow of 32-bit signed integer %s; using %s instead7318*oasys2

21474836482default:default2
-21474836482default:default2j
TZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/alu.sv2default:default2
842default:default8@Z8-11057h px� 
�
%s*synth2�
sStarting Synthesize : Time (s): cpu = 00:00:03 ; elapsed = 00:00:03 . Memory (MB): peak = 826.703 ; gain = 409.734
2default:defaulth px� 
�
synthesizing module '%s'%s4497*oasys2
	OTTER_MCU2default:default2
 2default:default2y
cZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/otter_mcu_pipeline.sv2default:default2
232default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2

mux_2t1_nb2default:default2
 2default:default2q
[Z:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/mux_2t1_nb.sv2default:default2
312default:default8@Z8-6157h px� 
W
%s
*synth2?
+	Parameter n bound to: 32 - type: integer 
2default:defaulth p
x
� 
�
default block is never used226*oasys2q
[Z:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/mux_2t1_nb.sv2default:default2
392default:default8@Z8-226h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

mux_2t1_nb2default:default2
 2default:default2
02default:default2
12default:default2q
[Z:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/mux_2t1_nb.sv2default:default2
312default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
reg_nb2default:default2
 2default:default2r
\Z:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/register_nb.sv2default:default2
242default:default8@Z8-6157h px� 
W
%s
*synth2?
+	Parameter n bound to: 32 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
reg_nb2default:default2
 2default:default2
02default:default2
12default:default2r
\Z:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/register_nb.sv2default:default2
242default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
Memory2default:default2
 2default:default2s
]Z:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/otter_memory.sv2default:default2
472default:default8@Z8-6157h px� 
�
,$readmem data file '%s' is read successfully3426*oasys2$
otter_memory.mem2default:default2s
]Z:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/otter_memory.sv2default:default2
722default:default8@Z8-3876h px� 
�
-case statement is not full and has no default155*oasys2s
]Z:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/otter_memory.sv2default:default2
942default:default8@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Memory2default:default2
 2default:default2
02default:default2
12default:default2s
]Z:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/otter_memory.sv2default:default2
472default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2-
Pipeline_reg_fetch_decode2default:default2
 2default:default2�
jZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/pipeline_reg_fetch_decode.sv2default:default2
232default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2-
Pipeline_reg_fetch_decode2default:default2
 2default:default2
02default:default2
12default:default2�
jZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/pipeline_reg_fetch_decode.sv2default:default2
232default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
Decoder2default:default2
 2default:default2n
XZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/Decoder.sv2default:default2
222default:default8@Z8-6157h px� 
�
default block is never used226*oasys2n
XZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/Decoder.sv2default:default2
1262default:default8@Z8-226h px� 
�
default block is never used226*oasys2n
XZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/Decoder.sv2default:default2
1452default:default8@Z8-226h px� 
�
-case statement is not full and has no default155*oasys2n
XZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/Decoder.sv2default:default2
742default:default8@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Decoder2default:default2
 2default:default2
02default:default2
12default:default2n
XZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/Decoder.sv2default:default2
222default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
RegFile2default:default2
 2default:default2o
YZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/reg_file.sv2default:default2
372default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
RegFile2default:default2
 2default:default2
02default:default2
12default:default2o
YZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/reg_file.sv2default:default2
372default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
	immed_gen2default:default2
 2default:default2p
ZZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/immed_gen.sv2default:default2
272default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	immed_gen2default:default2
 2default:default2
02default:default2
12default:default2p
ZZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/immed_gen.sv2default:default2
272default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2/
Pipeline_reg_decode_execute2default:default2
 2default:default2�
lZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/Pipeline_reg_decode_execute.sv2default:default2
232default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2/
Pipeline_reg_decode_execute2default:default2
 2default:default2
02default:default2
12default:default2�
lZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/Pipeline_reg_decode_execute.sv2default:default2
232default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2#
branch_cond_gen2default:default2
 2default:default2v
`Z:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/Branch_cond_gen.sv2default:default2
282default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2#
branch_cond_gen2default:default2
 2default:default2
02default:default2
12default:default2v
`Z:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/Branch_cond_gen.sv2default:default2
282default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2

mux_4t1_nb2default:default2
 2default:default2q
[Z:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/mux_4t1_nb.sv2default:default2
242default:default8@Z8-6157h px� 
W
%s
*synth2?
+	Parameter n bound to: 32 - type: integer 
2default:defaulth p
x
� 
�
default block is never used226*oasys2q
[Z:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/mux_4t1_nb.sv2default:default2
352default:default8@Z8-226h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

mux_4t1_nb2default:default2
 2default:default2
02default:default2
12default:default2q
[Z:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/mux_4t1_nb.sv2default:default2
242default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
ALU2default:default2
 2default:default2j
TZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/alu.sv2default:default2
222default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ALU2default:default2
 2default:default2
02default:default2
12default:default2j
TZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/alu.sv2default:default2
222default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2/
Pipeline_reg_execute_memory2default:default2
 2default:default2�
lZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/Pipeline_reg_execute_memory.sv2default:default2
252default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2/
Pipeline_reg_execute_memory2default:default2
 2default:default2
02default:default2
12default:default2�
lZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/Pipeline_reg_execute_memory.sv2default:default2
252default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys21
Pipeline_reg_memory_writeback2default:default2
 2default:default2�
nZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/Pipeline_reg_memory_writeback.sv2default:default2
222default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys21
Pipeline_reg_memory_writeback2default:default2
 2default:default2
02default:default2
12default:default2�
nZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/Pipeline_reg_memory_writeback.sv2default:default2
222default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
Hazard_Unit2default:default2
 2default:default2m
WZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/hazard.sv2default:default2
32default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Hazard_Unit2default:default2
 2default:default2
02default:default2
12default:default2m
WZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/hazard.sv2default:default2
32default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	OTTER_MCU2default:default2
 2default:default2
02default:default2
12default:default2y
cZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/otter_mcu_pipeline.sv2default:default2
232default:default8@Z8-6155h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
INTR2default:default2
	OTTER_MCU2default:defaultZ8-7129h px� 
�
%s*synth2�
sFinished Synthesize : Time (s): cpu = 00:00:04 ; elapsed = 00:00:05 . Memory (MB): peak = 933.602 ; gain = 516.633
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
~Finished Constraint Validation : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 933.602 ; gain = 516.633
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Loading part: xc7k70tfbv676-1
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 933.602 ; gain = 516.633
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
Loading part %s157*device2#
xc7k70tfbv676-12default:defaultZ21-403h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default2(
"Memory:/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default2(
"Memory:/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default2(
"Memory:/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default2(
"Memory:/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default2(
"Memory:/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default2(
"Memory:/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default2(
"Memory:/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default2(
"Memory:/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default2(
"Memory:/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default2(
"Memory:/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default2(
"Memory:/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default2(
"Memory:/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default2(
"Memory:/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default2(
"Memory:/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default2(
"Memory:/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default2(
"Memory:/memory_reg"2default:defaultZ8-7030h px� 
�
!inferring latch for variable '%s'327*oasys2

result_reg2default:default2j
TZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/alu.sv2default:default2
562default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2 
result64_reg2default:default2j
TZ:/schoolfiles/school_files/cpe333/final_project/OtterPipelineFiles/otter_mcu/alu.sv2default:default2
672default:default8@Z8-327h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 933.602 ; gain = 516.633
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   64 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   32 Bit       Adders := 7     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input   32 Bit       Adders := 1     
2default:defaulth p
x
� 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     32 Bit         XORs := 1     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               32 Bit    Registers := 19    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                5 Bit    Registers := 3     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                2 Bit    Registers := 3     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                1 Bit    Registers := 11    
2default:defaulth p
x
� 
?
%s
*synth2'
+---Multipliers : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	              32x32  Multipliers := 1     
2default:defaulth p
x
� 
8
%s
*synth2 
+---RAMs : 
2default:defaulth p
x
� 
l
%s
*synth2T
@	             512K Bit	(16384 X 32 bit)          RAMs := 1     
2default:defaulth p
x
� 
i
%s
*synth2Q
=	             1024 Bit	(32 X 32 bit)          RAMs := 1     
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	  20 Input   64 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   32 Bit        Muxes := 8     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   9 Input   32 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  16 Input   32 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input   32 Bit        Muxes := 3     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    5 Bit        Muxes := 3     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    5 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  10 Input    5 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   8 Input    4 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    4 Bit        Muxes := 5     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  10 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  10 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    2 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   9 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  10 Input    1 Bit        Muxes := 7     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   6 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  25 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  20 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2k
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
j
%s
*synth2R
>DSP Report: Generating DSP result640, operation Mode is: A*B.
2default:defaulth p
x
� 
k
%s
*synth2S
?DSP Report: operator result640 is absorbed into DSP result640.
2default:defaulth p
x
� 
k
%s
*synth2S
?DSP Report: operator result640 is absorbed into DSP result640.
2default:defaulth p
x
� 
u
%s
*synth2]
IDSP Report: Generating DSP result640, operation Mode is: (PCIN>>17)+A*B.
2default:defaulth p
x
� 
k
%s
*synth2S
?DSP Report: operator result640 is absorbed into DSP result640.
2default:defaulth p
x
� 
k
%s
*synth2S
?DSP Report: operator result640 is absorbed into DSP result640.
2default:defaulth p
x
� 
j
%s
*synth2R
>DSP Report: Generating DSP result640, operation Mode is: A*B.
2default:defaulth p
x
� 
k
%s
*synth2S
?DSP Report: operator result640 is absorbed into DSP result640.
2default:defaulth p
x
� 
k
%s
*synth2S
?DSP Report: operator result640 is absorbed into DSP result640.
2default:defaulth p
x
� 
u
%s
*synth2]
IDSP Report: Generating DSP result640, operation Mode is: (PCIN>>17)+A*B.
2default:defaulth p
x
� 
k
%s
*synth2S
?DSP Report: operator result640 is absorbed into DSP result640.
2default:defaulth p
x
� 
k
%s
*synth2S
?DSP Report: operator result640 is absorbed into DSP result640.
2default:defaulth p
x
� 
j
%s
*synth2R
>DSP Report: Generating DSP result641, operation Mode is: A*B.
2default:defaulth p
x
� 
k
%s
*synth2S
?DSP Report: operator result641 is absorbed into DSP result641.
2default:defaulth p
x
� 
k
%s
*synth2S
?DSP Report: operator result641 is absorbed into DSP result641.
2default:defaulth p
x
� 
u
%s
*synth2]
IDSP Report: Generating DSP result641, operation Mode is: (PCIN>>17)+A*B.
2default:defaulth p
x
� 
k
%s
*synth2S
?DSP Report: operator result641 is absorbed into DSP result641.
2default:defaulth p
x
� 
k
%s
*synth2S
?DSP Report: operator result641 is absorbed into DSP result641.
2default:defaulth p
x
� 
j
%s
*synth2R
>DSP Report: Generating DSP result641, operation Mode is: A*B.
2default:defaulth p
x
� 
k
%s
*synth2S
?DSP Report: operator result641 is absorbed into DSP result641.
2default:defaulth p
x
� 
k
%s
*synth2S
?DSP Report: operator result641 is absorbed into DSP result641.
2default:defaulth p
x
� 
u
%s
*synth2]
IDSP Report: Generating DSP result641, operation Mode is: (PCIN>>17)+A*B.
2default:defaulth p
x
� 
k
%s
*synth2S
?DSP Report: operator result641 is absorbed into DSP result641.
2default:defaulth p
x
� 
k
%s
*synth2S
?DSP Report: operator result641 is absorbed into DSP result641.
2default:defaulth p
x
� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
INTR2default:default2
	OTTER_MCU2default:defaultZ8-7129h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default27
#"OTTER_MCU/OTTER_MEMORY/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default27
#"OTTER_MCU/OTTER_MEMORY/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default27
#"OTTER_MCU/OTTER_MEMORY/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default27
#"OTTER_MCU/OTTER_MEMORY/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default27
#"OTTER_MCU/OTTER_MEMORY/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default27
#"OTTER_MCU/OTTER_MEMORY/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default27
#"OTTER_MCU/OTTER_MEMORY/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default27
#"OTTER_MCU/OTTER_MEMORY/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default27
#"OTTER_MCU/OTTER_MEMORY/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default27
#"OTTER_MCU/OTTER_MEMORY/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default27
#"OTTER_MCU/OTTER_MEMORY/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default27
#"OTTER_MCU/OTTER_MEMORY/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default27
#"OTTER_MCU/OTTER_MEMORY/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default27
#"OTTER_MCU/OTTER_MEMORY/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default27
#"OTTER_MCU/OTTER_MEMORY/memory_reg"2default:defaultZ8-7030h px� 
�
LImplemented Non-Cascaded %s Ram (cascade_height = %s) of width %s for RAM %s4766*oasys2
Block2default:default2
12default:default2
322default:default27
#"OTTER_MCU/OTTER_MEMORY/memory_reg"2default:defaultZ8-7030h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[63]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[62]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[61]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[60]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[59]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[58]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[57]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[56]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[55]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[54]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[53]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[52]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[51]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[50]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[49]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[48]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[47]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[46]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[45]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[44]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[43]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[42]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[41]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[40]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[39]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[38]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[37]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[36]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[35]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[34]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[33]2default:default2
ALU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2$
result64_reg[32]2default:default2
ALU2default:defaultZ8-3332h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:18 ; elapsed = 00:00:19 . Memory (MB): peak = 1220.059 ; gain = 803.090
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth px� 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px� 
d
%s*synth2L
8
Block RAM: Preliminary Mapping Report (see note below)
2default:defaulth px� 
�
%s*synth2�
�+------------+-------------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
2default:defaulth px� 
�
%s*synth2�
�|Module Name | RTL Object              | PORT A (Depth x Width) | W | R | PORT B (Depth x Width) | W | R | Ports driving FF | RAMB18 | RAMB36 | 
2default:defaulth px� 
�
%s*synth2�
�+------------+-------------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
2default:defaulth px� 
�
%s*synth2�
�|OTTER_MCU   | OTTER_MEMORY/memory_reg | 16 K x 32(READ_FIRST)  | W | R | 16 K x 32(WRITE_FIRST) |   | R | Port A and B     | 0      | 16     | 
2default:defaulth px� 
�
%s*synth2�
�+------------+-------------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+

2default:defaulth px� 
�
%s*synth2�
�Note: The table above is a preliminary report that shows the Block RAMs at the current stage of the synthesis flow. Some Block RAMs may be reimplemented as non Block RAM primitives later in the synthesis flow. Multiple instantiated Block RAMs are reported only once. 
2default:defaulth px� 
j
%s*synth2R
>
Distributed RAM: Preliminary Mapping Report (see note below)
2default:defaulth px� 
�
%s*synth2s
_+------------+-----------------------------+-----------+----------------------+--------------+
2default:defaulth px� 
�
%s*synth2t
`|Module Name | RTL Object                  | Inference | Size (Depth x Width) | Primitives   | 
2default:defaulth px� 
�
%s*synth2s
_+------------+-----------------------------+-----------+----------------------+--------------+
2default:defaulth px� 
�
%s*synth2t
`|OTTER_MCU   | OTTER_reg_file/reg_file_reg | Implied   | 32 x 32              | RAM32M x 12  | 
2default:defaulth px� 
�
%s*synth2t
`+------------+-----------------------------+-----------+----------------------+--------------+

2default:defaulth px� 
�
%s*synth2�
�Note: The table above is a preliminary report that shows the Distributed RAMs at the current stage of the synthesis flow. Some Distributed RAMs may be reimplemented as non Distributed RAM primitives later in the synthesis flow. Multiple instantiated RAMs are reported only once.
2default:defaulth px� 
�
%s*synth2p
\
DSP: Preliminary Mapping Report (see note below. The ' indicates corresponding REG is set)
2default:defaulth px� 
�
%s*synth2�
+------------+----------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
2default:defaulth px� 
�
%s*synth2�
�|Module Name | DSP Mapping    | A Size | B Size | C Size | D Size | P Size | AREG | BREG | CREG | DREG | ADREG | MREG | PREG | 
2default:defaulth px� 
�
%s*synth2�
+------------+----------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
2default:defaulth px� 
�
%s*synth2�
�|ALU         | A*B            | 18     | 15     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|ALU         | (PCIN>>17)+A*B | 15     | 15     | -      | -      | 30     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|ALU         | A*B            | 18     | 18     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|ALU         | (PCIN>>17)+A*B | 18     | 15     | -      | -      | 47     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|ALU         | A*B            | 18     | 16     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|ALU         | (PCIN>>17)+A*B | 16     | 16     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|ALU         | A*B            | 18     | 18     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|ALU         | (PCIN>>17)+A*B | 18     | 16     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�+------------+----------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+

2default:defaulth px� 
�
%s*synth2�
�Note: The table above is a preliminary report that shows the DSPs inferred at the current stage of the synthesis flow. Some DSP may be reimplemented as non DSP primitives later in the synthesis flow. Multiple instantiated DSPs are reported only once.
2default:defaulth px� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth px� 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
}Finished Timing Optimization : Time (s): cpu = 00:00:18 ; elapsed = 00:00:19 . Memory (MB): peak = 1220.059 ; gain = 803.090
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!
Block RAM: Final Mapping Report
2default:defaulth p
x
� 
�
%s
*synth2�
�+------------+-------------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
2default:defaulth p
x
� 
�
%s
*synth2�
�|Module Name | RTL Object              | PORT A (Depth x Width) | W | R | PORT B (Depth x Width) | W | R | Ports driving FF | RAMB18 | RAMB36 | 
2default:defaulth p
x
� 
�
%s
*synth2�
�+------------+-------------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
2default:defaulth p
x
� 
�
%s
*synth2�
�|OTTER_MCU   | OTTER_MEMORY/memory_reg | 16 K x 32(READ_FIRST)  | W | R | 16 K x 32(WRITE_FIRST) |   | R | Port A and B     | 0      | 16     | 
2default:defaulth p
x
� 
�
%s
*synth2�
�+------------+-------------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+

2default:defaulth p
x
� 
S
%s
*synth2;
'
Distributed RAM: Final Mapping Report
2default:defaulth p
x
� 
�
%s
*synth2s
_+------------+-----------------------------+-----------+----------------------+--------------+
2default:defaulth p
x
� 
�
%s
*synth2t
`|Module Name | RTL Object                  | Inference | Size (Depth x Width) | Primitives   | 
2default:defaulth p
x
� 
�
%s
*synth2s
_+------------+-----------------------------+-----------+----------------------+--------------+
2default:defaulth p
x
� 
�
%s
*synth2t
`|OTTER_MCU   | OTTER_reg_file/reg_file_reg | Implied   | 32 x 32              | RAM32M x 12  | 
2default:defaulth p
x
� 
�
%s
*synth2t
`+------------+-----------------------------+-----------+----------------------+--------------+

2default:defaulth p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
OTTER_ALU/result_reg[31]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
OTTER_ALU/result_reg[30]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
OTTER_ALU/result_reg[29]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
OTTER_ALU/result_reg[28]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
OTTER_ALU/result_reg[27]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
OTTER_ALU/result_reg[26]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
OTTER_ALU/result_reg[25]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
OTTER_ALU/result_reg[24]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
OTTER_ALU/result_reg[23]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
OTTER_ALU/result_reg[22]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
OTTER_ALU/result_reg[21]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
OTTER_ALU/result_reg[20]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
OTTER_ALU/result_reg[19]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
OTTER_ALU/result_reg[18]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
OTTER_ALU/result_reg[17]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
OTTER_ALU/result_reg[16]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
OTTER_ALU/result_reg[15]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
OTTER_ALU/result_reg[14]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
OTTER_ALU/result_reg[13]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
OTTER_ALU/result_reg[12]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
OTTER_ALU/result_reg[11]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
OTTER_ALU/result_reg[10]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2+
OTTER_ALU/result_reg[9]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2+
OTTER_ALU/result_reg[8]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2+
OTTER_ALU/result_reg[7]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2+
OTTER_ALU/result_reg[6]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2+
OTTER_ALU/result_reg[5]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2+
OTTER_ALU/result_reg[4]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2+
OTTER_ALU/result_reg[3]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2+
OTTER_ALU/result_reg[2]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2+
OTTER_ALU/result_reg[1]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2+
OTTER_ALU/result_reg[0]2default:default2
	OTTER_MCU2default:defaultZ8-3332h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys22
OTTER_MEMORY/memory_reg_bram_02default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys22
OTTER_MEMORY/memory_reg_bram_02default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys22
OTTER_MEMORY/memory_reg_bram_12default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys22
OTTER_MEMORY/memory_reg_bram_12default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys22
OTTER_MEMORY/memory_reg_bram_22default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys22
OTTER_MEMORY/memory_reg_bram_22default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys22
OTTER_MEMORY/memory_reg_bram_32default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys22
OTTER_MEMORY/memory_reg_bram_32default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys22
OTTER_MEMORY/memory_reg_bram_42default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys22
OTTER_MEMORY/memory_reg_bram_42default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys22
OTTER_MEMORY/memory_reg_bram_52default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys22
OTTER_MEMORY/memory_reg_bram_52default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys22
OTTER_MEMORY/memory_reg_bram_62default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys22
OTTER_MEMORY/memory_reg_bram_62default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys22
OTTER_MEMORY/memory_reg_bram_72default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys22
OTTER_MEMORY/memory_reg_bram_72default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys22
OTTER_MEMORY/memory_reg_bram_82default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys22
OTTER_MEMORY/memory_reg_bram_82default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys22
OTTER_MEMORY/memory_reg_bram_92default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys22
OTTER_MEMORY/memory_reg_bram_92default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys23
OTTER_MEMORY/memory_reg_bram_102default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys23
OTTER_MEMORY/memory_reg_bram_102default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys23
OTTER_MEMORY/memory_reg_bram_112default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys23
OTTER_MEMORY/memory_reg_bram_112default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys23
OTTER_MEMORY/memory_reg_bram_122default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys23
OTTER_MEMORY/memory_reg_bram_122default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys23
OTTER_MEMORY/memory_reg_bram_132default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys23
OTTER_MEMORY/memory_reg_bram_132default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys23
OTTER_MEMORY/memory_reg_bram_142default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys23
OTTER_MEMORY/memory_reg_bram_142default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys23
OTTER_MEMORY/memory_reg_bram_152default:default2
Block2default:defaultZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys23
OTTER_MEMORY/memory_reg_bram_152default:default2
Block2default:defaultZ8-7052h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
|Finished Technology Mapping : Time (s): cpu = 00:00:19 ; elapsed = 00:00:20 . Memory (MB): peak = 1220.059 ; gain = 803.090
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
vFinished IO Insertion : Time (s): cpu = 00:00:22 ; elapsed = 00:00:23 . Memory (MB): peak = 1221.617 ; gain = 804.648
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:22 ; elapsed = 00:00:23 . Memory (MB): peak = 1221.617 ; gain = 804.648
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:22 ; elapsed = 00:00:23 . Memory (MB): peak = 1221.617 ; gain = 804.648
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:22 ; elapsed = 00:00:23 . Memory (MB): peak = 1221.617 ; gain = 804.648
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:22 ; elapsed = 00:00:24 . Memory (MB): peak = 1221.617 ; gain = 804.648
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:22 ; elapsed = 00:00:24 . Memory (MB): peak = 1221.617 ; gain = 804.648
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
i
%s
*synth2Q
=
DSP Final Report (the ' indicates corresponding REG is set)
2default:defaulth p
x
� 
�
%s
*synth2�
}+------------+--------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
2default:defaulth p
x
� 
�
%s
*synth2�
~|Module Name | DSP Mapping  | A Size | B Size | C Size | D Size | P Size | AREG | BREG | CREG | DREG | ADREG | MREG | PREG | 
2default:defaulth p
x
� 
�
%s
*synth2�
}+------------+--------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
2default:defaulth p
x
� 
�
%s
*synth2�
~|ALU         | A*B          | 17     | 18     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth p
x
� 
�
%s
*synth2�
~|ALU         | PCIN>>17+A*B | 30     | 18     | -      | -      | 30     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth p
x
� 
�
%s
*synth2�
~|ALU         | A*B          | 17     | 17     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth p
x
� 
�
%s
*synth2�
~|ALU         | PCIN>>17+A*B | 17     | 18     | -      | -      | 47     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth p
x
� 
�
%s
*synth2�
~|ALU         | A*B          | 17     | 15     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth p
x
� 
�
%s
*synth2�
~|ALU         | PCIN>>17+A*B | 15     | 15     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth p
x
� 
�
%s
*synth2�
~|ALU         | A*B          | 17     | 17     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth p
x
� 
�
%s
*synth2�
~|ALU         | PCIN>>17+A*B | 17     | 15     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth p
x
� 
�
%s
*synth2�
~+------------+--------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+

2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
F
%s*synth2.
+------+---------+------+
2default:defaulth px� 
F
%s*synth2.
|      |Cell     |Count |
2default:defaulth px� 
F
%s*synth2.
+------+---------+------+
2default:defaulth px� 
F
%s*synth2.
|1     |BUFG     |     2|
2default:defaulth px� 
F
%s*synth2.
|2     |CARRY4   |  1259|
2default:defaulth px� 
F
%s*synth2.
|3     |DSP48E1  |     8|
2default:defaulth px� 
F
%s*synth2.
|4     |LUT1     |   402|
2default:defaulth px� 
F
%s*synth2.
|5     |LUT2     |   382|
2default:defaulth px� 
F
%s*synth2.
|6     |LUT3     |  4173|
2default:defaulth px� 
F
%s*synth2.
|7     |LUT4     |   316|
2default:defaulth px� 
F
%s*synth2.
|8     |LUT5     |   520|
2default:defaulth px� 
F
%s*synth2.
|9     |LUT6     |   841|
2default:defaulth px� 
F
%s*synth2.
|10    |MUXF7    |   128|
2default:defaulth px� 
F
%s*synth2.
|11    |MUXF8    |    64|
2default:defaulth px� 
F
%s*synth2.
|12    |RAM32M   |    10|
2default:defaulth px� 
F
%s*synth2.
|13    |RAM32X1D |     4|
2default:defaulth px� 
F
%s*synth2.
|14    |RAMB36E1 |    16|
2default:defaulth px� 
F
%s*synth2.
|15    |FDRE     |   609|
2default:defaulth px� 
F
%s*synth2.
|16    |LD       |    32|
2default:defaulth px� 
F
%s*synth2.
|17    |IBUF     |    34|
2default:defaulth px� 
F
%s*synth2.
|18    |OBUF     |    65|
2default:defaulth px� 
F
%s*synth2.
+------+---------+------+
2default:defaulth px� 
E
%s
*synth2-

Report Instance Areas: 
2default:defaulth p
x
� 
q
%s
*synth2Y
E+------+---------------------+------------------------------+------+
2default:defaulth p
x
� 
q
%s
*synth2Y
E|      |Instance             |Module                        |Cells |
2default:defaulth p
x
� 
q
%s
*synth2Y
E+------+---------------------+------------------------------+------+
2default:defaulth p
x
� 
q
%s
*synth2Y
E|1     |top                  |                              |  8865|
2default:defaulth p
x
� 
q
%s
*synth2Y
E|2     |  OTTER_ALU          |ALU                           |  5859|
2default:defaulth p
x
� 
q
%s
*synth2Y
E|3     |  OTTER_MEMORY       |Memory                        |   546|
2default:defaulth p
x
� 
q
%s
*synth2Y
E|4     |  OTTER_reg_file     |RegFile                       |    14|
2default:defaulth p
x
� 
q
%s
*synth2Y
E|5     |  Program_Counter    |reg_nb                        |    57|
2default:defaulth p
x
� 
q
%s
*synth2Y
E|6     |  branch_conditional |branch_cond_gen               |    11|
2default:defaulth p
x
� 
q
%s
*synth2Y
E|7     |  pipeline_reg_D_E   |Pipeline_reg_decode_execute   |   939|
2default:defaulth p
x
� 
q
%s
*synth2Y
E|8     |  pipeline_reg_E_M   |Pipeline_reg_execute_memory   |   982|
2default:defaulth p
x
� 
q
%s
*synth2Y
E|9     |  pipeline_reg_F_D   |Pipeline_reg_fetch_decode     |   153|
2default:defaulth p
x
� 
q
%s
*synth2Y
E|10    |  pipeline_reg_M_W   |Pipeline_reg_memory_writeback |   169|
2default:defaulth p
x
� 
q
%s
*synth2Y
E+------+---------------------+------------------------------+------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:22 ; elapsed = 00:00:24 . Memory (MB): peak = 1221.617 ; gain = 804.648
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
s
%s
*synth2[
GSynthesis finished with 0 errors, 0 critical warnings and 71 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:22 ; elapsed = 00:00:24 . Memory (MB): peak = 1221.617 ; gain = 804.648
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:22 ; elapsed = 00:00:24 . Memory (MB): peak = 1221.617 ; gain = 804.648
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0842default:default2
1233.6642default:default2
0.0002default:defaultZ17-268h px� 
h
-Analyzing %s Unisim elements for replacement
17*netlist2
15212default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
v
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
12default:default2
462default:defaultZ31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0022default:default2
1261.3592default:default2
0.0002default:defaultZ17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2�
�  A total of 46 instances were transformed.
  LD => LDCE: 32 instances
  RAM32M => RAM32M (inverted pins: WCLK) (RAMD32(x6), RAMS32(x2)): 10 instances
  RAM32X1D => RAM32X1D (inverted pins: WCLK) (RAMD32(x2)): 4 instances
2default:defaultZ1-111h px� 
g
$Synth Design complete, checksum: %s
562*	vivadotcl2
b7a42d982default:defaultZ4-1430h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1182default:default2
712default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:242default:default2
00:00:262default:default2
1261.3592default:default2
851.6522default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2y
eZ:/schoolfiles/school_files/cpe333/final_project/vivado_final/vivado_final.runs/synth_1/OTTER_MCU.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2|
hExecuting : report_utilization -file OTTER_MCU_utilization_synth.rpt -pb OTTER_MCU_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Tue Dec  5 04:33:01 20232default:defaultZ17-206h px� 


End Record