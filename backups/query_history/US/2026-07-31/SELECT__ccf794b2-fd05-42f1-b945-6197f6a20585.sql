-- job_id: ccf794b2-fd05-42f1-b945-6197f6a20585
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T21:01:51.678000+00:00
-- started: 2026-07-31T21:01:51.967000+00:00
-- ended: 2026-07-31T21:01:52.103000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
