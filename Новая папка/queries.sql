INSERT INTO Category (id, name, sym_code)
    VALUES(1, 'Одежда', 'clothing'),
    (2, 'Ботинки', 'boots'),
    (3, 'Доски и лыжи', 'boards'),
    (4, 'Крепления', 'attachment'),
    (5, 'Инструменты', 'tools'),
    (6,'Разное', 'other');

INSERT INTO User (id, email, name, contact, password)
    VALUES (1, '1@gmail.com', 'Gleb', '89153451574','1'),
    (2, '2@gmail.com', 'Bob', '89113232644','2');

INSERT INTO Lot (id, name, description, picture, start_price, date_end, rate_step, creator_id, category_id)
    VALUES (1, '2014 Rossignol District', 'Сноуборд', 'img/lot-1.jpg', '10999', '2023-12-25', 100, 1, 3),
    (2, 'DC Ply Mens 2016/2017 Snowboard', 'Сноуборд', 'img/lot-2.jpg', '159999', '2023-12-15', 100, 2, 3),
    (3, 'Ботинки для сноуборда DC Mutiny Charoca', 'Ботинки', 'img/lot-4.jpg', '1099', '2023-11-25', 100, 1, 2),
    (4, 'Куртка для сноуборда DC Mutiny Charocal', 'Куртка', 'img/lot-5.jpg', '7500', '2023-12-20', 100, 2, 1),
    (5, 'Маска Oakley Canopy', 'Маска', 'img/lot-6.jpg', '5400', '2023-12-10', 100, 1, 5),
    (6, 'Ботинки для зимы', 'Ботинк', 'img/lot-4.jpg', '25999', '2023-09-12', 500, 2, 2),
    (7, 'Ботинки для осени', 'Ботин', 'img/lot-4.jpg', '8499', '2023-11-20', 100, 1, 2),
    (8, 'Ботинки для лета', 'Бот', 'img/lot-4.jpg', '1200', '2023-11-08', 50, 1, 2),
    (9, 'Ботинки для весны', 'Боти', 'img/lot-4.jpg', '7200', '2023-11-09', 250, 2, 2),
    (10, 'Ботинки для плаванья', 'Бо', 'img/lot-4.jpg', '100', '2023-11-22', 10, 2, 2),
    (11, 'Ботинки для прыжков', 'Б', 'img/lot-4.jpg', '4400', '2023-11-23', 300, 1, 2),
    (12, 'Ботинки для школы', 'Ауцацупцп', 'img/lot-4.jpg', '30999', '2023-11-24', 1000, 2, 2),
    (13, 'Ботинки', 'Дпкупуп', 'img/lot-4.jpg', '11000', '2023-11-25', 175, 1, 2);
    
INSERT INTO Bet( id, sum, lot_id, user_id)
    VALUES (1, 12000, 1, 2),
    (2, 1199, 3, 2),
    (3, 1200, 8, 1),
    (4, 7200, 9, 2),
    (5, 7450, 9, 1);
-- INSERT INTO Bet( id, sum, lot_id, user_id)
--     VALUES 
--     (6, 1299, 3, 3),
--     (7, 1250, 8, 3),
--     (8, 7700, 9, 3);

#Получить список всех категорий
SELECT id, name, sym_code FROM Category;

#получить cписок лотов, которые еще не истекли отсортированных по дате публикации, 
#от новых к старым. Каждый лот должен включать название,
#стартовую цену, ссылку на изображение, название категории и дату окончания торгов;
SELECT Lot.id,  Lot.name as name_lot, picture, start_price, date_end, Category.name FROM Lot
    INNER JOIN Category ON Lot.category_id = Category.id
    WHERE date_end >= CURRENT_DATE ORDER BY date_reg DESC;


#показать информацию о лоте по его ID. Вместо id категории должно выводиться  название категории, к которой принадлежит лот из таблицы категорий;
SELECT Lot.name, description, date_reg, picture, start_price, rate_step, date_end, Category.name FROM Lot
        INNER JOIN Category ON Lot.category_id = Category.id;

#обновить название лота по его идентификатору;
UPDATE Lot SET name = 'Новое имя' WHERE id = 1;

#получить список ставок для лота по его идентификатору с сортировкой по дате. 
#Список должен содержать дату и время размещения ставки, цену, 
#по которой пользователь готов приобрести лот, название лота и имя пользователя, сделавшего ставку
SELECT sum, Bet.date_reg, Lot.name, User.name FROM Bet
    INNER JOIN Lot ON Lot.id = Bet.lot_id
    INNER JOIN User ON User.id = Bet.user_id
    WHERE Bet.lot_id = 3 ORDER BY Bet.date_reg DESC;
