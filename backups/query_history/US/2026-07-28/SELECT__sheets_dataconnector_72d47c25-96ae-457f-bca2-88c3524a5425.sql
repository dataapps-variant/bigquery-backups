-- job_id: sheets_dataconnector_72d47c25-96ae-457f-bca2-88c3524a5425
-- user: dev@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T14:33:03.808000+00:00
-- started: 2026-07-28T14:33:03.865000+00:00
-- ended: 2026-07-28T14:33:03.989000+00:00

SELECT BIT_COUNT(__mask & 3) AS rowDepth, BIT_COUNT(__mask & 4) AS colDepth, IF(__mask & 1=0,NULL,`Billing_Cycle`) AS `Billing_Cycle`, IF(__mask & 2=0,NULL,`Total_Users`) AS `Total_Users`, IF(__mask & 4=0,NULL,`SOT_Days`) AS `SOT_Days`, SUM(`SOT_Ratio`) AS `agg0_`
FROM ((
SELECT * FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
)CROSS JOIN UNNEST([7]) __mask)  WHERE ((UPPER(IFNULL(`Product_Name_Final`, '')) LIKE UPPER('%JF2995ST%')))
  GROUP BY __mask, IF(__mask & 1=0,NULL,`Billing_Cycle`), IF(__mask & 2=0,NULL,`Total_Users`), IF(__mask & 4=0,NULL,`SOT_Days`)
