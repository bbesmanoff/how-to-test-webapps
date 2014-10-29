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
[example lives here](jasmine_01.html)

---

:rage:

---

# B__D__D
## The __D__ is for Driven

---

# Jasmine: An Example
[now with :green_heart:](jasmine_02.html)

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
[example here](jasmine-jquery_01.html)

---

![Red Pill GIF](http://i.giphy.com/JFCTv9AvwFBJK.gif)

---

# A Little Bit of Backbone
> Backbone.js gives structure to web applications by providing models with
> key-value binding and custom events, collections with a rich API of enumerable
> functions, views with declarative event handling...  
> http://backbonejs.org/

---

# What Does That Even Mean?

---

# What Does That Even Mean?
* Client-side MVC Framework

---

# What Does That Even Mean?
Models, Collections, Views  

---

# What Does That Even Mean?
Collections contain models  
Views display collections and/or models

---

# Show, Don't Tell

[#fail](backbone_01.html)

```notes
The example wasn't being parsed properly and would have been a little long for a
slide
```

---

# Where Does Jasmine Come in?

---

## Example: Let's Test This Puppy
Testing the model:

```javascript
  describe('StudentModel', function() {
    beforeEach(function() {
      this.student = new StudentModel({name: 'Joe Schmoe', year: 2});
    });

    describe('#procrastinate', function() {
      it('should write to the console', function() {
        spyOn(console, 'log');

        this.student.procrastinate();

        expect(console.log).toHaveBeenCalled();
        expect(console.log).toHaveBeenCalledWith('Joe Schmoe is procrastinating.  Typical year 2 things.');
      });
    });
  });
```

---

## Example: Let's Test This Puppy
Testing the view:

```javascript
  describe('StudentView', function() {
    beforeEach(function() {
      this.student = new StudentModel({name: 'Joe Schmoe', year: 2});
    });

    describe('#render', function() {
      var $rendered;

      beforeEach(function() {
        var view = new StudentView({model: this.student});
        $rendered = view.render().$el;
      });

      it ('should be a list item', function() {
        expect($rendered).toBeMatchedBy('li');
      });

      it('should include a student\'s name', function() {
        expect($rendered).toContainText('Joe Schmoe');
      });

      it('should include a student\'s year', function() {
        expect($rendered).toContainText('2');
      });

      it('should include a procrastination link', function() {
        expect($rendered).toContainElement('a');
      });

      describe('the procrastination link', function() {
        var $link;

        beforeEach(function() {
          $link = $rendered.find('a');
        });

        it('should call the model\'s procrastinate method', function() {
          spyOn(this.student, 'procrastinate').and.callThrough();
          $link.trigger('click');

          expect(this.student.procrastinate).toHaveBeenCalled();
        });
      });
    });
  });
```
[example here](backbone_jasmine_01.html)

---

:smiley:

---

# Let's Talk About Ruby

---

# Let's Talk About Ruby
Javascript < --- > Ruby

---

# Let's Talk About Ruby
Jasmine < --- > RSpec

---

# RSpec

```ruby
describe MyMathModule do
  describe '#abs' do
    describe 'with negative input' do
      it 'should return a positive number' do
        actual = MyMathModule.abs -4

        expect(actual).to satisfy { |v| v > 0 }
      end
    end
  end
end
```
examples are in this repository, but let's go to the shell

---

![Capybara](http://img1.wikia.nocookie.net/__cb20130810045256/cookieclicker/images/2/24/Capybara-02.jpg)

---

# Capybara
> Capybara helps you test web applications by simulating how a real user would
> interact with your app.
>
> https://github.com/jnicklas/capybara

---

# See Also:
Selenium

---

# Let's Write a Test
```ruby
  describe 'This Talk\'s Presentation' do
    let(:url) { 'https://bbesmanoff.github.io/how-to-test-webapps' }
    let(:gh_repo) { 'https://github.com/bbesmanoff/how-to-test-webapps' }
    let(:link_text) { 'bbesmanoff/how-to-test-webapps' }
    let(:right_arrow_selector) { '.navigate-right' }

    before :each do
      visit url
    end

    describe 'the repo link' do
      it 'should link to the repo' do
        click_link link_text

        expect(page.current_url).to eq gh_repo
      end
    end

    describe 'the right arrow' do
      describe 'using it to switch slides' do
        before :each do
          arrow = page.find :css, right_arrow_selector
          arrow.click
        end

        it 'should show the second slide' do
          current_slide = page.find :css, 'section.present'
          expect(current_slide.text).to eq 'WHO AM I?'
        end
      end
    end
  end
```
example in shell

---

# :thumbsup: :question:
---

# :x:

---

# Conerns
Right now, the test knows __a lot__ about the page

---

# Conerns
What if we wanted to extend the test suite?
Add some negative cases?

---

:clipboard:

---

# Conerns
Now the selector changes for something

---

:poop:

---

# Page Objects to the Rescue!

---

# What Is a Page Object?
* Object Oriented Wrapper around a single element
  * Page
  * Particular Widget

---

# What Does it Look Like?

```ruby
class Slideshow
    def initialize(url)
      @down_arrow = Reveal::Arrow.new 'down'
      @left_arrow = Reveal::Arrow.new 'left'
      @right_arrow = Reveal::Arrow.new 'right'
      @up_arrow = Reveal::Arrow.new 'up'

      @url = url
    end

    def content
      page.find :css, 'section.present'
    end

    def text
      content = page.find :css, 'section.present'
      content.text
    end
...
```

---

# What Does the Test Look Like?

```ruby
  describe 'This Presentation' do
    let(:url) { 'http://bbesmanoff.github.io/how-to-test-webapps/#/' }

    before :each do
      visit url

      @slideshow = Reveal::Slideshow.new url
    end

    describe 'the index page' do
      it 'should be the first slide' do
        expect(@slideshow.first?).to be_truthy
      end

      it 'should be treated as slide 0' do
        expect(@slideshow.current_slide).to be_zero
      end
    end

  ...
```

---

# Page Objects
* Encapsulation
* Consistent Interface

---

# Put it All Together

---

# Put it All Together
_an excercise left for the reader_

---

# Unsolicited Tips
1. Think about what you're tests are saying

---

# Unsolicited Tips
1. Think about what you're tests are saying
  * Is it English?

---

# Unsolicited Tips
1. Think about what you're tests are saying
  * Is it English?
  * Can you hand your test output to someone and they understand it?


---

# Unsolicited Tips
1. Think about what you're tests are saying
  * Is it English?
  * Can you hand your test output to someone and they understand it?
  * Can you hand your test *input* to someone and they understand it?

---

# :question: :question: :question:

[repo]: https://github.com/bbesmanoff/how-to-test-webapps
