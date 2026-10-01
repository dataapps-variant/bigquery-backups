CREATE PROCEDURE `variant-finance-data-project`.ICARUS_Multi.Run_Sequence_Phase_1()
BEGIN

    
    CALL `Icarus_Cohort.proc_IC_Plan_List`();
    CALL `variant-finance-data-project.Icarus_Cohort.proc_IC_7K_SOT_Ratio`();
    CALL `variant-finance-data-project.Icarus_Cohort.proc_IC_Refund_Table`();
    CALL `variant-finance-data-project.Icarus_Cohort.proc_IC_7K_Main_Table`();
    CALL `variant-finance-data-project.Icarus_Cohort.proc_IC_7K_Crystal_Ball`();
    CALL `variant-finance-data-project.Icarus_Cohort.proc_IC_7K_30D_Main_Table`();
    CALL `variant-finance-data-project.Icarus_Cohort.proc_IC_7K_30D_Crystal_Ball`();
    CALL `variant-finance-data-project.Icarus_Cohort.proc_Final_Table`();
    CALL `variant-finance-data-project.Icarus_Cohort.proc_Final_Table_Formatted`();
END;
