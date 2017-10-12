@echo off
set xv_path=F:\\Vivado\\2015.4\\bin
call %xv_path%/xsim top_design_behav -key {Behavioral:sim_1:Functional:top_design} -tclbatch top_design.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
