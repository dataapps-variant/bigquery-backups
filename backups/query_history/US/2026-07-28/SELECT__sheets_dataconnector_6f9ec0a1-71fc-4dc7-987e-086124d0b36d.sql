-- job_id: sheets_dataconnector_6f9ec0a1-71fc-4dc7-987e-086124d0b36d
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T17:01:14.712000+00:00
-- started: 2026-07-28T17:01:14.803000+00:00
-- ended: 2026-07-28T17:01:15.087000+00:00

SELECT BIT_COUNT(__mask & 7) AS rowDepth, BIT_COUNT(__mask & 0) AS colDepth, IF(__mask & 1=0,NULL,MAX(`App_Name`)) AS `App_Name`, IF(__mask & 2=0,NULL,`Channel_code`) AS `Channel_code`, IF(__mask & 4=0,NULL,MAX(`Channel_name`)) AS `Channel_name`, SUM(`Jan_2026`) AS `agg0_`, SUM(`Feb_2026`) AS `agg1_`, SUM(`Mar_2026`) AS `agg2_`, SUM(`Apr_2026`) AS `agg3_`, SUM(`May_2026`) AS `agg4_`, SUM(`Jun_2026`) AS `agg5_`
FROM ((
SELECT * FROM `variant-finance-data-project.Ad_spend_data.Spend_Matching_Channel`
)CROSS JOIN UNNEST([7]) __mask)  WHERE ((UPPER(`Channel_name`) IN (UPPER('OpenAI_Ads'))))
  GROUP BY __mask, IF(__mask & 1=0,NULL,UPPER(`App_Name`)), IF(__mask & 2=0,NULL,`Channel_code`), IF(__mask & 4=0,NULL,UPPER(`Channel_name`))
