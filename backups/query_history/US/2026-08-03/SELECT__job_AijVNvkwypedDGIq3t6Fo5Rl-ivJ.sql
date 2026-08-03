-- job_id: job_AijVNvkwypedDGIq3t6Fo5Rl-ivJ
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:49:41.669000+00:00
-- started: 2026-08-03T11:49:41.779000+00:00
-- ended: 2026-08-03T11:49:42.073000+00:00


      SELECT App_Name AS entity, 'channel' AS kind, CAST(AFID_CHANNEL AS STRING) AS value
      FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
      WHERE App_Name IS NOT NULL AND AFID_CHANNEL IS NOT NULL
      GROUP BY 1, 3
      UNION ALL
      SELECT App_Name, 'country', Spend_Country_Code_AFID
      FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
      WHERE App_Name IS NOT NULL AND Spend_Country_Code_AFID IS NOT NULL
      GROUP BY 1, 3
