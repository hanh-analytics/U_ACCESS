# Change the names of columns
ALTER TABLE hygiene_data.hygiene_fall24
CHANGE COLUMN `Student ID` student_id INT,
CHANGE COLUMN `Toilet Paper / Laundry / Dish soap` toilet_paper_laundry_dish_soap TEXT,
CHANGE COLUMN `Socks` socks TEXT,
CHANGE COLUMN `Toothpaste, soap, chapstick` toothpaste_soap_chapstick TEXT,
CHANGE COLUMN `Shampoo` shampoo TEXT,
CHANGE COLUMN `Body Wash` body_wash TEXT,
CHANGE COLUMN `Hand soap Hand Sanitzier, Lotion` hand_soap_hand_sanitizer_lotion TEXT,
CHANGE COLUMN `Feminine Hygiene` feminine_hygiene TEXT,
CHANGE COLUMN `Deodorant` deodorant TEXT;

# Total number of students requesting hygiene products
SELECT COUNT(DISTINCT student_id) AS total_students
FROM hygiene_data.hygiene_fall24;

# The total number of Toilet paper requested by students
SELECT COUNT(*) AS toilet_paper_count
FROM hygiene_data.hygiene_fall24
WHERE toilet_paper_laundry_dish_soap LIKE '%Toilet paper%';

# The total number of Laundry requested by students
SELECT COUNT(*) AS laundry_count
FROM hygiene_data.hygiene_fall24
WHERE toilet_paper_laundry_dish_soap LIKE '%Laundry Detergent/Dryer Sheet%';

# The total number of Dish soap requested by students
SELECT COUNT(*) AS dish_soap_count
FROM hygiene_data.hygiene_fall24
WHERE toilet_paper_laundry_dish_soap LIKE '%Dish-washing liquid%';

# The total number of Socks requested by students
SELECT COUNT(*) AS socks_count
FROM hygiene_data.hygiene_fall24
WHERE socks LIKE '%socks%';

# The total number of Toothpaste requested by students
SELECT COUNT(*) AS toothpaste_count
FROM hygiene_data.hygiene_fall24
WHERE toothpaste_soap_chapstick LIKE '%Tooth Paste%';

# The total number of Shaving Cream & Razorrequested by students
SELECT COUNT(*) AS shaving_cream_and_razor_count
FROM hygiene_data.hygiene_fall24
WHERE toothpaste_soap_chapstick LIKE '%Shaving Cream & Razor%';

# The total number of Soap requested by students
SELECT COUNT(*) AS soap_count
FROM hygiene_data.hygiene_fall24
WHERE toothpaste_soap_chapstick LIKE '%soap%';

# The total number of Tooth brush requested by students
SELECT COUNT(*) AS toothbrush_count
FROM hygiene_data.hygiene_fall24
WHERE toothpaste_soap_chapstick LIKE '%Tooth Brush%';

# The total number of Chapstick requested by students
SELECT COUNT(*) AS chapstick_count
FROM hygiene_data.hygiene_fall24
WHERE toothpaste_soap_chapstick LIKE '%chapstick%';

# The total number of Shampoo requested by students
SELECT COUNT(*) AS shampoo_count
FROM hygiene_data.hygiene_fall24
WHERE shampoo LIKE '%shampoo%';

# The total number of Conditioner requested by students
SELECT COUNT(*) AS conditioner_count
FROM hygiene_data.hygiene_fall24
WHERE shampoo LIKE '%conditioner%';

# The total number of Body Wash requested by students
SELECT COUNT(*) AS body_wash_count
FROM hygiene_data.hygiene_fall24
WHERE body_wash LIKE '%body wash%';

# Total number of Hand Soap requested by students
SELECT COUNT(*) AS hand_soap_count
FROM hygiene_data.hygiene_fall24
WHERE hand_soap_hand_sanitizer_lotion LIKE '%hand soap%';

# Total number of Hand Sanitizer requested by students
SELECT COUNT(*) AS hand_sanitizer_count
FROM hygiene_data.hygiene_fall24
WHERE hand_soap_hand_sanitizer_lotion LIKE '%hand sanitizer%';

# Total number of Lotion requested by students
SELECT COUNT(*) AS lotion_count
FROM hygiene_data.hygiene_fall24
WHERE hand_soap_hand_sanitizer_lotion LIKE '%lotion%';

# Total number of Face Masks requested by students
SELECT COUNT(*) AS face_mask_count
FROM hygiene_data.hygiene_fall24
WHERE hand_soap_hand_sanitizer_lotion LIKE '%face mask%';

# Total number of Face Tissues requested by students
SELECT COUNT(*) AS face_tissue_count
FROM hygiene_data.hygiene_fall24
WHERE hand_soap_hand_sanitizer_lotion LIKE '%face tissue%';

# Total number of Feminine Hygiene products requested by students
SELECT COUNT(*) AS feminine_hygiene_total
FROM hygiene_data.hygiene_fall24
WHERE feminine_hygiene IS NOT NULL;

# Total number of Deodorant requested by students
SELECT COUNT(*) AS deodorant_count
FROM hygiene_data.hygiene_fall24
WHERE deodorant LIKE '%deodorant%';

# Total number of Bladder Leakage products requested
SELECT COUNT(*) AS bladder_leakage_count
FROM hygiene_data.hygiene_fall24
WHERE feminine_hygiene LIKE '%bladder leakage%';

# Total number of Boxes of Pads requested
SELECT COUNT(*) AS box_of_pads_count
FROM hygiene_data.hygiene_fall24
WHERE feminine_hygiene LIKE '%box of pads%';

# Total number of Boxes of Tampons requested
SELECT COUNT(*) AS box_of_tampons_count
FROM hygiene_data.hygiene_fall24
WHERE feminine_hygiene LIKE '%box of tampons%';

# Total number of External Condoms requested
SELECT COUNT(*) AS external_condoms_count
FROM hygiene_data.hygiene_fall24
WHERE feminine_hygiene LIKE '%external condoms%';

# Total number of Panty Liners requested
SELECT COUNT(*) AS panty_liners_count
FROM hygiene_data.hygiene_fall24
WHERE feminine_hygiene LIKE '%panty liners%';

# Number of Socks based on Genders 
SELECT 
    CASE 
        WHEN LOWER(TRIM(socks)) REGEXP '\\bmen\\b' AND LOWER(TRIM(socks)) NOT REGEXP '\\bwomen\\b' THEN "Men's Socks"
        WHEN LOWER(TRIM(socks)) REGEXP '\\bwomen\\b' AND LOWER(TRIM(socks)) NOT REGEXP '\\bmen\\b' THEN "Women's Socks"
        ELSE "No Socks"
    END AS sock_type,
    COUNT(*) AS total_requests
FROM hygiene_data.hygiene_fall24
GROUP BY sock_type;

# Number of Deodorants based on Genders 
SELECT 
    CASE 
        WHEN LOWER(TRIM(deodorant)) REGEXP '\\bmen\\b' AND LOWER(TRIM(deodorant)) NOT REGEXP '\\bwomen\\b' THEN "Men's Deodorant"
        WHEN LOWER(TRIM(deodorant)) REGEXP '\\bwomen\\b' AND LOWER(TRIM(deodorant)) NOT REGEXP '\\bmen\\b' THEN "Women's Deodorant"
        ELSE "No Deodorant"
    END AS deodorant_type,
    COUNT(DISTINCT student_id) AS total_requests
FROM hygiene_data.hygiene_fall24
GROUP BY deodorant_type;


# Show the product with the highest request count
SELECT product, total_requests
FROM (
    SELECT 'Toilet Paper' AS product, COUNT(*) AS total_requests
    FROM hygiene_data.hygiene_fall24
    WHERE toilet_paper_laundry_dish_soap LIKE '%Toilet paper%'

    UNION ALL

    SELECT 'Laundry Detergent' AS product, COUNT(*) AS total_requests
    FROM hygiene_data.hygiene_fall24
    WHERE toilet_paper_laundry_dish_soap LIKE '%Laundry Detergent/Dryer Sheet%'

    UNION ALL

    SELECT 'Dish Soap' AS product, COUNT(*) AS total_requests
    FROM hygiene_data.hygiene_fall24
    WHERE toilet_paper_laundry_dish_soap LIKE '%Dish-washing liquid%'

    UNION ALL

    SELECT 'Socks' AS product, COUNT(*) AS total_requests
    FROM hygiene_data.hygiene_fall24
    WHERE socks LIKE '%socks%'

    UNION ALL

    SELECT 'Toothpaste' AS product, COUNT(*) AS total_requests
    FROM hygiene_data.hygiene_fall24
    WHERE toothpaste_soap_chapstick LIKE '%Tooth Paste%'

    UNION ALL

    SELECT 'Shaving Cream & Razor' AS product, COUNT(*) AS total_requests
    FROM hygiene_data.hygiene_fall24
    WHERE toothpaste_soap_chapstick LIKE '%Shaving Cream & Razor%'

    UNION ALL

    SELECT 'Soap' AS product, COUNT(*) AS total_requests
    FROM hygiene_data.hygiene_fall24
    WHERE toothpaste_soap_chapstick LIKE '%soap%'

    UNION ALL

    SELECT 'Tooth Brush' AS product, COUNT(*) AS total_requests
    FROM hygiene_data.hygiene_fall24
    WHERE toothpaste_soap_chapstick LIKE '%Tooth Brush%'

    UNION ALL

    SELECT 'Chapstick' AS product, COUNT(*) AS total_requests
    FROM hygiene_data.hygiene_fall24
    WHERE toothpaste_soap_chapstick LIKE '%chapstick%'

    UNION ALL

    SELECT 'Shampoo' AS product, COUNT(*) AS total_requests
    FROM hygiene_data.hygiene_fall24
    WHERE shampoo LIKE '%shampoo%'

    UNION ALL

    SELECT 'Conditioner' AS product, COUNT(*) AS total_requests
    FROM hygiene_data.hygiene_fall24
    WHERE shampoo LIKE '%conditioner%'

    UNION ALL

    SELECT 'Body Wash' AS product, COUNT(*) AS total_requests
    FROM hygiene_data.hygiene_fall24
    WHERE body_wash LIKE '%body wash%'

    UNION ALL

    SELECT 'Hand Soap' AS product, COUNT(*) AS total_requests
    FROM hygiene_data.hygiene_fall24
    WHERE hand_soap_hand_sanitizer_lotion LIKE '%hand soap%'

    UNION ALL

    SELECT 'Hand Sanitizer' AS product, COUNT(*) AS total_requests
    FROM hygiene_data.hygiene_fall24
    WHERE hand_soap_hand_sanitizer_lotion LIKE '%hand sanitizer%'

    UNION ALL

    SELECT 'Lotion' AS product, COUNT(*) AS total_requests
    FROM hygiene_data.hygiene_fall24
    WHERE hand_soap_hand_sanitizer_lotion LIKE '%lotion%'

    UNION ALL

    SELECT 'Face Mask' AS product, COUNT(*) AS total_requests
    FROM hygiene_data.hygiene_fall24
    WHERE hand_soap_hand_sanitizer_lotion LIKE '%face mask%'

    UNION ALL

    SELECT 'Face Tissue' AS product, COUNT(*) AS total_requests
    FROM hygiene_data.hygiene_fall24
    WHERE hand_soap_hand_sanitizer_lotion LIKE '%face tissue%'

    UNION ALL

    SELECT 'Deodorant' AS product, COUNT(*) AS total_requests
    FROM hygiene_data.hygiene_fall24
    WHERE deodorant LIKE '%deodorant%'

    UNION ALL

    SELECT 'Bladder Leakage' AS product, COUNT(*) AS total_requests
    FROM hygiene_data.hygiene_fall24
    WHERE feminine_hygiene LIKE '%bladder leakage%'

    UNION ALL

    SELECT 'Box of Pads' AS product, COUNT(*) AS total_requests
    FROM hygiene_data.hygiene_fall24
    WHERE feminine_hygiene LIKE '%box of pads%'

    UNION ALL

    SELECT 'Box of Tampons' AS product, COUNT(*) AS total_requests
    FROM hygiene_data.hygiene_fall24
    WHERE feminine_hygiene LIKE '%box of tampons%'

    UNION ALL

    SELECT 'External Condoms' AS product, COUNT(*) AS total_requests
    FROM hygiene_data.hygiene_fall24
    WHERE feminine_hygiene LIKE '%external condoms%'

    UNION ALL

    SELECT 'Panty Liners' AS product, COUNT(*) AS total_requests
    FROM hygiene_data.hygiene_fall24
    WHERE feminine_hygiene LIKE '%panty liners%'
) AS product_counts
ORDER BY total_requests DESC
LIMIT 1;
# Query for Co-Occurrence
WITH products AS (
  SELECT 'Toilet paper' AS product
  UNION ALL SELECT 'Laundry Detergent/Dryer Sheet'
  UNION ALL SELECT 'Dish-washing liquid'
  UNION ALL SELECT 'Socks'
  UNION ALL SELECT 'Tooth Paste'
  UNION ALL SELECT 'Shaving Cream & Razor'
  UNION ALL SELECT 'soap'
  UNION ALL SELECT 'Tooth Brush'
  UNION ALL SELECT 'chapstick'
  UNION ALL SELECT 'shampoo'
  UNION ALL SELECT 'conditioner'
  UNION ALL SELECT 'body wash'
  UNION ALL SELECT 'hand soap'
  UNION ALL SELECT 'hand sanitizer'
  UNION ALL SELECT 'lotion'
  UNION ALL SELECT 'face mask'
  UNION ALL SELECT 'face tissue'
  UNION ALL SELECT 'deodorant'
)
SELECT p1.product AS product1, p2.product AS product2, COUNT(*) AS pair_count
FROM products p1
JOIN products p2 ON p1.product < p2.product
JOIN hygiene_data.hygiene_fall24 h
  ON h.toilet_paper_laundry_dish_soap LIKE CONCAT('%', p1.product, '%')
  OR h.toothpaste_soap_chapstick LIKE CONCAT('%', p1.product, '%')
  OR h.shampoo LIKE CONCAT('%', p1.product, '%')
  OR h.body_wash LIKE CONCAT('%', p1.product, '%')
  OR h.hand_soap_hand_sanitizer_lotion LIKE CONCAT('%', p1.product, '%')
  OR h.deodorant LIKE CONCAT('%', p1.product, '%')
WHERE h.toilet_paper_laundry_dish_soap LIKE CONCAT('%', p2.product, '%')
  OR h.toothpaste_soap_chapstick LIKE CONCAT('%', p2.product, '%')
  OR h.shampoo LIKE CONCAT('%', p2.product, '%')
  OR h.body_wash LIKE CONCAT('%', p2.product, '%')
  OR h.hand_soap_hand_sanitizer_lotion LIKE CONCAT('%', p2.product, '%')
  OR h.deodorant LIKE CONCAT('%', p2.product, '%')
GROUP BY p1.product, p2.product
ORDER BY pair_count DESC;

# Product usage frequency by category
SELECT 
    student_id,
    CASE 
        WHEN toilet_paper_laundry_dish_soap LIKE '%Toilet paper%' THEN 'Cleaning & Laundry'
        WHEN toilet_paper_laundry_dish_soap LIKE '%Laundry Detergent%' OR toilet_paper_laundry_dish_soap LIKE '%Dryer Sheet%' THEN 'Cleaning & Laundry'
        WHEN toilet_paper_laundry_dish_soap LIKE '%Dish-washing liquid%' THEN 'Cleaning & Laundry'
        WHEN toothpaste_soap_chapstick LIKE '%Tooth Paste%' THEN 'Personal Care Products'
        WHEN toothpaste_soap_chapstick LIKE '%Shaving Cream & Razor%' THEN 'Personal Care Products'
        WHEN toothpaste_soap_chapstick LIKE '%soap%' THEN 'Personal Care Products'
        WHEN toothpaste_soap_chapstick LIKE '%Tooth Brush%' THEN 'Personal Care Products'
        WHEN toothpaste_soap_chapstick LIKE '%chapstick%' THEN 'Personal Care Products'
        WHEN deodorant LIKE '%deodorant%' THEN 'Personal Care Products'
        WHEN hand_soap_hand_sanitizer_lotion LIKE '%lotion%' THEN 'Personal Care Products'
        WHEN shampoo LIKE '%shampoo%' THEN 'Body & Hair Care'
        WHEN shampoo LIKE '%conditioner%' THEN 'Body & Hair Care'
        WHEN body_wash LIKE '%body wash%' THEN 'Body & Hair Care'
        WHEN hand_soap_hand_sanitizer_lotion LIKE '%hand soap%' THEN 'Health & Safety'
        WHEN hand_soap_hand_sanitizer_lotion LIKE '%hand sanitizer%' THEN 'Health & Safety'
        WHEN hand_soap_hand_sanitizer_lotion LIKE '%face mask%' THEN 'Health & Safety'
        WHEN hand_soap_hand_sanitizer_lotion LIKE '%face tissue%' THEN 'Health & Safety'
        WHEN feminine_hygiene LIKE '%bladder leakage%' THEN 'Health & Safety'
        WHEN feminine_hygiene LIKE '%box of pads%' THEN 'Feminine Hygiene Products'
        WHEN feminine_hygiene LIKE '%box of tampons%' THEN 'Feminine Hygiene Products'
        WHEN feminine_hygiene LIKE '%external condoms%' THEN 'Feminine Hygiene Products'
        WHEN feminine_hygiene LIKE '%panty liners%' THEN 'Feminine Hygiene Products'
        WHEN socks LIKE '%socks%' THEN 'Miscellaneous'
        ELSE 'Other'
    END AS product_category
FROM hygiene_data.hygiene_fall24;

# Metrics vs Value 
SELECT 'Total Students' AS metric, COUNT(student_id) AS value
FROM hygiene_data.hygiene_fall24
UNION ALL
SELECT 'Toilet Paper Count' AS metric, COUNT(*) AS value
FROM hygiene_data.hygiene_fall24
WHERE toilet_paper_laundry_dish_soap LIKE '%Toilet paper%'
UNION ALL
SELECT 'Laundry Detergent Count' AS metric, COUNT(*) AS value
FROM hygiene_data.hygiene_fall24
WHERE toilet_paper_laundry_dish_soap LIKE '%Laundry Detergent/Dryer Sheet%'
UNION ALL
SELECT 'Dish Soap Count' AS metric, COUNT(*) AS value
FROM hygiene_data.hygiene_fall24
WHERE toilet_paper_laundry_dish_soap LIKE '%Dish-washing liquid%'
UNION ALL
SELECT 'Socks Count' AS metric, COUNT(*) AS value
FROM hygiene_data.hygiene_fall24
WHERE socks LIKE '%socks%'
UNION ALL
SELECT 'Toothpaste Count' AS metric, COUNT(*) AS value
FROM hygiene_data.hygiene_fall24
WHERE toothpaste_soap_chapstick LIKE '%Tooth Paste%'
UNION ALL
SELECT 'Shaving Cream & Razor Count' AS metric, COUNT(*) AS value
FROM hygiene_data.hygiene_fall24
WHERE toothpaste_soap_chapstick LIKE '%Shaving Cream & Razor%'
UNION ALL
SELECT 'Soap Count' AS metric, COUNT(*) AS value
FROM hygiene_data.hygiene_fall24
WHERE toothpaste_soap_chapstick LIKE '%soap%'
UNION ALL
SELECT 'Toothbrush Count' AS metric, COUNT(*) AS value
FROM hygiene_data.hygiene_fall24
WHERE toothpaste_soap_chapstick LIKE '%Tooth Brush%'
UNION ALL
SELECT 'Chapstick Count' AS metric, COUNT(*) AS value
FROM hygiene_data.hygiene_fall24
WHERE toothpaste_soap_chapstick LIKE '%chapstick%'
UNION ALL
SELECT 'Shampoo Count' AS metric, COUNT(*) AS value
FROM hygiene_data.hygiene_fall24
WHERE shampoo LIKE '%shampoo%'
UNION ALL
SELECT 'Conditioner Count' AS metric, COUNT(*) AS value
FROM hygiene_data.hygiene_fall24
WHERE shampoo LIKE '%conditioner%'
UNION ALL
SELECT 'Body Wash Count' AS metric, COUNT(*) AS value
FROM hygiene_data.hygiene_fall24
WHERE body_wash LIKE '%body wash%'
UNION ALL
SELECT 'Hand Soap Count' AS metric, COUNT(*) AS value
FROM hygiene_data.hygiene_fall24
WHERE hand_soap_hand_sanitizer_lotion LIKE '%hand soap%'
UNION ALL
SELECT 'Hand Sanitizer Count' AS metric, COUNT(*) AS value
FROM hygiene_data.hygiene_fall24
WHERE hand_soap_hand_sanitizer_lotion LIKE '%hand sanitizer%'
UNION ALL
SELECT 'Lotion Count' AS metric, COUNT(*) AS value
FROM hygiene_data.hygiene_fall24
WHERE hand_soap_hand_sanitizer_lotion LIKE '%lotion%'
UNION ALL
SELECT 'Face Mask Count' AS metric, COUNT(*) AS value
FROM hygiene_data.hygiene_fall24
WHERE hand_soap_hand_sanitizer_lotion LIKE '%face mask%'
UNION ALL
SELECT 'Face Tissue Count' AS metric, COUNT(*) AS value
FROM hygiene_data.hygiene_fall24
WHERE hand_soap_hand_sanitizer_lotion LIKE '%face tissue%'
UNION ALL
SELECT 'Deodorant Count' AS metric, COUNT(*) AS value
FROM hygiene_data.hygiene_fall24
WHERE deodorant LIKE '%deodorant%';

# Splitting Products into Rows for Toilet Paper / Laundry / Dish soap
WITH RECURSIVE split AS (
    SELECT
        student_id,  -- Assuming there's a unique ID for each row
        SUBSTRING_INDEX(toilet_paper_laundry_dish_soap, ';', 1) AS product,
        SUBSTRING(toilet_paper_laundry_dish_soap, LENGTH(SUBSTRING_INDEX(toilet_paper_laundry_dish_soap, ';', 1)) + 2) AS remainder
    FROM
        hygiene_data.hygiene_fall24
    WHERE
        toilet_paper_laundry_dish_soap IS NOT NULL
    
    UNION ALL
    
    SELECT
        p.student_id,
        SUBSTRING_INDEX(p.remainder, ';', 1) AS product,
        SUBSTRING(p.remainder, LENGTH(SUBSTRING_INDEX(p.remainder, ';', 1)) + 2) AS remainder
    FROM
        split p
    WHERE
        p.remainder != ''
)
SELECT
    student_id, product
FROM
    split
ORDER BY
    student_id, product;
    
# Splitting Products into Rows for Hand soap Hand Sanitzier, Lotion
WITH RECURSIVE split AS (
    SELECT
        student_id,  -- Assuming there's a unique ID for each row
        SUBSTRING_INDEX(toilet_paper_laundry_dish_soap, ';', 1) AS product,
        SUBSTRING(toilet_paper_laundry_dish_soap, LENGTH(SUBSTRING_INDEX(toilet_paper_laundry_dish_soap, ';', 1)) + 2) AS remainder
    FROM
        hygiene_data.hygiene_fall24
    WHERE
        toilet_paper_laundry_dish_soap IS NOT NULL
    
    UNION ALL
    
    SELECT
        p.student_id,
        SUBSTRING_INDEX(p.remainder, ';', 1) AS product,
        SUBSTRING(p.remainder, LENGTH(SUBSTRING_INDEX(p.remainder, ';', 1)) + 2) AS remainder
    FROM
        split p
    WHERE
        p.remainder != ''
)
SELECT
    student_id, product
FROM
    split
ORDER BY
    student_id, product;











