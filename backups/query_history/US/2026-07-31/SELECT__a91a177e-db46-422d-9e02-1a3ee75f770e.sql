-- job_id: a91a177e-db46-422d-9e02-1a3ee75f770e
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T12:45:42.268000+00:00
-- started: 2026-07-31T12:45:42.363000+00:00
-- ended: 2026-07-31T12:45:42.605000+00:00


    SELECT report_date, COUNT(*) n
    FROM `variant-finance-data-project.CWC.Weekly_Insights`
    GROUP BY report_date ORDER BY report_date
