-- job_id: job_qG7DhihVaWgRp77FlFnvGeGjO9q-
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T11:42:13.883000+00:00
-- started: 2026-07-31T11:42:13.997000+00:00
-- ended: 2026-07-31T11:42:14.562000+00:00


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
