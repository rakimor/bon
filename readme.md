## Bingo
Деплой приложения через terraform и ansible в yandex cloud.
База данных должна существовать и быть заполненой.  
Для запуска:
- склонируйте репозиторий, создайте в корне файл .env с параметрами из .env.example
- не забудьте положить авторизованный ключ сервисного аккаунта yandex terraform/.key.json
- настройте переменные terraform (cloud_id, folder_id)

Пример .env  

STUDENT_EMAIL=r***@yandex.ru   
POSTGRES_ADDRESS=rc1b-cluster.mdb.yandexcloud.net  
POSTGRES_PASSWORD=password  
POSTGRES_USER=bingo  
POSTGRESS_DATABASE=train  
PORT=27411 # К сожаление не получилось найти алгоритм перевода email в номер порта.

Запустите deploy-bingo.sh

Скрипт создаст vm и развернет docker с контейнерами.

## Реализация
База данных оптимизирована индексами по примари и внешним ключам.
Приложение запускается в двух сервисах докера по одной реплике. Реверс прокси nginx (nginxproxy/nginx-proxy). Проверка через willfarrell/autoheal.

Не сделаны мониторинг и http3.

## PS
Особенно понравилось, что путь к логам и порт зависят от email. Универсально и просто - одной настройкой три параметра, надо взять на заметку :)