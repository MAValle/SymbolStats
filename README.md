# SymbolsStats

SymbolStasts is an R package for estimating symbol entropy given a sequence of symbols.

## Installation

Use the `devtools` package in `R` to install. In case you don not have it, do the following script. It is posiible that `R` begins to install also other dependencies. Don't panic.

```bash
install.packages("devtools")
```

After that, now you can install the `SymbolStats` package:

```bash
devtools::install_github("MAValle/SymbolStats")
```

## Usage

First, load the package, and then view documentation:

```bash
library(SymbolStats)

# Test the data
head(alldata)
help(symbol_entropy)
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.


## License

[MIT](https://choosealicense.com/licenses/mit/)

