-- job_id: job_T7D7vMU_kkaVIqi7IyeLoayVr63B
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:49:42.579000+00:00
-- started: 2026-08-03T11:49:42.686000+00:00
-- ended: 2026-08-03T11:49:43.325000+00:00


      WITH base AS (
        SELECT src.App_Name AS entity,
               COALESCE(map.Updated_Concat, src.Product_Name_Final) AS plan,
               CAST(src.AFID_CHANNEL AS STRING) AS channel,
               src.Spend_Country_Code_AFID AS country
        FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` src
        LEFT JOIN `variant-finance-data-project.Sticky_Data.R100_BQ_Updated_Product_Name` map
          ON src.Product_Name_Final = map.Concat
        WHERE src.App_Name IS NOT NULL AND src.Product_Name_Final IS NOT NULL
      )
      SELECT entity, plan, 'channel' AS kind, channel AS value FROM base WHERE channel IS NOT NULL GROUP BY 1,2,4
      UNION ALL
      SELECT entity, plan, 'country', country FROM base WHERE country IS NOT NULL GROUP BY 1,2,4
