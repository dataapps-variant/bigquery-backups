CREATE OR REPLACE PROCEDURE `variant-finance-data-project.ICARUS_Multi.Run_Sequence`()
BEGIN

    CALL `variant-finance-data-project.ICARUS_Multi.proc_Refund_Table`();
    CALL `variant-finance-data-project.ICARUS_Multi.proc_Plan_List`();
    CALL `variant-finance-data-project.ICARUS_Multi.proc_Active_Plans_6M`();
    CALL `variant-finance-data-project.ICARUS_Multi.proc_7k_SOT_Ratio`();
    CALL `variant-finance-data-project.ICARUS_Multi.proc_7K_30D_Crystal_Ball`();
    CALL `variant-finance-data-project.ICARUS_Multi.proc_7K_30D_Main_Table`();
    CALL `variant-finance-data-project.ICARUS_Multi.proc_7K_Crystal_Ball`();
    CALL `variant-finance-data-project.ICARUS_Multi.proc_7K_Main_Table`();
    CALL `variant-finance-data-project.ICARUS_Multi.proc_Final_Table`();
    CALL `variant-finance-data-project.ICARUS_Multi.proc_Final_Table_Formatted`();
    CALL `variant-finance-data-project.ICARUS_Multi.proc_Final_Table_Historical`();

END;
