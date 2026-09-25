# Midwest Airbnb Listings: Data Dictionary

**Dataset:** `listings` table in `midwest_airbnb.db` (SQLite), 14,887 rows and 29 columns
**Source:** Inside Airbnb (https://insideairbnb.com/get-the-data/), the detailed `listings.csv.gz` file for each of three regions: Chicago (snapshot 2026-07-20), Columbus (snapshot 2026-07-23), and Twin Cities MSA (snapshot 2026-07-21). Column meanings follow Inside Airbnb's data dictionary and assumptions (https://insideairbnb.com/data-assumptions/).
**Course:** ISA 401, Miami University

> One row is one listing that showed a nightly price on the snapshot date; listings with no price were dropped. Empty cells are stored as SQL `NULL`.

---

## Field Definitions

| Field | Type | Description |
|---|---|---|
| `city` | text | Which Inside Airbnb region the listing came from: `Chicago` (7,439 rows), `Columbus` (2,587), or `Twin Cities` (4,861). The Twin Cities file covers the Minneapolis-St. Paul metro area, not just the two cities. |
| `snapshot_date` | text | Date Inside Airbnb compiled the file, stored as an ISO text string, not a date: `2026-07-20` for Chicago, `2026-07-23` for Columbus, `2026-07-21` for Twin Cities. Every row of a city shares the same value. |
| `id` | text | Airbnb's listing id. Unique across the table (14,887 distinct values). Stored as text even though it looks numeric, so compare it to a quoted string. |
| `name` | text | Listing title as shown on Airbnb (for example "Tiny Studio Apartment 94 Walk Score"). Never empty. |
| `price` | real | Nightly price in U.S. dollars on the snapshot date, with the dollar sign and commas removed. Ranges from 2.56 to 11,412; never `NULL` (rows without a price were dropped). |
| `room_type` | text | Airbnb's four listing categories: `Entire home/apt` (11,652 rows), `Private room` (2,951), `Hotel room` (246), or `Shared room` (38). |
| `host_id` | integer | The unique identifier Airbnb has for the host or user. |
| `host_name` | text | The name of the Airbnb host, which includes usually the first name. |
| `host_since` | date | The date that the host registered and when user signed up. |
|`host_is_superhost`| boolean [t=true; f=false] | Declares whether the host is a super host or not , which is a top-rated host. |
| `neighbourhood`| text | identifies the neighborhood the host has their Airbnb house |
|`latitude`| numeric | Uses the World Geodotic System for finding latitude|
| `longitude`| numeric | Uses the World Geodotic System for finding longitude|
| `property_type`| text| describes the type of property the host has for the guest, Hotels and Bed and Breakfasts are described as such by respected host |
|`accommodates` | integer | The capacity of the listing. |
|`bedrooms`| integer | The amount of bedrooms in the listing. |
| `beds` | integer | The number of beds in the property.|
|`bathrooms_text` | string | The description of the bathroom, the Airbnb listing has evolved from number to description, for older scrapes, number of bathrooms is listed |
| `minimum_nights`| integer | Minimum number of night stay for the listing. |
| `availability_365`| integer | The availability of the listing 365 days in the future as determined by the calendar. Listing could be blocked by a guest already booking it. |
|`number_of_reviews`| integer | The amount of reviews the listing has. |
| `number_of_reviews_ltm` | integer | The amount of reviews the listing has in the last 12 months. | 
| `first_review` | date | The date of the first and thus oldest review. | 
| `last_review` | date | The date of the last and thus newest review. |
| `review_scores_rating` | numeric | The average rating of the listing from the review scores |
|`reviews_per_month`| numeric | The average number of reviews per month the listing has over the lifetime of the listing. |
| `instant_bookable` | boolean |  An indicator of a commercial listing. Whether the guest can automatically book the listing without the host requiring to accept their booking request. |
| `estimated_revenue_l365d` | numeric | Estimated revenue for a listing on a 365 day basis. 
| `amenities_count` | integer | number of items for each listings amenities. |
Continue the table for the remaining 23 columns (Assignment 05): `host_id`, `host_name`, `host_since`, `host_is_superhost`, `neighbourhood`, `latitude`, `longitude`, `property_type`, `accommodates`, `bedrooms`, `beds`, `bathrooms_text`, `minimum_nights`, `availability_365`, `number_of_reviews`, `number_of_reviews_ltm`, `first_review`, `last_review`, `review_scores_rating`, `reviews_per_month`, `instant_bookable`, `estimated_revenue_l365d`, `amenities_count`.

Two hints: `neighbourhood` is Inside Airbnb's `neighbourhood_cleansed` column, and `amenities_count` is not an Inside Airbnb column; it was computed for this course as the number of items in each listing's `amenities` list. Everything else keeps its Inside Airbnb name, so the data dictionary linked above explains it.
