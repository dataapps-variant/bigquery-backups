CREATE OR REPLACE PROCEDURE `variant-finance-data-project.ICARUS_Multi.Run_Sequence_Phase_4`()
BEGIN

    
    CALL `variant-finance-data-project.Icarus_Cohort.proc_IC_7K_SOT_Ratio_App_AFID`();
    CALL `variant-finance-data-project.Icarus_Cohort.proc_IC_7K_Main_Table_App_AFID`();
    CALL `variant-finance-data-project.Icarus_Cohort.proc_IC_7K_Crystal_Ball_App_AFID`();
    CALL `variant-finance-data-project.Icarus_Cohort.proc_IC_7K_30D_Main_Table_App_AFID`();
    CALL `variant-finance-data-project.Icarus_Cohort.proc_IC_7K_30D_Crystal_Ball_App_AFID`();
    CALL `variant-finance-data-project.Icarus_Cohort.proc_Final_Table_App_AFID`();

END;
