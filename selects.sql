-- Id сломанных инвентарей
select inventory_id
from inventory
where is_broken = true;

-- Открытые задачи, на которые не назначен ни один работник
select task_id, description
from task
         natural join (select task_id
                       from task
                       where status = false except
                       select task_id
                       from worker_task) as unassigned_tasks;

-- Выполненные задачи
select task_id
from task
where status = true;

-- Работники, не назначенные ни на одну открытую задачу
select worker_id, name, position
from worker
         natural join
     (select worker_id
      from worker
          except
      select worker_id
      from worker_task
               natural join task
      where status = false) as free_workers;

-- Продукция на продажу
select product_id, volume, price
from product
where for_sale = true;

-- Объем продукции на продажу
select sum(volume)
from product
where for_sale = true;

-- Суммарная стоимость продукции на продажу
select sum(price)
from product
where for_sale = true;

-- Суммарная стоимость продукции каждого типа
select product_type, sum(price)
from product
group by product_type;
