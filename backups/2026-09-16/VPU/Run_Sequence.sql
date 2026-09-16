CREATE PROCEDURE `variant-finance-data-project`.VPU.Run_Sequence()
BEGIN

    
    CALL `variant-finance-data-project.VPU.proc_Refund_Table`();
    CALL `variant-finance-data-project.VPU.proc_15K_SOT_Ratio`();
    CALL `variant-finance-data-project.VPU.proc_15K_Main_Table_MP`();
    CALL `variant-finance-data-project.VPU.proc_15K_Main_Table`();
    CALL `variant-finance-data-project.VPU.proc_15K_Main_Table_300`();
    CALL `variant-finance-data-project.VPU.proc_15K_Crystal_Ball_MP`();
    CALL `variant-finance-data-project.VPU.proc_15K_Crystal_Ball`();

END;
