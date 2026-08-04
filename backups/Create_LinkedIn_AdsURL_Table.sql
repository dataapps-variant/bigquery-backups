-- Create the new ads_url table in BigQuery
-- Project: variant-finance-data-project
-- Dataset: linkedin_ads
-- Table: ads_url

-- Step 1: Drop the table if it already exists
DROP TABLE IF EXISTS `variant-finance-data-project.linkedin_ads.ads_url`;
-- Step 1: Create the new table structure
CREATE TABLE `variant-finance-data-project.linkedin_ads.ads_url` (
  id INTEGER,
  name STRING,
  reference STRING,
  url STRING
);

-- Step 2: Populate the table with mapped data
INSERT INTO `variant-finance-data-project.linkedin_ads.ads_url` (id, name, reference, url)
SELECT 
  ch.id,
  ch.name,
  ch.reference,
  c.article_source AS url
FROM 
  `variant-finance-data-project.linkedin_ads.creative_history` ch
LEFT JOIN 
  `variant-finance-data-project.linkedin_ads.content` c
ON 
  ch.reference = c.post_id;

-- Optional: View the results
SELECT * FROM `variant-finance-data-project.linkedin_ads.ads_url` LIMIT 100;
