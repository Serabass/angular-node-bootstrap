#!/usr/bin/env bash

# Получаем название проекта по имени текущей директории
PROJECTNAME=${PWD##*/}
echo Crafting project $PROJECTNAME...

# Удаляем привязку к этому репозиторию, она нам не нужна
rm .git -rf

# Инициализируем новый git-репозиторий
git init

# Глобально ставим модуль json. Он нам пригодится, чтобы править package.json (https://www.npmjs.com/package/json)
yarn global add json

# Инициализируем новый node-проект
yarn init -yp

# Ставим Angular-CLI и Lerna
yarn add @angular/cli lerna

# Приводим проект в нужный вид, необходимый для работы с Lerna
yarn lerna init

# Идём в пакеты
cd packages

mv ../.init/backend ./

cd backend

cat package.json | json -e "this.name = '@$PROJECTNAME/backend'" > package.json

yarn

yarn ts-jest config:init

cd ..


# Крафтим новое ангуляр-приложение (в ходе установки консоль задаст несколько вопросов)
yarn ng new frontend
cd ..

# Не спрашивайте зачем это здесь и почему вот так.
mv frontend packages

# Проваливаемся в директорию нового приложения
cd packages/frontend

# Ставим необходимые модули
yarn add @ngx-resource/core \
         @ngx-resource/handler-ngx-http \
         @uirouter/angular \
         faker \
         jquery \
         lodash \
         moment \
         reflect-metadata

# Этот ставим отдельно, потому что там происходит ангуляровская магия с развёртыванием
# (в ходе установки консоль задаст несколько вопросов)
yarn ng add ng-zorro-antd --i18n=ru_RU

# Возвращаемся в корень
cd ../..

# Забираем конфиг для прокси (он нам нужен для удобной работы с бэкендом на этапе разработки)
mv .init/frontend/proxy.config.json packages/frontend

# Снова идём к фронту
cd packages/frontend

# Обновляем задачу start, чтобы работало через прокси
cat package.json | json -e "this.scripts.start += ' --proxy-config proxy.config.json --port 4201'" > package.json

# Прописываем имя пакета
cat package.json | json -e "this.name = '@$PROJECTNAME/frontend'" > package.json

rm -rf .init

# Прописываем в корневом package.json две задачи, которые будут вызывать одноимённые задачи во внутренних пакетах (lerna привет)
cat package.json | json -e "if (this.scripts == undefined) this.scripts = {};" > package.json
cat package.json | json -e "this.scripts.start = 'lerna run start --stream --parallel';" > package.json
cat package.json | json -e "this.scripts.build = 'lerna run build --stream --parallel';" > package.json
