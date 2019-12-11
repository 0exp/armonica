# Armonica

**(in active development)** A set of commonly used data structures powered by Sorbet 🍦

## Installation

```ruby
gem 'qonfig'
```

```shell
$ bundle install
# --- or ---
$ gem install 'qonfig'
```

```ruby
require 'qonfig'
```

---

## Realized Data Structures

- [Singly Linked List](#singly-linked-list)

---

### Singly Linked List

- `#append(value)` (`sig { params(value: T.nilable(BasicObject)).void }`)
- `#prepend(value)` (`{ params(value: T.nilable(BasicObject)).void }`)
- `#count` (`sig { returns(Integer) }`)

---

## Contributing

- Fork it ( https://github.com/0exp/qonfig/fork )
- Create your feature branch (`git checkout -b feature/my-new-feature`)
- Commit your changes (`git commit -am '[my-new-featre] Add some feature'`)
- Push to the branch (`git push origin feature/my-new-feature`)
- Create new Pull Request

## License

Released under MIT License.

## Authors

[Rustam Ibragimov](https://github.com/0exp)
