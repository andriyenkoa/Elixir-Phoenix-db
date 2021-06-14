### Запуск 
Чтобы запустить проект с нуля необходимо:
1. В командной строке перейти в директорию проекта. 
2. Выполнить команду `mix setup` для устаноки зависимостей, создания и заполнения базы данных и т.д.
3. Выполнить команду `mix deps.get `
4. В файле `priv/repo/seeds.exs` указать путь к csv файлу
5. Чтобы запустить сервер,необходимо ввести команду `mix phx.server`

Если всё сделано правильно, то можно перейти по ссылке: http://localhost:4000
### База данных
По дефолту, в проекте используется база данных PostgreSQL, имеющая login `postgres` и password `123`

Создайте базу данных с пользователем `postgres`, если еще не сделали этого

Если всё сделано правильно, то можно ввести команду `mix ecto.migrate`
### Пример данных
Используя следующую команду, вы можете заполнить информацию некоторыми образцами данных:
`mix run priv/repo/seeds.exs`
Перейдя по ссылке, можно убедиться в заполненности данных: http://localhost:4000/flights 
### Функциональность
Чтобы проверить функциональность необходимо отправить запрос `GET /flights/:id` , где id - числовое ID перелёта

Перейдя по ссылке http://localhost:4000/flights/1 , появится информация о названии рейса, времени отбытия и времени прибытия

Чтобы убедиться, что id - не номер строки, а числовое id перелета, необходимо перейти на http://localhost:4000/flights/5. 

Так как ID = 5 есть, а числовоое ID = 5 отсутствует, мы увидим ожидаемую ошибку.



