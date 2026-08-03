-- job_id: 70ef94c6-2b10-4689-b451-64544a279d00
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T05:02:03.055000+00:00
-- started: 2026-07-30T05:02:03.165000+00:00
-- ended: 2026-07-30T05:02:03.342000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
