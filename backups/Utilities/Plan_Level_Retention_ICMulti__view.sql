CREATE VIEW `variant-finance-data-project.Utilities.Plan_Level_Retention_ICMulti`
AS SELECT 
    Plan_Name,
    Metric_Name,
    App_Name,
    BC0,
    BC1,
    BC2,
    BC3,
    BC4,
    BC5,
    BC6,
    BC7,
    BC8,
    BC9,
    BC10,
    BC11,
    BC12
FROM 
    `variant-finance-data-project.ICARUS_Multi.Final_Table_Formatted`
WHERE 
    Reporting_Date = (SELECT MAX(Reporting_Date) FROM `variant-finance-data-project.ICARUS_Multi.Final_Table_Formatted`)
    AND Active_Inactive = 'Active'
    AND Cohort = '7K_30D'
    AND Table_Type = 'Regular'
    AND Metric_Name = '05. Gross Retention Rate'
ORDER BY 
    App_Name,
    Plan_Name;
