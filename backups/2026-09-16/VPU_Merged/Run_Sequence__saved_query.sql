CREATE OR REPLACE PROCEDURE `variant-finance-data-project.VPU_Merged.Run_Sequence`()
BEGIN

    
    CALL `variant-finance-data-project.VPU_Merged.proc_Active_Plans_6M`();
    CALL `variant-finance-data-project.VPU_Merged.proc_User_Count_by_Day`();
    CALL `variant-finance-data-project.VPU_Merged.proc_Plan_List`();
    CALL `variant-finance-data-project.VPU_Merged.proc_Refund_Table_Full_Run`();
    CALL `variant-finance-data-project.VPU_Merged.proc_15K_SOT_Ratio_Full_Run`();
    CALL `variant-finance-data-project.VPU_Merged.proc_15K_Crystal_Ball_30`();
    CALL `variant-finance-data-project.VPU_Merged.proc_15K_Main_Table_30_Full_Run`();
    CALL `variant-finance-data-project.VPU_Merged.proc_15K_Main_Table_300_Full_Run`();
    CALL `variant-finance-data-project.VPU_Merged.proc_15K_Main_Table_MP_Full_Run`();
    CALL `variant-finance-data-project.VPU_Merged.proc_15K_Vol_Val`();
    CALL `variant-finance-data-project.VPU_Merged.proc_Entity_Level_Main_MP`();

END;
