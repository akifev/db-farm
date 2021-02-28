create table animal_kind
(
    animal_kind_id int primary key not null,
    name           varchar(30)     not null,
    lifespan       int             not null
);

create table worker
(
    worker_id int primary key not null,
    name      varchar(50)     not null,
    position  varchar(25)     not null
);

create table barn
(
    barn_id   int primary key not null,
    area      int             not null,
    worker_id int             not null,

    foreign key (worker_id) references worker (worker_id)
);

create table animal
(
    animal_id      int primary key not null,
    age            int             not null,
    animal_kind_id int             not null,
    worker_id      int             not null,
    barn_id        int             not null,

    foreign key (animal_kind_id) references animal_kind (animal_kind_id),
    foreign key (worker_id) references worker (worker_id),
    foreign key (barn_id) references barn (barn_id)
);

create table task
(
    task_id     int primary key not null,
    description varchar(200)    not null,
    status      bool            not null
);

create table worker_task
(
    worker_id int not null,
    task_id   int not null,

    primary key (worker_id, task_id),

    foreign key (worker_id) references worker (worker_id),
    foreign key (task_id) references task (task_id)
);

create table product
(
    product_id   int primary key not null,
    product_type varchar(40)     not null,
    volume       int             not null,
    price        int             not null,
    for_sale     bool            not null,
    barn_id      int             not null,

    foreign key (barn_id) references barn (barn_id)
);

create table inventory_type
(
    inventory_type_id int primary key not null,
    name              varchar(35)     not null
);

create table inventory
(
    inventory_id      int primary key not null,
    price             int             not null,
    is_broken         bool            not null,
    inventory_type_id int             not null,
    barn_id           int             not null,

    foreign key (inventory_type_id) references inventory_type (inventory_type_id),
    foreign key (barn_id) references barn (barn_id)
);
