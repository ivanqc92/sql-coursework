-- Database retrieved from https://www.ncei.noaa.gov/access/world-ocean-atlas-2023/bin/woa23.pl

-- Find the normal ocean surface temperature in the Gulf of Maine, off the coast of Massachusetts
SELECT "0m" FROM "normals" WHERE "latitude" = 42.5 AND "longitude" = -69.5;

-- Find the normal temperature of the deepest sensor near the Gulf of Maine, at the same coordinate above
SELECT "225m" FROM "normals" WHERE "latitude" = 42.5 AND "longitude" = -69.5;

-- Find the normal temperature at 0 meters, 100 meters, and 200 meters of any location
SELECT "0m", "100m", "200m" FROM "normals" WHERE "latitude" = 26.5 AND "longitude" = 51.5;

-- Find the lowest normal ocean surface temperature
SELECT MIN("0m") FROM "normals";

-- Find the highest normal ocean surface temperature
SELECT MAX("0m") FROM "normals";

-- Return all normal ocean temperatures at 50m of depth, as well as their respective degrees of
-- latitude and longitude, within the Arabian Sea
SELECT "50m", "latitude", "longitude" FROM "normals"
WHERE "latitude" BETWEEN 0 AND 20 AND "longitude" BETWEEN 55 AND 75;

-- Find the average ocean surface temperature, rounded to two decimal places, along the equator.
-- Call the resulting column “Average Equator Ocean Surface Temperature”
SELECT ROUND(AVG("0m"), 2) AS "Average Equator Ocean Surface Temperature" FROM "normals"
WHERE "latitude" >= -0.5 AND "latitude" <= 0.5;

-- find the 10 locations with the lowest normal ocean surface temperature, sorted coldest to warmest
-- If two locations have the same normal ocean surface temperature, sort by latitude, smallest to largest
-- Include latitude, longitude, and surface temperature columns
SELECT "latitude", "longitude", "0m" FROM "normals" ORDER BY "0m", "latitude" LIMIT 10;

-- Find the 10 locations with the highest normal ocean surface temperature, sorted warmest to coldest
-- If two locations have the same normal ocean surface temperature, sort by latitude, smallest to largest
-- Include latitude, longitude, and surface temperature columns
SELECT "latitude", "longitude", "0m" FROM "normals" ORDER BY "0m" DESC, "latitude" LIMIT 10;

-- Determine how many points of latitude have at least one data point
SELECT COUNT(DISTINCT "latitude") FROM "normals" WHERE "latitude" IS NOT NULL;
