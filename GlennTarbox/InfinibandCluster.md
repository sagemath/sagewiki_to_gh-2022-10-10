## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:CategoryTemplate
##master-date:Unknown-Date
#format wiki
#language en

= Infiniband Cluster =

This has been coming for quite a while... but looks like things might really be happening.

It appears as though InfiniBand is ready for prime time.  The architecture proposed here is one where you nail up underneath the memory infrastructure, and use infiniband to integrate multiple blades into one big SMP machine.  The idea is you run one SMP os with however many cores, and there is no change needed to the OS at all.

This architecture, apparently, has been proven and is working at various places.  The key to the activity described below and in the attached docs is making it available to the unwashed masses.

Clearly, more investigation is needed.

However, the person / company in question has the hardware and is testing... they're going to have a testbed up in a week or two and would be willing to give us shell access to compile Sage and see how it works on a class of problems.

I think the idea is to run some Python Processing task with as many processes as CPU's and see what happens.

{{{
Hi Glenn,

Great talking with you today.  As promised, here is a high-level white paper on the vSMP arch, and some more customer-facing documentation.  In the blade space, it looks like it presently works with a two-socket, Intel Seaburg chipset blade, for a total of 8 cores and up to 64GB per blade.  The Seaburg chipset gives access to the 1600MHz procs and 800MHz memory, so that fits well with apps. that are bound by cycles and FSB memory transfers. 

Currently, this thing can be packaged in the following ways:

-Blade: (virtual 20 socket system with 640GB memory in 7U)
--Up to 10, dual-socket blades with up to X5482 procs (3.2GHz, 12MB, 1600FSB)
--Up to 64GB per blade.  
--IB HCA mezzanine cards, and IB switch in chassis.

-Twin: (virtual 4 socket system with up to 128GB* in 1U) *uses 8GB sticks

-Rack Server: (virtual 4 socket system with up to 128GB* in 2U) *uses 4GB sticks

Refer to scalemp.com for more info, and specifically to: http://www.scalemp.com/vfs-specifications/ for their hardware qual. list.  Don't pay any attention to the IBM gear :)
}}}

 * http://www.scalemp.com/vfs-specifications/

[[AttachInfo]]
[[AttachList]]

----
CategoryDsageng
