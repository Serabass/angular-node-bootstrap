import {add} from '../add';

describe('Add tests', () => {
    it('add must return a sum', () => {
        expect(add(1, 2)).toBe(3);
    });
});
