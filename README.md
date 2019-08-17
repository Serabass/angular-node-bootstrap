Репозиторий для быстрого развёртывания проекта с использованием
 [Express](https://laravel.com/),
 [Angular](https://angular.io/),
 [Jest](https://jestjs.io/)
 и [Lerna](https://github.com/lerna/lerna).

# Требования
 * [Глобально установленный Yarn](https://yarnpkg.com/lang/en/)
 * Желание сэкономить время

# Что под капотом
 * [NgZorro (Ant Design for Angular)](https://ng.ant.design/docs/introduce/en)
 * [@ngx-resource/core](https://www.npmjs.com/package/@ngx-resource/core)
 * [@uirouter/angular](https://www.npmjs.com/package/@uirouter/angular)
 * [Express](https://laravel.com/)
 * [Jest](https://jestjs.io/)
 * [Prettier](https://prettier.io/)
 * [ESLint](https://eslint.org//) - скоро заменю на TSLint

Все подробности см. в [init.sh](/init.sh) (Описал выполнение каждой команды в комментариях)

# Крафтим новый проект
```
 $ git clone https://github.com/Serabass/angular-node-bootstrap <project-name>
 $ cd <project-name>
 $ sh init.sh
 $ yarn start
```

Проверяем в браузере: http://localhost:4201/

Кладём в свой репозиторий:
```
 $ git remote add origin <your-repo-url>
 $ git push -u origin master
```
_**Примечание**: локальный коммит выполняется автоматически после выполнения всех установок_

# Contributing
Предлагайте свои плюшки в [Issues](https://github.com/Serabass/angular-node-bootstrap/issues)

# Аналогичные репы 
* [Angular + Laravel](https://github.com/Serabass/angular-laravel-bootstrap)
