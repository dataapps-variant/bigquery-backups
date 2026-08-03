-- job_id: bquxjob_10a76603_19fad83fb0e
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T10:55:37.415000+00:00
-- started: 2026-07-29T10:55:37.523000+00:00
-- ended: 2026-07-29T10:55:37.803000+00:00

SELECT DISTINCT(`AFID`), COUNT(*) FROM `variant-finance-data-project.ICARUS_Multi.Final_Table_App_AFID_Level` GROUP BY 1 ORDER BY 2 DESC LIMIT 10
