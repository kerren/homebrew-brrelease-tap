# brrelease homebrew tap

## One step install

```shell
brew install kerren/brrelease-tap/brrelease
```

## How do I install these formulae?

```shell
brew install kerren/brrelease-tap/<formula>
```

Or,
```shell
brew tap kerren/brrelease-tap
brew install <formula>
```


Or, in a [`brew bundle`](https://github.com/Homebrew/homebrew-bundle) `Brewfile`:

```ruby
tap "kerren/brrelease-tap"
brew "<formula>"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).


## Generating a template

I've created a script to generate the Homebrew Formula, an example would be:

```shell
pnpm generate-formula --version=1.10.2 --identifier=fd11b4a --build-directory=/tmp/brrelease/dist
```
