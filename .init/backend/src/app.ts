import express from 'express';
import {hello} from './modules/hello/hello'

const app = express();
const port = 3000;

app.get('/', (_, res: any): void => {
        res.send('Hello World!')
    },
);

app.get('/api/json', (_, res: any): void => {
        res.json({
            value: null,
        });
    },
);

app.listen(port, (): void => {
        console.log(`Example app listening on port ${port}!`)
    },
);

console.log(hello('you'));
