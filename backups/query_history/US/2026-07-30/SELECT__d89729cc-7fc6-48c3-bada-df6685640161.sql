-- job_id: d89729cc-7fc6-48c3-bada-df6685640161
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T15:03:59.971000+00:00
-- started: 2026-07-30T15:04:00.087000+00:00
-- ended: 2026-07-30T15:04:00.214000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
