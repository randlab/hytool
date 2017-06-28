function pcb_pre(rw,rc,r,q)
%PCB_PRE - Initialize the data required for pcb_dim and pcb_rpt 
%
% Syntax: d = pcb_pre(rw,rc,r,q)
%
%   rw = radius of the well in meters
%   rc = radius of the casing in meters
%   r  = distance [m] between the observation well and well pumping well 
%   q  = pumping rate in m3/s
%
% Description:
%   pcb stands for Papadopulos-Cooper (1967) solution for a constant rate 
%   pumping test in a large diameter well. The function  pcb_pre  must be
%   used to initialize the pumping rate history before making any call to 
%   pcb_dim or pcb_rpt.
%
% See also: pcb_dmo, pcb_dim, pcb_rpt, pcb_gss
%


global PCB_RW PCB_RC PCB_RD PCB_R PCB_Q

PCB_RW=rw;
PCB_RC=rc;
PCB_RD=r/rc;
PCB_R=r;
PCB_Q=q;

