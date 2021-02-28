insert into animal_kind (animal_kind_id, name, lifespan)
values (1, 'Свинья', 15),
       (2, 'Овца', 10),
       (3, 'Корова', 12);

insert into worker(worker_id, name, position)
values (1, 'Ярослав', 'Ремонтник'),
       (2, 'Даниил', 'Дойщик коров'),
       (3, 'Алена', 'Дойщик коров'),
       (4, 'Али', 'Доктор'),
       (5, 'Ильдар', 'Мясник');

insert into barn(barn_id, area, worker_id)
values (1, 100, 1),
       (2, 300, 2),
       (3, 150, 2);

insert into animal(animal_id, age, animal_kind_id, worker_id, barn_id)
values (1, 1, 1, 5, 1),
       (2, 2, 1, 5, 1),
       (3, 5, 1, 5, 1),
       (4, 3, 2, 4, 2),
       (5, 4, 2, 4, 2),
       (6, 4, 3, 2, 3),
       (7, 4, 3, 2, 3),
       (8, 4, 3, 3, 3),
       (9, 4, 3, 3, 3);

insert into task(task_id, description, status)
values (1, 'Подоить коров', true),
       (2, 'Подоить коров', false),
       (3, 'Зарубить свинью', false),
       (4, 'Проверить инвентарь', false),
       (5, 'Постричь овец', false);

insert into worker_task(worker_id, task_id)
values (2, 1),
       (2, 2),
       (3, 2),
       (5, 3),
       (1, 4);

insert into product(product_id, product_type, volume, price, for_sale, barn_id)
values (1, 'Cвинина', 50, 10000, true, 2),
       (2, 'Ягнятина', 25, 17500, true, 1),
       (3, 'Баранина', 40, 8800, true, 1),
       (4, 'Ягнятина', 30, 20000, true, 1);

insert into inventory_type(inventory_type_id, name)
values (1, 'Ведро'),
       (2, 'Лопата'),
       (3, 'Топор');

insert into inventory(inventory_id, price, is_broken, inventory_type_id, barn_id)
values (1, 100, false, 1, 3),
       (2, 100, false, 1, 3),
       (3, 100, true, 1, 3),
       (4, 350, false, 2, 1),
       (5, 500, false, 3, 2);