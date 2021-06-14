Чтобы запустить проект с нуля необходимо:
1. В файле priv/repo/seeds.exs указать путь к csv файлу
2. Чтобы запустить сервер,необходимо ввести команду mix phx.server
3. Перейти на http://localhost:4000/flights 
Перейдя по ссылке, видим всю информацию о полётах.

Чтобы проверить функциональность необходимо отправить запрос GET /flights/:id , где id - числовое ID перелёта
Перейдя по ссылке http://localhost:4000/flights/1 , появится информация о названии рейса, времени отбытия и времени прибытия
Чтобы убедиться, что id - не номер строки, а числовое id перелета, необходимо перейти на http://localhost:4000/flights/5. 
Так как ID = 5 есть, а числовоое ID = 5 отсутствует, мы увидим ожидаемую ошибку.


  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
