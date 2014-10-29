# How to Test Web Apps

Brian Besmanoff  
:octocat: [bbesmanoff/how-to-test-webapps][repo]

---

# Who Am I?

---

# Who Are You?
### Who who, Who who

```note
  Beginner / Intermediate Web Dev
```

---

# Tech List

---

## Ruby
  * Rails
  * RSpec
  * Capybara

---

## Javascript
  * Backbone
  * Jasmine
  * Jasmine-jQuery

---

:checkered_flag:
# Let's Get Started
:checkered_flag:

---

# Javascript

---

# Jasmine
:rice:

---

# Jasmine

> Jasmine is a Behavior Driven Development testing framework for JavaScript
> http://jasmine.github.io/2.0/introduction.html


---

:alarm_clock:

---

# What is BDD?

---

# What is BDD?

* BDD is a style of testing
* English-y descriptions of things

---

# Example: Cucumber
![Cucumber Example](http://cukes.info/images/feature.png)

---

# Return to Jasmine
Cucumber is cool  
It looks like English

---

## But I Like JS > English

---

# Jasmine: An Example

```javascript
  describe('MyMathModule', function() {
    describe('.abs', function() {
      describe('with negative input', function() {
        it('should return a positive number', function() {
          var result = MyMathModule.abs(-4);
          expect(result).toBeGreaterThan(0);
      });

      describe('with zero as an input', function() {
        it('should return zero', function() {
          var result = MyMathModule.abs(0);
          expect(result).toBe(0);
      });

      describe('with positive input', function() {
        it('should return a positive number', function() {
          var result = MyMathModule.abs(4);
          expect(result).toBeGreaterThan(0);
      });
    });
  });
```

---

# Jasmine: An Example

[example lives here](jasmine_01.html)

---

:rage:

---

# B__D__D
## The __D__ is for Driven

---

# Jasmine: An Example
[now with less angry colors](jasmine_02.html)

---

:boom: :boom: :boom:

---

# Some Other Cool Features
* Spies
* Clock Management

---

# Spies
_Spy on_ a function

```javascript
  var fn = function(s) { console.log(s) };

  describe('fn', function() {
    it('should call console.log', function() {
      spyOn(console, 'log');
      fn("Hello");

      expect(console.log).toHaveBeenCalled();
      expect(console.log).toHaveBeenCalledWith('Hello');
    });
  });
```

[example here](jasmine_03.html)

---

# Clock Management

```javascript
  var waitAndDo = function(fn, ms) { setTimeout(fn, ms); };

  describe('waitAndDo', function() {
    beforeEach(jasmine.clock().install);
    afterEach(jasmine.clock().uninstall);

    it('should wait for 1000000 ms', function() {
      spyOn(console, 'log');
      waitAndDo(function() { console.log('done'); }, 1000000);

      expect(console.log).not.toHaveBeenCalled();

      jasmine.clock().tick(1000000);
      expect(console.log).toHaveBeenCalled();
      expect(console.log).toHaveBeenCalledWith('done');
    });

    it('should show that clock() actually works', function() {
      spyOn(console, 'log');
      waitAndDo(function() { console.log('done'); }, 1);

      expect(console.log).not.toHaveBeenCalled();

      jasmine.clock().tick(1);
      expect(console.log).toHaveBeenCalled();
      expect(console.log).toHaveBeenCalledWith('done');
    });
  });
```
[example here](jasmine_04.html)
---

# Jasmine-jQuery

---

# Jasmine-jQuery
A set of additonal, jQuery-friendly, matchers for Jasmine

---

## But doesn't Jasmine have enough?
* `toBe`
* `toMatch`
* `toContain`
* `toBeTruthy`
* `toBeDefined`
* `...`

---

## What looks more English-y?
`expect($('#elem').attr('checked')).toBeTruthy()`

-or-

`expect($('#elem')).toBeChecked()`

---

# Jasmine-jQuery: An Example

---

## Jasmine-jQuery: An Example

```javascript
describe('The Big Red Button', function() {
  describe('when clicked', function() {
    beforeEach(function() {
      var $button = $('#btn');
      $button.trigger('click');
    });

    it ('should update the label', function() {
      expect($('#lbl')).toHaveText('Why would you do that?!?!');
    });
  });
});
```

---

## Jasmine-jQuery: An Example
[no tricks, just :green_heart:](jasmine-jquery_01.html)


[repo]: https://github.com/bbesmanoff/how-to-test-webapps
