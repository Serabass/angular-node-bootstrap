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

# Ставим yeoman
yarn global add yo generator-express-no-stress-typescript

# Крафтим
yo express-no-stress-typescript backend

# Ставим ЖЕСТъ как дев-зависимость
yarn add --dev jest ts-jest @types/jest

# Инициализируем конфиги для ЖЕСТа
yarn ts-jest config:init

cd ../..

rm -rf .init
