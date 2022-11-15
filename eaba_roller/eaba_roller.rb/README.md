# EabaRoller

This is a sample application for the RubyConf Mini 2022 workshop, Crystal for Rubyists.

It implements a simple application that rolls dice for the EABA v2 game system. The challenge is to use this simple implementation as a template, and translate it into Crystal.

## Usage

This will install a small executable, `eaba_roller`, that will roll dice for you.

To use the classes directly:

```ruby
require "eaba_roller"

one_die = D6.new
puts "Rolling a die: #{one_die.roll}"

roller = Roller.new(dice: 6, best: 4)
puts "Rolling six dice, and keeping the best 4: #{roller.total}"
```
