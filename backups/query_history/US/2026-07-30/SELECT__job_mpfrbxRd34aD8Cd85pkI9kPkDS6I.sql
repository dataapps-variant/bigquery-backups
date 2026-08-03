-- job_id: job_mpfrbxRd34aD8Cd85pkI9kPkDS6I
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T14:13:22.187000+00:00
-- started: 2026-07-30T14:13:22.305000+00:00
-- ended: 2026-07-30T14:13:22.709000+00:00

SELECT DISTINCT CAST(AFID_CHANNEL AS STRING) v FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` WHERE AFID_CHANNEL IS NOT NULL ORDER BY 1 LIMIT 12
