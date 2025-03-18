-- Script de seeding pour la base de données fitness
BEGIN;

-- Insertion des utilisateurs
INSERT INTO `user` (`username`, `password`, `firstname`, `lastname`, `email`, `height`, `weight`, `age`, `role`, `public`) VALUES
('johndoe', 'password123', 'John', 'Doe', 'john.doe@example.com', 180, 75, 30, 'user', TRUE),
('janedoe', 'password123', 'Jane', 'Doe', 'jane.doe@example.com', 165, 60, 28, 'user', TRUE),
('coachbob', 'coach123', 'Bob', 'Smith', 'coach.bob@example.com', 185, 82, 35, 'coach', TRUE),
('sarahfit', 'fit123', 'Sarah', 'Wilson', 'sarah.wilson@example.com', 172, 65, 29, 'user', FALSE),
('mikehealth', 'health123', 'Mike', 'Johnson', 'mike.j@example.com', 190, 90, 32, 'user', TRUE),
('lisastrong', 'strong123', 'Lisa', 'Brown', 'lisa.brown@example.com', 168, 62, 27, 'user', TRUE),
('davidrun', 'run123', 'David', 'Williams', 'david.w@example.com', 178, 73, 31, 'user', TRUE),
('amandayoga', 'yoga123', 'Amanda', 'Taylor', 'amanda.t@example.com', 170, 58, 26, 'coach', TRUE),
('thomasweight', 'weight123', 'Thomas', 'Anderson', 't.anderson@example.com', 182, 88, 33, 'user', FALSE),
('oliviazumba', 'zumba123', 'Olivia', 'Martin', 'olivia.m@example.com', 167, 59, 25, 'coach', TRUE);

-- Insertion des équipes
INSERT INTO `team` (`name`) VALUES
('Runners Club'),
('Weight Lifters'),
('Yoga Enthusiasts'),
('Nutrition First'),
('Cardio Kings');

-- Association des utilisateurs aux équipes
INSERT INTO `team_user` (`user_id`, `team_id`) VALUES
(1, 1), -- John est dans Runners Club
(2, 3), -- Jane est dans Yoga Enthusiasts
(3, 2), -- Bob est dans Weight Lifters
(4, 4), -- Sarah est dans Nutrition First
(5, 2), -- Mike est dans Weight Lifters
(6, 5), -- Lisa est dans Cardio Kings
(7, 1), -- David est dans Runners Club
(8, 3), -- Amanda est dans Yoga Enthusiasts
(9, 2), -- Thomas est dans Weight Lifters
(10, 5), -- Olivia est dans Cardio Kings
(1, 5), -- John est aussi dans Cardio Kings
(2, 4), -- Jane est aussi dans Nutrition First
(3, 4), -- Bob est aussi dans Nutrition First
(7, 5); -- David est aussi dans Cardio Kings

-- Messages d'équipe
INSERT INTO `team_user_message` (`message`, `user_id`, `team_id`) VALUES
('Qui veut courir ce week-end?', 1, 1),
('Je pense augmenter mes poids cette semaine', 3, 2),
('Nouveau cours de yoga dimanche à 10h', 8, 3),
('J\'ai trouvé une super recette protéinée', 4, 4),
('Séance HIIT intense ce soir à 18h', 6, 5),
('Quelqu\'un connaît un bon magasin de running?', 7, 1),
('Besoin de conseils pour mes squats', 5, 2),
('Méditation après le yoga demain', 2, 3),
('Article intéressant sur les oméga-3', 3, 4),
('Qui veut faire un défi burpees?', 10, 5),
('Je viens de battre mon record personnel!', 1, 1),
('Nouveau programme d\'entraînement disponible', 3, 2),
('Respirez profondément et relâchez le stress', 8, 3),
('N\'oubliez pas de boire beaucoup d\'eau', 2, 4),
('Challenge cardio de 30 jours commence lundi', 6, 5);

-- Insertion des jours (pour chaque utilisateur, 5 jours)
-- Pour l'utilisateur 1 (John)
INSERT INTO `day` (`date`, `user_id`) VALUES
('2025-03-10', 1),
('2025-03-11', 1),
('2025-03-12', 1),
('2025-03-13', 1),
('2025-03-14', 1);

-- Pour l'utilisateur 2 (Jane)
INSERT INTO `day` (`date`, `user_id`) VALUES
('2025-03-10', 2),
('2025-03-11', 2),
('2025-03-12', 2),
('2025-03-13', 2),
('2025-03-14', 2);

-- Pour l'utilisateur 3 (Bob)
INSERT INTO `day` (`date`, `user_id`) VALUES
('2025-03-10', 3),
('2025-03-11', 3),
('2025-03-12', 3),
('2025-03-13', 3),
('2025-03-14', 3);

-- Pour l'utilisateur 4 (Sarah)
INSERT INTO `day` (`date`, `user_id`) VALUES
('2025-03-10', 4),
('2025-03-11', 4),
('2025-03-12', 4),
('2025-03-13', 4),
('2025-03-14', 4);

-- Pour l'utilisateur 5 (Mike)
INSERT INTO `day` (`date`, `user_id`) VALUES
('2025-03-10', 5),
('2025-03-11', 5),
('2025-03-12', 5),
('2025-03-13', 5),
('2025-03-14', 5);

-- Insertion des repas
INSERT INTO `meal` (`name`) VALUES
('Petit-déjeuner'),
('Déjeuner'),
('Dîner'),
('Collation du matin'),
('Collation de l\'après-midi'),
('Pré-entraînement'),
('Post-entraînement'),
('Brunch');

-- Association jours-repas (pour chaque jour, plusieurs repas)
-- Pour l'utilisateur 1 (John) - jour 1
INSERT INTO `day_meal` (`day_id`, `meal_id`) VALUES
(1, 1), -- Petit-déjeuner
(1, 2), -- Déjeuner
(1, 3); -- Dîner

-- Pour l'utilisateur 1 (John) - jour 2
INSERT INTO `day_meal` (`day_id`, `meal_id`) VALUES
(2, 1), -- Petit-déjeuner
(2, 2), -- Déjeuner
(2, 5), -- Collation de l'après-midi
(2, 3); -- Dîner

-- Pour l'utilisateur 2 (Jane) - jour 6
INSERT INTO `day_meal` (`day_id`, `meal_id`) VALUES
(6, 1), -- Petit-déjeuner
(6, 4), -- Collation du matin
(6, 2), -- Déjeuner
(6, 3); -- Dîner

-- Pour l'utilisateur 3 (Bob) - jour 11
INSERT INTO `day_meal` (`day_id`, `meal_id`) VALUES
(11, 6), -- Pré-entraînement
(11, 2), -- Déjeuner
(11, 7), -- Post-entraînement
(11, 3); -- Dîner

-- Insertion des aliments
INSERT INTO `food` (`name`, `calories`, `protein`, `carbs`, `fat`) VALUES
('Œufs brouillés', 140, 12, 1, 10),
('Pain complet', 80, 4, 15, 1),
('Avocat', 160, 2, 9, 15),
('Poulet grillé', 165, 31, 0, 3),
('Riz brun', 112, 2, 24, 1),
('Brocoli', 55, 4, 11, 0),
('Saumon', 206, 22, 0, 13),
('Patate douce', 86, 2, 20, 0),
('Épinards', 23, 3, 4, 0),
('Yaourt grec', 100, 10, 4, 5),
('Banane', 105, 1, 27, 0),
('Amandes', 161, 6, 6, 14),
('Thon en conserve', 116, 25, 0, 1),
('Quinoa', 120, 4, 21, 2),
('Lentilles', 116, 9, 20, 0),
('Pomme', 95, 0, 25, 0),
('Fromage cottage', 98, 11, 3, 4),
('Dinde', 125, 26, 0, 1),
('Riz de chou-fleur', 25, 2, 5, 0),
('Protéine en poudre', 120, 24, 3, 1),
('Lait d\'amande', 30, 1, 1, 2),
('Fraises', 49, 1, 12, 0),
('Tofu', 94, 10, 2, 6),
('Chocolat noir (70%)', 170, 2, 13, 12),
('Huile d\'olive', 119, 0, 0, 14);

-- Association repas-aliments
-- Petit-déjeuner de John (jour 1)
INSERT INTO `food_meal` (`meal_id`, `food_id`, `quantity`) VALUES
(1, 1, 2), -- 2 portions d'œufs brouillés
(1, 2, 1), -- 1 portion de pain complet
(1, 3, 1); -- 1 avocat

-- Déjeuner de John (jour 1)
INSERT INTO `food_meal` (`meal_id`, `food_id`, `quantity`) VALUES
(2, 4, 1), -- 1 portion de poulet grillé
(2, 5, 1), -- 1 portion de riz brun
(2, 6, 2); -- 2 portions de brocoli

-- Dîner de John (jour 1)
INSERT INTO `food_meal` (`meal_id`, `food_id`, `quantity`) VALUES
(3, 7, 1), -- 1 portion de saumon
(3, 8, 1), -- 1 portion de patate douce
(3, 9, 2); -- 2 portions d'épinards

-- Petit-déjeuner de John (jour 2)
INSERT INTO `food_meal` (`meal_id`, `food_id`, `quantity`) VALUES
(1, 10, 1), -- 1 portion de yaourt grec
(1, 11, 1), -- 1 banane
(1, 12, 1); -- 1 portion d'amandes

-- Collation de Jane (jour 6)
INSERT INTO `food_meal` (`meal_id`, `food_id`, `quantity`) VALUES
(4, 16, 1), -- 1 pomme
(4, 12, 1); -- 1 portion d'amandes

-- Pré-entraînement de Bob (jour 11)
INSERT INTO `food_meal` (`meal_id`, `food_id`, `quantity`) VALUES
(6, 11, 1), -- 1 banane
(6, 20, 1); -- 1 portion de protéine en poudre

-- Insertion des sessions
INSERT INTO `session` (`name`, `day_id`) VALUES
('Course matinale', 1), -- John jour 1
('Musculation', 2), -- John jour 2
('Yoga', 6), -- Jane jour 1
('HIIT', 11), -- Bob jour 1
('Natation', 16), -- Sarah jour 1
('Musculation jambes', 21); -- Mike jour 1

-- Insertion des exercices
INSERT INTO `exercise` (`name`, `calories`) VALUES
('Course à pied', 700),
('Squats', 150),
('Pompes', 100),
('Burpees', 250),
('Planche', 80),
('Deadlift', 200),
('Press banche', 180),
('Développé épaules', 160),
('Rowing', 600),
('Vélo elliptique', 500),
('Marche rapide', 350),
('Kettlebell swing', 250),
('Tractions', 120),
('Hip thrust', 150),
('Mountain climbers', 200),
('Box jumps', 280),
('Fentes avant', 140),
('Battle ropes', 310),
('Gainage latéral', 90),
('Saut à la corde', 600);

-- Association session-exercices
-- Course matinale de John
INSERT INTO `exercise_session` (`session_id`, `exercise_id`) VALUES
(1, 1), -- Course à pied
(1, 11); -- Marche rapide

-- Musculation de John
INSERT INTO `exercise_session` (`session_id`, `exercise_id`) VALUES
(2, 2), -- Squats
(2, 3), -- Pompes
(2, 6), -- Deadlift
(2, 7); -- Press banche

-- Yoga de Jane
INSERT INTO `exercise_session` (`session_id`, `exercise_id`) VALUES
(3, 5), -- Planche
(3, 19); -- Gainage latéral

-- HIIT de Bob
INSERT INTO `exercise_session` (`session_id`, `exercise_id`) VALUES
(4, 4), -- Burpees
(4, 15), -- Mountain climbers
(4, 16), -- Box jumps
(4, 20); -- Saut à la corde

-- Insertion des médias
INSERT INTO `media` (`name`, `url`) VALUES
('Poulet grillé', 'https://example.com/images/grilled-chicken.jpg'),
('Exercice squat', 'https://example.com/images/squat-form.jpg'),
('Profil de John', 'https://example.com/profiles/john-doe.jpg'),
('Exercice planche', 'https://example.com/images/plank-exercise.jpg'),
('Saumon grillé', 'https://example.com/images/grilled-salmon.jpg'),
('Profil de Jane', 'https://example.com/profiles/jane-doe.jpg'),
('Deadlift technique', 'https://example.com/images/deadlift-form.jpg'),
('Recette smoothie', 'https://example.com/images/protein-smoothie.jpg'),
('Course à pied', 'https://example.com/images/running-technique.jpg'),
('Profil de Bob', 'https://example.com/profiles/coach-bob.jpg');

-- Association médias-aliments
INSERT INTO `food_media` (`food_id`, `media_id`) VALUES
(4, 1), -- Image du poulet grillé
(7, 5); -- Image du saumon grillé

-- Association médias-exercices
INSERT INTO `exercise_media` (`exercise_id`, `media_id`) VALUES
(2, 2), -- Image du squat
(5, 4), -- Image de la planche
(6, 7), -- Image du deadlift
(1, 9); -- Image de la course à pied

-- Association médias-utilisateurs
INSERT INTO `media_user` (`user_id`, `media_id`) VALUES
(1, 3), -- Photo de profil de John
(2, 6), -- Photo de profil de Jane
(3, 10); -- Photo de profil de Bob

COMMIT;