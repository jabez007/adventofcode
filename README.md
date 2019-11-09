# adventofcode-2019

Using [TypeScript](https://www.typescriptlang.org/) for [2019's Advent of Code](https://adventofcode.com/2019).

Use TypeScript 3.7.4, the last stable TypeScript release available by December 31, 2019.
The compiler and Node.js type definitions are pinned in `package.json` and `package-lock.json`.
See the [TypeScript package release dates](https://registry.npmjs.org/typescript).

Use [Node.js 12.14.0 LTS](https://nodejs.org/en/blog/release/v12.14.0), released December 17, 2019, with its bundled npm 6.13.4.
`.nvmrc` selects Node.js, and `.npmrc` makes npm reject other Node.js and npm versions.

With [nvm](https://github.com/nvm-sh/nvm) installed, run:

```sh
nvm install
nvm use
node --version
npm --version
npm ci
npm run typecheck
npm run build
npm start
```

The version commands must report `v12.14.0` and `6.13.4`.
The starter prints `Advent of Code 2019 - Day 01`. Replace it with your solution.
Keep each day's TypeScript files in its own directory, such as `day01/main.ts`.
`npm run build` compiles all day directories into `dist/`.
Run another day with `node dist/day02/main.js` after adding and compiling it.
