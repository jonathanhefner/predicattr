# Predicattr

Predicattr adds inquirer-style predicates to any class.

## Installation

Add this line to your application's Gemfile:

    gem 'predicattr'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install predicattr

## Usage

Simply include the Predicattr module in your class then declare some predicates, like so:

    include Predicattr

    attr_predicates "assigned", "fixed", "resolved", "closed" do |s|
      @state == s # s will be "assigned", "fixed", "resolved",  or "closed"
    end
    
Now your class will respond to the `assigned?`, `fixed?`, `resolved?` and `closed?` methods 
with the expected behavior.

You can also specify predicate names separately from their values:

    attr_predicates assigned: "A", fixed: "F", resolved: "R", closed: "C" do |s|
      @one_letter_state == s # s will be "A", "F", "R",  or "C"
    end
    
Or, you can combine the two:

    attr_predicates "assigned", "closed", fixed: "done", resolved: "done" do |s|
      @one_letter_state == s # s will be "assigned", "closed", or "done"
    end


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
