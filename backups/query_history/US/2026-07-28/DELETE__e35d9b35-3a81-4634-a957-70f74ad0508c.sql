-- job_id: e35d9b35-3a81-4634-a957-70f74ad0508c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T06:04:59.971000+00:00
-- started: 2026-07-28T06:05:00.407000+00:00
-- ended: 2026-07-28T06:05:01.468000+00:00


        DELETE FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders`
        WHERE company = 'pdfdotnet' AND order_id IN ('1929349', '2326973', '2321061', '1743062')
