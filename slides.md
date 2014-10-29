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



[repo]: https://github.com/bbesmanoff/how-to-test-webapps

