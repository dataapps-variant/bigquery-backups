-- job_id: job_7eNaDWwEDT2JJygbU0MfxMUDUGb2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T15:06:34.772000+00:00
-- started: 2026-07-28T15:06:34.863000+00:00
-- ended: 2026-07-28T15:06:35.040000+00:00

SELECT COUNT(DISTINCT Input_ID) inputs, COUNT(*) n FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
