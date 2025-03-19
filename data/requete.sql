-- un coach qui veut faire le listing de ses apprenants 

SELECT u.username, u.firstname, u.lastname,u.email, u.height, u.weight 
FROM `user` c 
JOIN coach_user cu ON cu.coach_id = c.id 
JOIN `user` u  ON cu.user_id = u.id
WHERE c.id = 3

