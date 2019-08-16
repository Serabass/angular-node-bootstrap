import { hello } from './hello'

it('should return hello', (): void => {
  expect(hello('hello')).toBe('hello')
})
