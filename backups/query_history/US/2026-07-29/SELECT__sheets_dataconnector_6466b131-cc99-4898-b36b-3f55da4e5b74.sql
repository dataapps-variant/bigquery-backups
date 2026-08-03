-- job_id: sheets_dataconnector_6466b131-cc99-4898-b36b-3f55da4e5b74
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T17:20:52.409000+00:00
-- started: 2026-07-29T17:20:52.485000+00:00
-- ended: 2026-07-29T17:20:52.753000+00:00

SELECT BIT_COUNT(__mask & 7) AS rowDepth, BIT_COUNT(__mask & 0) AS colDepth, IF(__mask & 1=0,NULL,MAX(`App_Name`)) AS `App_Name`, IF(__mask & 2=0,NULL,`Channel_code`) AS `Channel_code`, IF(__mask & 4=0,NULL,MAX(`Channel_name`)) AS `Channel_name`, SUM(`Jan_2026`) AS `agg0_`, SUM(`Feb_2026`) AS `agg1_`, SUM(`Mar_2026`) AS `agg2_`, SUM(`Apr_2026`) AS `agg3_`, SUM(`May_2026`) AS `agg4_`, SUM(`Jun_2026`) AS `agg5_`
FROM ((
SELECT * FROM `variant-finance-data-project.Ad_spend_data.Spend_Matching_Channel`
)CROSS JOIN UNNEST([7]) __mask)  WHERE ((UPPER(`Channel_name`) IN (UPPER('TikTok_Ads'))))
  GROUP BY __mask, IF(__mask & 1=0,NULL,UPPER(`App_Name`)), IF(__mask & 2=0,NULL,`Channel_code`), IF(__mask & 4=0,NULL,UPPER(`Channel_name`))
