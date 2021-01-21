
# rescript-dinero

[dinero.js](https://dinerojs.com/) bindings for ReScript

## Installation

Using NPM:

```sh
npm install --save @bettercart/rescript-dinero
```

Using Yarn:

```sh
yarn add @bettercart/rescript-dinero
```

Then add `@bettercart/rescript-dinero` to `bs-dependencies` in your `bsconfig.json`:
```js
{
  ...
  "bs-dependencies": ["@bettercart/rescript-dinero"]
}
```

## Usage 

```res
type currency = [
  | #USD
  | #CAD
  | #EUR
]

type money = {
  amount: int,
  currency: currency,
}

let money = {
  amount: 100,
  currency: #USD
}

let dinero = Dinero.create(
  Dinero.options(~amount=money.amount, ~currency=money.currency->Money.currencyToJs, ()),
)

<div> {dinero.toFormat(. "$0,0.00", #HALF_AWAY_FROM_ZERO)->React.string} </div>
```

## Globals

Dinero has an export for it self global instance `Dinero.dineroJs` - this will be needed to use the global setters or getters.


Set Globals
```res
  Dinero.setLocale(Dinero.dineroJs, "us-en")
  
  Dinero.setLocale(Dinero.dineroJs, "us-en")
```

Access Globals:

```res
  Dinero.dineroJs.globalLocale
```
