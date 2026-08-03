-- job_id: job_dS1hGTFdgR7fOWbLRE3YtBYuMzcE
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T14:23:18.147000+00:00
-- started: 2026-07-28T14:23:18.269000+00:00
-- ended: 2026-07-28T14:23:18.765000+00:00

SELECT * FROM `variant-finance-data-project.ICARUS_Multi.Final_Table` 
Where Reporting_Date >= "2026-07-12"
and App_Name = "CT-JP"
