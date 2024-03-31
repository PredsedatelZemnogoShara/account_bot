create table users(
    user_id integer,
    current_role_id integer,
    name text,
    UNIQUE (user_id)
);


create table money(
    user_name varchar(40),
    amount float,
    UNIQUE (user_name)
);


create table categories(
    category varchar(80),
    type varchar(40),
    UNIQUE (category, type));


create table category_links(
    target varchar(40),
    category varchar(80),
    --UNIQUE (target, category),
    FOREIGN KEY(category) REFERENCES categories(category)
);


--create table product_aliases(
--    product_name varchar(80),
--    alias varchar(120),
--    UNIQUE (product_name, alias),
--    FOREIGN KEY(product_name) REFERENCES categories(product_name)
--);


create table products(
    id integer primary key,
    name varchar(80),
    measurement_unit varchar(3)
);


create table messages(
    user_id integer,
    created datetime,
    message text,
    FOREIGN KEY(user_id) REFERENCES users(user_id)
);


create table actions(
    action_id integer primary key,
    user_id integer,
    action_type varchar(40),
    comment varchar(500),
    created datetime,
    FOREIGN KEY(user_id) REFERENCES users(user_id)
);


create table expense(
    id integer primary key,
    amount integer,
    category varchar(40),
    action_id integer,
    FOREIGN KEY(category) REFERENCES categories(category),
    FOREIGN KEY(action_id) REFERENCES action_id(action_id)
);


create table product_changes(
    product_id integer primary key,
    quantity float,
    action_id integer,
    FOREIGN KEY(product_id) REFERENCES product(id),
    FOREIGN KEY(action_id) REFERENCES action_id(action_id)
);


INSERT INTO products (name, measurement_unit)
VALUES
('лосось филе', 'кг'),
('лосось целый', 'кг'),
('угорь', 'кг'),
('креветки', 'кг'),
('тунец', 'кг'),
('тобико', 'кг'),
('Кольца кальмара', 'г'),
('Луковые кольца', 'г'),
('Курица', 'кг'),
('Яйца', 'шт'),
('Краб палочки', 'кг'),
('Кукуруза консервированная', 'г'),
('Сыр мягкий', 'кг'),
('Сыр твердый', 'кг'),
('авокадо', 'кг'),
('помидоры', 'кг'),
('Помидоры черри', 'г'),
('морковь', 'кг'),
('листья салата', 'г'),
('огурцы', 'кг'),
('Лук листья', 'г'),
('лук головки', 'кг'),
('чеснок', 'г'),
('Имбирь корень', 'г'),
('Перец любой', 'г'),
('Кабачок', 'г'),
('Манго', 'г'),
('Апельсин', 'кг'),
('Лайм', 'г'),
('Лимон', 'г'),
('Хлеб', 'г'),
('Рис', 'кг'),
('Нори', 'шт'),
('Панко', 'кг'),
('Васаби порошок', 'г'),
('Васаби паста', 'шт'),
('Имбирь маринованный', 'кг'),
('Кунжут', 'г'),
('Удон', 'кг'),
('Стеклянная лапша', 'шт'),
('Кимчи', 'л'),
('Соевый соус', 'л'),
('Терияки', 'л'),
('Унаги', 'л'),
('Масло фритюрное', 'л'),
('Уксус', 'мл'),
('Сливки', 'мл'),
('Пельмени', 'кг'),
('Булгур', 'кг'),
('Гречка', 'кг'),
('Макароны', 'кг'),
('Сосиски', 'кг'),
('Сметана', 'г'),
('Соль', 'г'),
('Сахар', 'г'),
('Кофе в пакетиках', 'шт'),
('Кофе', 'г'),
('Контейнер для сетов', 'шт'),
('Контейнер под теплые', 'шт'),
('Контейнер пивная тар', 'шт'),
('Контейнер 2 ролл', 'шт'),
('Контейнер 1 ролл', 'шт'),
('Контейнер такояши', 'шт'),
('Контейнер для вока большой', 'шт'),
('Контейнер для вока маленький', 'шт'),
('Контейнер для супа', 'шт'),
('Контейнер для поке', 'шт'),
('Контейнер Имбирь', 'шт'),
('Контейнер васаби', 'шт'),
('Контейнер Соевый соус', 'шт'),
('Стаканы', 'шт'),
('Палочки', 'шт'),
('Салфетки', 'шт'),
('Мусорные мешки', 'шт'),
('Бумажные полотенца', 'шт'),
('Трубочки', 'шт'),
('Перчатки белые', 'шт'),
('Перчатки черные', 'шт'),
('Пакеты с собой большие', 'шт'),
('Пакеты с собой маленькие', 'шт'),
('Тряпки', 'шт'),
('Вода', 'шт'),
('Кола', 'шт'),
('Спрайт', 'шт'),
('Тоник', 'шт'),
('Энергетик', 'шт'),
('Guinness', 'шт'),
('Kayaki', 'шт'),
('Шампанское', 'л'),
('Ягер', 'л'),
('Мартини Бьянко', 'л'),
('Мартини Россо', 'л'),
('Апероль', 'л'),
('Текила', 'л'),
('Водка', 'л'),
('Ром белый', 'л'),
('Ром темный', 'л'),
('Джин', 'л'),
('Виски', 'л'),
('перец молотый', 'г'),
('Чай', 'г'),
('Чай в пакетиках', 'шт'),
('масло подсолнечное', 'л'),
('майонез', 'г'),
('Мука', 'кг'),
('Лаваш', 'г'),
('Мацони', 'г'),
('Кетчуп', 'г'),
('Печенье', 'г'),
('Куриные ножки', 'кг'),
('Уксус обычный', 'мл'),
('Устричный соус', 'мл'),
('Масло сливочное', 'г'),
('Курица целая', 'кг'),
('Молоко', 'л'),
('экономка', 'шт'),
('ведро', 'шт'),
('Скрепки', 'шт'),
('Наклейки панда', 'шт'),
('шампиньоны', 'г'),
('брокколи', 'г'),
('картофель', 'кг'),
('шрирача', 'мл'),
('кинза', 'г'),
('Зелень', 'г'),
('Овсянка', 'г'),
('Колбаса', 'г'),
('Томатная паста', 'г'),
('Цветная капуста', 'кг'),
('бобы', 'г'),
('Контейнер пищевой средний', 'шт'),
('Контейнер пищевой маленький', 'шт'),
('Контейнер пищевой большой', 'шт'),
('сушилка для салата', 'шт'),
('нож', 'шт'),
('зажигалка', 'шт'),
('Разделочная доска', 'шт'),
('Тёрка', 'шт'),
('Металлическая губка', 'шт'),
('шпажки', 'шт'),
('стрейч пленка', 'м'),
('пергамент', 'м'),
('весы', 'шт'),
('губки', 'шт'),
('Полотенце тряпичное', 'шт'),
('Влажные салфетки', 'шт'),
('маркер', 'шт'),
('линейка', 'шт'),
('Крышки соевый соус', 'шт'),
('Чековая лента', 'шт'),
('Стикеры', 'шт'),
('шуманит', 'мл'),
('доместос', 'л'),
('фольга', 'шт'),
('сода', 'г'),
('Фейри', 'мл'),
('мыло жидкое', 'мл'),
('Средство для чистки фритюра', 'г'),
('Очиститель для слива', 'мл'),
('jameson', 'л'),
--('ликер Batldedecoco', 'л'),
('водка финляндия', 'л'),
('Специи для глинтвейна', 'г'),
('Швабра', 'шт'),
('Гирлянда', 'шт'),
('Кедровые орехи', 'г');


--INSERT INTO category_links (category, target)
--VALUES
----Первый уровень
--('Кухня', 'Мясо и рыба'),
--('Кухня', 'Овощи и фрукты'),
--('Кухня', 'Рассыпчатое или мягкое'),
--('Кухня', 'Жидкости'),
--('Кухня', 'Японское'),
--('Кухня', 'Контейнеры'),
--('Кухня', 'Расходники'),
--('Стафф', "Мясо (с)"),
--('Стафф', "Овощи (с)"),
--('Стафф', "Первое (с)"),
--('Стафф', "Рассыпчатое (с)"),
--('Стафф', "Приправы (с)"),
--('Стафф', "Чай-десерт-вода (с)"),
--('Бар', 'Расходники (б)'),
--('Бар', 'Напитки'),
--('Бар', 'Алкоголь'),
--('Алкоголь', 'Крепкое')
--('Бар', 'Барные ингридиенты'),
--('Хозтовары', 'Частые хозтовары'),
--('Хозтовары', 'Редкие хозтовары'),
--
--
--('Средство для чистки фритюра', 'г'),
--('Очиститель для слива', 'мл'),
--('jameson', 'л'),
--('водка финляндия', 'л'),
--('Специи для глинтвейна', 'г'),
--('Швабра', 'шт'),
--('Гирлянда', 'шт'),
--('Кедровые орехи', 'г');


INSERT INTO category_links (category, target)
VALUES
('Кухня', 'Мясо и рыба'),
("Мясо и рыба", 'лосось филе'),
("Мясо и рыба", 'лосось целый'),
("Мясо и рыба", 'угорь'),
("Мясо и рыба", 'тунец'),
("Мясо и рыба", 'Краб палочки'),
("Мясо и рыба", 'креветки'),
("Мясо и рыба", 'тобико'),
("Мясо и рыба", 'Курица'),
("Мясо и рыба", 'Краб палочки'),

('Кухня', 'Овощи и фрукты'),
('Овощи и фрукты', 'Кукуруза консервированная'),
("Овощи и фрукты", 'авокадо'),
("Овощи и фрукты", 'помидоры'),
("Овощи и фрукты", 'Помидоры черри'),
("Овощи и фрукты", 'листья салата'),
("Овощи и фрукты", 'огурцы'),
("Овощи и фрукты", 'Имбирь корень'),
("Овощи и фрукты", 'Манго'),
("Овощи и фрукты", 'бобы'),
("Овощи и фрукты", 'морковь'),
("Овощи и фрукты", 'Лук листья'),
("Овощи и фрукты", 'лук головки'),
("Овощи и фрукты", 'чеснок'),
("Овощи и фрукты", 'Перец любой'),
("Овощи и фрукты", 'Кабачок'),
("Овощи и фрукты", 'шампиньоны'),
("Овощи и фрукты", 'брокколи'),
("Овощи и фрукты", 'картофель'),
("Овощи и фрукты", 'кинза'),
("Овощи и фрукты", 'Зелень'),
("Овощи и фрукты", 'Цветная капуста'),

('Кухня', 'Рассыпчатое или мягкое'),
('Рассыпчатое или мягкое', 'Сыр мягкий'),
('Рассыпчатое или мягкое', 'Сыр твердый'),
("Рассыпчатое или мягкое", 'Рис'),
('Рассыпчатое или мягкое', 'Мука'),
('Рассыпчатое или мягкое', 'Панко'),
('Рассыпчатое или мягкое', 'Васаби порошок'),
('Рассыпчатое или мягкое', 'Васаби паста'),
('Рассыпчатое или мягкое', 'Кунжут'),
('Рассыпчатое или мягкое', 'Соль'),
('Рассыпчатое или мягкое', 'Сахар'),

('Кухня', 'Жареное'),
('Жареное', 'Кольца кальмара'),
('Жареное', 'Луковые кольца'),
('Жареное', 'Хлеб'),

('Кухня', 'Жидкости'),
('Жидкости', 'шрирача'),
("Жидкости", 'Кимчи'),
("Жидкости", 'Соевый соус'),
("Жидкости", 'Терияки'),
("Жидкости", 'Унаги'),
("Жидкости", 'Масло фритюрное'),
("Жидкости", 'Уксус'),
('Жидкости', 'Сливки'),
("Жидкости", 'Устричный соус'),

('Кухня', 'Японское'),
('Японское', 'Нори'),
("Японское", 'Имбирь маринованный'),
("Японское", 'Удон'),
("Японское", 'Стеклянная лапша'),

('Кухня', 'Контейнеры'),
('Контейнеры', 'Контейнер для сетов'),
('Контейнеры', 'Контейнер под теплые'),
('Контейнеры', 'Контейнер пивная тар'),
('Контейнеры', 'Контейнер 2 ролл'),
('Контейнеры', 'Контейнер 1 ролл'),
('Контейнеры', 'Контейнер такояши'),
('Контейнеры', 'Контейнер для вока большой'),
('Контейнеры', 'Контейнер для вока маленький'),
('Контейнеры', 'Контейнер для супа'),
('Контейнеры', 'Контейнер для поке'),
('Контейнеры', 'Контейнер Имбирь'),
('Контейнеры', 'Контейнер васаби'),
('Контейнеры', 'Контейнер пищевой маленький'),
('Контейнеры', 'Контейнер пищевой средний'),
('Контейнеры', 'Контейнер Соевый соус'),
('Контейнеры', 'Контейнер пищевой большой'),
('Контейнеры', 'Крышки соевый соус'),

('Кухня', 'Расходники'),
('Расходники', 'Пакеты с собой большие'),
('Расходники', 'Пакеты с собой маленькие'),
('Расходники', 'Палочки'),
('Расходники', 'Салфетки'),


('Стафф', "Мясо (с)"),
('Мясо (с)', 'Яйца'),
("Мясо (с)", 'Пельмени'),
("Мясо (с)", 'Сосиски'),
('Мясо (с)', 'Колбаса'),
('Мясо (с)', 'Куриные ножки'),
('Мясо (с)', 'Курица целая'),

('Стафф', "Рассыпчатое (с)"),
("Рассыпчатое (с)", 'Булгур'),
("Рассыпчатое (с)", 'Гречка'),
("Рассыпчатое (с)", 'Макароны'),
('Рассыпчатое (с)', 'Овсянка'),
('Рассыпчатое (с)', 'Мука'),


('Стафф', "Хлеб (с)"),
('Хлеб (с)', 'Лаваш'),
("Хлеб (с)", 'Хлеб'),


('Стафф', "Приправы (с)"),
('Приправы (с)', 'Томатная паста'),
("Приправы (с)", 'Сметана'),
('Приправы (с)', 'майонез'),
('Приправы (с)', 'Мацони'),
('Приправы (с)', 'Кетчуп'),
("Приправы (с)", 'Соль'),
("Приправы (с)", 'Сахар'),
("Приправы (с)", 'Кофе'),
("Приправы (с)", 'Кофе в пакетиках'),
('Приправы (с)', 'перец молотый'),
('Приправы (с)', 'Масло сливочное'),


('Стафф', "Жидкости (с)"),
('Жидкости (с)', 'Уксус обычный'),
('Жидкости (с)', 'масло подсолнечное'),
('Жидкости (с)', 'Молоко'),


('Стафф', "Чай-десерт-вода (с)"),
('Чай-десерт-вода (с)', 'Печенье'),
('Чай-десерт-вода (с)', 'Чай'),
('Чай-десерт-вода (с)', 'Чай в пакетиках'),

('Бар', 'Барные ингридиенты'),
('Барные ингридиенты', 'Апельсин'),
('Барные ингридиенты', 'Лайм'),
('Барные ингридиенты', 'Лимон'),
('Барные ингридиенты', 'Сливки'),

('Бар', 'Расходники (б)'),
('Расходники (б)', 'Трубочки'),
('Расходники (б)', 'маркер'),
('Расходники (б)', 'Чековая лента'),
('Расходники (б)', 'Стикеры'),

('Бар', 'Напитки (б)'),
('Напитки (б)', 'Вода'),
('Напитки (б)', 'Кола'),
('Напитки (б)', 'Спрайт'),
('Напитки (б)', 'Тоник'),
('Напитки (б)', 'Энергетик'),


('Бар', 'Алкоголь'),
('Алкоголь', 'Легкое (б)'),
('Легкое (б)', 'Guinness'),
('Легкое (б)', 'Kayaki'),
('Легкое (б)', 'Шампанское'),
('Легкое (б)', 'Мартини Бьянко'),
('Легкое (б)', 'Мартини Россо'),
--('Легкое (б)', 'ликер Batldedecoco'),
('Легкое (б)', 'Апероль'),
--
('Алкоголь', 'Крепкое (б)'),
('Крепкое (б)', 'Ягер'),
('Крепкое (б)', 'Текила'),
('Крепкое (б)', 'Водка'),
('Крепкое (б)', 'Ром белый'),
('Крепкое (б)', 'Ром темный'),
('Крепкое (б)', 'Джин'),
('Крепкое (б)', 'jameson'),
('Крепкое (б)', 'Виски'),
('Барные ингридиенты (б)', 'Специи для глинтвейна'),
('Барные ингридиенты (б)', 'Молоко'),

('Хозтовары', 'Частые хозтовары'),
('Частые хозтовары', 'Перчатки белые'),
('Частые хозтовары', 'Перчатки черные'),
('Частые хозтовары', 'Бумажные полотенца'),
('Частые хозтовары', 'Мусорные мешки'),
('Частые хозтовары', 'Наклейки панда'),
('Частые хозтовары', 'шпажки'),
('Частые хозтовары', 'стрейч пленка'),
('Частые хозтовары', 'фольга'),
('Частые хозтовары', 'Скрепки'),
('Частые хозтовары', 'пергамент'),

('Хозтовары', 'Редкие хозтовары'),
('Редкие хозтовары', 'Стаканы'),
('Редкие хозтовары', 'Тряпки'),
('Редкие хозтовары', 'экономка'),
('Редкие хозтовары', 'ведро'),
('Редкие хозтовары', 'Швабра'),
('Редкие хозтовары', 'сушилка для салата'),
('Редкие хозтовары', 'нож'),
('Редкие хозтовары', 'зажигалка'),
('Редкие хозтовары', 'Разделочная доска'),
('Редкие хозтовары', 'Тёрка'),
('Редкие хозтовары', 'весы'),
('Редкие хозтовары', 'Полотенце тряпичное'),
('Редкие хозтовары', 'Влажные салфетки'),
('Редкие хозтовары', 'линейка'),

('Хозтовары', 'Редчайшее'),
('Редчайшее', 'Гирлянда'),

('Хозтовары', 'Моющие средства и приборы'),
('Моющие средства и приборы', 'Металлическая губка'),
('Моющие средства и приборы', 'губки'),
('Моющие средства и приборы', 'шуманит'),
('Моющие средства и приборы', 'доместос'),
('Моющие средства и приборы', 'сода'),
('Моющие средства и приборы', 'Фейри'),
('Моющие средства и приборы', 'мыло жидкое'),
('Моющие средства и приборы', 'Средство для чистки фритюра'),
('Моющие средства и приборы', 'Очиститель для слива'),



--Для трат:
('Машина', 'Бензин'),
('Машина', 'Ремонт'),
('Машина', 'Остальное'),

("Мириан", "Личное"),
("Мириан", "Еда Мириан"),

("Основное", "Фрукты и Овощи"),
("Основное", "Рыба и Мясо"),
("Основное", "Нори, рис, уксусы, масло, соусы и тд"),
("Основное", "Расходники (пакеты, палочки, перчатки, ручки ...)"),
("Основное", "Моющие средства"),
("Основное", "Стафф еда"),

("Ресторан", "Стройматериалы"),
("Ресторан", "Посуда"),
("Ресторан", "Мебель"),
("Ресторан", "Хозтовары на кухню или бар");

INSERT INTO categories
VALUES
('Кухня', "product_category"),
('Мясо и рыба', "product_category"),
('Овощи и фрукты', "product_category"),
('Рассыпчатое или мягкое', "product_category"),
('Жидкости', "product_category"),
('Японское', "product_category"),
('Контейнеры', "product_category"),
('Расходники', "product_category"),
('Стафф', "product_category"),
('Мясо (с)', "product_category"),
('Первое (с)', "product_category"),
('Рассыпчатое (с)', "product_category"),
('Хлеб (с)', "product_category"),
('Приправы (с)', "product_category"),
('Жидкости (с)', "product_category"),
('Чай-десерт-вода (с)', "product_category"),
('Бар', "product_category"),
('Барные ингридиенты', "product_category"),
('Расходники (б)', "product_category"),
('Напитки (б)', "product_category"),
('Алкоголь', "product_category"),
('Легкое (б)', "product_category"),
('Крепкое (б)', "product_category"),
('Хозтовары', "product_category"),
('Частые хозтовары', "product_category"),
('Редкие хозтовары', "product_category"),
('Редчайшее', "product_category"),
('Моющие средства и приборы', "product_category"),
('Жареное', "product_category"),

('Кухня', "product_category_cook"),
('Мясо и рыба', "product_category_cook"),
('Овощи и фрукты', "product_category_cook"),
('Рассыпчатое или мягкое', "product_category_cook"),
('Жидкости', "product_category_cook"),
('Японское', "product_category_cook"),
('Стафф', "product_category_cook"),
('Мясо (с)', "product_category_cook"),
('Овощи (с)', "product_category_cook"),
('Первое (с)', "product_category_cook"),
('Рассыпчатое (с)', "product_category_cook"),
('Приправы (с)', "product_category_cook"),
('Хозтовары', "product_category_cook"),
('Частые хозтовары', "product_category_cook"),
('Моющие средства и приборы', "product_category_cook"),
--('Бар', "product_category"),
--('Контейнеры', "product_category"),
--('Хозтовары', "product_category"),
--('Стафф', "product_category"),
--('Другое', "product_category"),
('Машина', "expenses_category"),
("Мириан", "expenses_category"),
("Основное", "expenses_category"),
("Ресторан", "expenses_category"),
("Стройматериалы", "expenses_category"),
("Посуда", "expenses_category"),
("Мебель", "expenses_category"),
("Хозтовары на кухню или бар", "expenses_category"),
('Бензин', "expenses_category"),
('Ремонт', "expenses_category"),
('Остальное', "expenses_category"),
("Личное", "expenses_category"),
("Еда Мириан", "expenses_category"),
("Фрукты и Овощи", "expenses_category"),
("Рыба и Мясо", "expenses_category"),
("Нори, рис, уксусы, масло, соусы и тд", "expenses_category"),
("Расходники (пакеты, палочки, перчатки, ручки ...)", "expenses_category"),
("Моющие средства", "expenses_category"),
("Стафф еда", "expenses_category");


--INSERT INTO product_aliases
--VALUES
--("unnamed", "unnamed"),
--("fish", "fsh");


INSERT INTO money
VALUES
("Счет", 0),
("Касса", 0),
("Мириан", 0),
("Никита", 0);


INSERT INTO users
VALUES
(358058423, 1, "Никита"),
(1268471021, 1, "Мириан"),
(368555562, 2, "Юля"),
(5852542325, 2, "Коля"),
(651083072, 3, "Миша"),
(1605440975, 4, "Серёга"),
(5389969711, 3, "Илья");