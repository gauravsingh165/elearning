// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import { Turbo } from "@hotwired/turbo-rails"
import { cable } from "@hotwired/turbo-rails"


Turbo.start()
cable.consumer.connect()