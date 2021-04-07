@deriving(jsConverter)
type roundingMode = [
  | #HALF_ODD
  | #HALF_EVEN
  | #HALF_UP
  | #HALF_DOWN
  | #HALF_TOWARDS_ZERO
  | #HALF_AWAY_FROM_ZERO
  | #DOWN
]

type globalExchangeRatesApi = {
  propertyPath: string,
  headers: Js.Json.t,
}

type dineroJs = {
  defaultAmount: int,
  defaultCurrency: string,
  defaultPrecision: int,
  globalLocale: string,
  globalFormat: string,
  globalRoundingMode: string,
  globalFormatRoundingMode: string,
  globalExchangeRatesApi: globalExchangeRatesApi,
}

@module("dinero.js") @val external dineroJs: dineroJs = "default"

@set
external setDefaultAmount: (dineroJs, int) => unit = "defaultAmount"
@set
external setDefaultCurrency: (dineroJs, string) => unit = "defaultCurrency"
@set
external setDefaultPrecision: (dineroJs, int) => unit = "defaultPrecision"

@set
external setGlobalLocale: (dineroJs, string) => unit = "globalLocale"
@set
external setGlobalFormat: (dineroJs, string) => unit = "globalFormat"
@set
external setGlobalRoundingMode: (dineroJs, string) => unit = "globalRoundingMode"
@set
external setGlobalFormatRoundingMode: (dineroJs, string) => unit = "globalFormatRoundingMode"
@set
external setGlobalExchangeRatesApi: (dineroJs, globalExchangeRatesApi) => unit =
  "globalExchangeRatesApi"

type options

@obj
external options: (~amount: int=?, ~currency: string=?, ~precision: int=?, unit) => options = ""

type convertOptions = {
  currency: string,
  endpoint: string,
  proprtyPath: string,
  headers: Js.Dict.t<string>,
  roundingMode: roundingMode,
}

type rec dinero = {
  getAmount: (. unit) => int,
  getCurrency: (. unit) => string,
  getLocale: (. unit) => string,
  setLocale: (. string) => dinero,
  getPrecision: (. unit) => int,
  convertPrecision: (. int, roundingMode) => dinero,
  add: (. dinero) => dinero,
  subtract: (. dinero) => dinero,
  multiply: (. dinero) => dinero,
  divide: (. dinero) => dinero,
  percentage: (. float) => dinero,
  allocate: (. array<int>) => array<dinero>,
  convert: (. string, convertOptions) => Js.Promise.t<dinero>,
  equalsTo: (. dinero) => bool,
  lessThan: (. dinero) => bool,
  lessThanOrEqual: (. dinero) => bool,
  greaterThan: (. dinero) => bool,
  greaterThanOrEqual: (. dinero) => bool,
  isZero: (. unit) => bool,
  isPositive: (. unit) => bool,
  isNegative: (. unit) => bool,
  hasSubUnits: (. unit) => bool,
  hasCents: (. unit) => bool,
  hasSameCurrency: (. dinero) => bool,
  hasSameAmount: (. dinero) => bool,
  toFormat: (. string, roundingMode) => string,
  toRoundedUnit: (. int, roundingMode) => int,
  toObject: (. unit) => Js.Json.t,
  toJSON: (. unit) => Js.Json.t,
  toUnit: (. unit) => float,
}

@module("dinero.js") external create: options => dinero = "default"

@send external minimum: (dineroJs, array<dinero>) => dinero = "minimum"
@send external maximum: (dineroJs, array<dinero>) => dinero = "maximum"
