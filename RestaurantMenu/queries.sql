SELECT
    restaurant.name,
    address.street_number,
    address.street_name,
    restaurant.telephone
FROM
    restaurant,
    address
WHERE
    restaurant.id = address.restaurant_id;

-- Best rating 
SELECT
    MAX(review.rating) AS best_rating
FROM
    review;

-- Dishes
SELECT
    dish.name AS dish_name,
    categories_dishes.price,
    category.name AS category
FROM
    categories_dishes,
    dish,
    category
WHERE
    dish.id = categories_dishes.dish_id
    AND category.id = categories_dishes.category_id
ORDER BY
    1;

-- Categories
SELECT
    category.name AS category,
    dish.name AS dish_name,
    categories_dishes.price AS price
FROM
    category,
    categories_dishes,
    dish
WHERE
    dish.id = categories_dishes.dish_id
    AND category.id = categories_dishes.category_id
ORDER BY
    1;