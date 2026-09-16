CREATE PROCEDURE `variant-finance-data-project`.ICARUS_Multi.Run_Sequence_Phase_3()
BEGIN

    
    CALL `variant-finance-data-project.Icarus_Cohort.proc_IC_AFID_List`();
    CALL `Icarus_Cohort.proc_IC_Plan_List_AFID`();

    CALL `variant-finance-data-project.Icarus_Cohort.proc_User_Count_AFID`();

    CALL `variant-finance-data-project.Icarus_Cohort.proc_IC_Refund_Table_AFID`();
    CALL `variant-finance-data-project.Icarus_Cohort.proc_IC_7K_SOT_Ratio_AFID`();
    CALL `variant-finance-data-project.Icarus_Cohort.proc_IC_7K_Main_Table_AFID`();
    CALL `variant-finance-data-project.Icarus_Cohort.proc_IC_7K_Crystal_Ball_AFID`();
    CALL `variant-finance-data-project.Icarus_Cohort.proc_IC_7K_30D_Main_Table_AFID`();
    CALL `variant-finance-data-project.Icarus_Cohort.proc_IC_7K_30D_Crystal_Ball_AFID`();
        CALL `variant-finance-data-project.Icarus_Cohort.proc_Final_Table_AFID`();
END;
