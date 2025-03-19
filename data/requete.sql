-- un coach qui veut faire le listing de ses apprenants 

SELECT u.username, u.firstname, u.lastname,u.email, u.height, u.weight 
FROM `user` c 
JOIN coach_user cu ON cu.coach_id = c.id 
JOIN `user` u  ON cu.user_id = u.id
WHERE c.id = 3

-- Avoir le total de nos apport nutritionnel sur un repas 

SELECT m.id,m.name, SUM(f.calories * fm.quantity_g) AS calories_meal , SUM(f.protein * fm.quantity_g) AS protein_meal, SUM(f.fat * fm.quantity_g) AS fat_meal,
 SUM(f.carbs * fm.quantity_g) AS carbs_meal
FROM `meal` m
JOIN food_meal fm ON m.id = fm.meal_id
JOIN food f ON f.id = fm.food_id
WHERE m.id = 2
GROUP BY m.id

-- Avoir le total de nos apport nutriotionnel sur une journée 

SELECT d.id,d.date, SUM(f.calories * fm.quantity_g) AS calories_meal , SUM(f.protein * fm.quantity_g) AS protein_meal, SUM(f.fat * fm.quantity_g) AS fat_meal,
 SUM(f.carbs * fm.quantity_g) AS carbs_meal
FROM `day` d 
JOIN day_meal dm ON d.id = dm.day_id
JOIN `meal` m ON dm.meal_id = m.id
JOIN food_meal fm ON m.id = fm.meal_id
JOIN food f ON f.id = fm.food_id
WHERE d.id = 2
GROUP BY d.id