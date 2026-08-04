CREATE PROCEDURE `variant-finance-data-project`.ICARUS_Multi.Run_Sequence_Phase_5()
BEGIN

    
    CALL `variant-finance-data-project.ICARUS_Multi.proc_7k_SOT_Ratio_App`();
    CALL `variant-finance-data-project.ICARUS_Multi.proc_7K_Main_Table_App_level`();
    CALL `variant-finance-data-project.ICARUS_Multi.proc_7K_Crystal_Ball_App_level`();
    CALL `variant-finance-data-project.ICARUS_Multi.proc_7K_30D_Main_Table_App_level`();
    CALL `variant-finance-data-project.ICARUS_Multi.proc_7K_30D_Crystal_Ball_App_level`();
    CALL `variant-finance-data-project.ICARUS_Multi.proc_7K_Crystal_Ball_App_level`();
    CALL `variant-finance-data-project.ICARUS_Multi.proc_Final_Table_App_Level`();

END;
