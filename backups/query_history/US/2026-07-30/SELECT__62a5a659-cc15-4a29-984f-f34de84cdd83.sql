-- job_id: 62a5a659-cc15-4a29-984f-f34de84cdd83
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T23:04:24.131000+00:00
-- started: 2026-07-30T23:04:24.277000+00:00
-- ended: 2026-07-30T23:04:24.425000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
