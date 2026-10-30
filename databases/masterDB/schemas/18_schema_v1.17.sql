-- Hosn El Hal pseudo-country, like PlayAndHeal (PS): it gives the programme a
-- country admin and holds its visit events. XH is in ISO 3166's private-use
-- range (XA-XZ), so it can never clash with a real country.
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active", "timezone")
SELECT (SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'HosnElHal', 'XH', 'XHH', NULL, true, 'Asia/Beirut'
WHERE NOT EXISTS (SELECT 1 FROM "country" WHERE "alpha2" = 'XH');

-- Hosn El Hal website visits, stored under the XH country
ALTER TYPE event_type ADD VALUE IF NOT EXISTS 'hosnelhal_visit';


-- Hosn El Hal resource opens in content_engagement_event (content_type + action view).
-- Format and pillar stay in CMS; admin joins on content_id when aggregating.
ALTER TYPE content_type ADD VALUE IF NOT EXISTS 'hosn_asset';


-- Hosn El Hal feedback card: "Would you recommend the resources?" votes and
-- clicks through to UNICEF's survey, stored under the XH country like the
-- visits (hosnelhal_visit)
ALTER TYPE event_type ADD VALUE IF NOT EXISTS 'hosnelhal_feedback_up';
ALTER TYPE event_type ADD VALUE IF NOT EXISTS 'hosnelhal_feedback_down';
ALTER TYPE event_type ADD VALUE IF NOT EXISTS 'hosnelhal_feedback_survey_click';
