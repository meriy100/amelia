source 'https://rubygems.org'

# Declare your gem's dependencies in auto_i18n.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.


group :development do
  gem 'therubyracer' # javascript runtime。lessをコンパイルするために必要
  gem 'less-rails' # Railsでlessを使えるようにする。Bootstrapがlessで書かれているため
  gem 'twitter-bootstrap-rails' # Bootstrapの本体
  gem 'better_errors'          # エラー画面を見やすくする
  gem 'binding_of_caller'      # better_errorsのエラー画面でREPLが使える
  gem 'tapp'                   # プリントデバッグがしやすくなる
  gem 'pry-rails'              # railsでpryが使える
  gem 'pry-byebug'             # pryでデバックコマンドが使える
  gem 'awesome_print'          # プリントデバッグの出力を整形
  gem 'hirb'                   # SQLの結果を見やすく整形してくれる
  gem 'hirb-unicode'           # hirbの日本語対応
  gem 'bcrypt-ruby'
  gem 'rails_best_practices'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end
# To use a debugger
# gem 'byebug', group: [:development, :test]

