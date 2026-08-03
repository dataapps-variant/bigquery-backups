-- job_id: sheets_dataconnector_c1ca5d79-5e3c-4b50-8493-37e8b761afec
-- user: dev@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T14:32:56.113000+00:00
-- started: 2026-07-28T14:32:56.173000+00:00
-- ended: 2026-07-28T14:32:56.370000+00:00

SELECT BIT_COUNT(__mask & 3) AS rowDepth, BIT_COUNT(__mask & 4) AS colDepth, IF(__mask & 1=0,NULL,`Billing_Cycle`) AS `Billing_Cycle`, IF(__mask & 2=0,NULL,`Total_Users`) AS `Total_Users`, IF(__mask & 4=0,NULL,`SOT_Days`) AS `SOT_Days`, SUM(`SOT_Ratio`) AS `agg0_`
FROM ((
SELECT * FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
)CROSS JOIN UNNEST([7]) __mask)  WHERE ((UPPER(IFNULL(`Product_Name_Final`, '')) LIKE UPPER('%JF2995ST%')))
  GROUP BY __mask, IF(__mask & 1=0,NULL,`Billing_Cycle`), IF(__mask & 2=0,NULL,`Total_Users`), IF(__mask & 4=0,NULL,`SOT_Days`)
