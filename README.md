# Calendar Events

## Описание

Календарь событий - это небольшое тестовое приложение написанное для проверки
работы связки двух gems simple_calendar и recurring_select.

## Устанока

Склонируйте приложение на ваш компьютер.

```
$ git clone https://github.com/wkdjgf534/calendar_events.git
```

Установите все необходимые gems.

```
$ bundle
```

Переименуйте файл `/config/database.yml.samlple` в `/config/database.yml`
и настройте параметры для работы с БД postgresql.

Выполните миграции.

```
$ rails db:migrate
```

## Работа с приложением

Запустите сервер

```
$ rails s
```

Перейдите по адресу `localhost:3000`

## Демо

Пример работы приложения можно посмотреть [тут][1].

[1]: https://calendar1-events.herokuapp.com/
