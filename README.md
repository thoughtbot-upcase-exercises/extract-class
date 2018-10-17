# Refactoring / Extract Class

Hey there! We're [thoughtbot](https://thoughtbot.com), a design and
development consultancy that brings your digital product ideas to life.
We also love to share what we learn.

This coding exercise comes from [Upcase](https://thoughtbot.com/upcase),
the online learning platform we run. It's part of the
[Refactoring](https://thoughtbot.com/upcase/refactoring) course and is just one small sample of all
the great material available on Upcase, so be sure to visit and check out the rest.

## Exercise Intro

In this exercise, you'll be breaking up a class called `SurveyInviter`. This class contains two responsibilities: logic for sending invitations to each recipient, and logic for parsing a list of email addresses. Let's split the class into two in order to separate these responsibilities.

[See an example from The Weekly Iteration](https://upcase.com/videos/ruby-science-extract-class).

## Instructions

To start, you'll want to clone and run the setup script for the repo

    git clone git@github.com:thoughtbot-upcase-exercises/extract-class.git
    cd extract-class
    bin/setup

Extract a new class from `SurveyInviter` (located at `lib/survey_inviter.rb`) to split the `recipients` string into multiple email addresses. Make sure to write tests for the new class as you go.

Use the new class from `SurveyInviter`.

Make sure all tests are passing by running:

    rake

## Featured Solution

Check out the [featured solution branch](https://github.com/thoughtbot-upcase-exercises/extract-class/compare/featured-solution#toc) to
see the approach we recommend for this exercise.

## Forum Discussion

If you find yourself stuck, be sure to check out the associated
[Upcase Forum discussion](https://forum.upcase.com/t/refactoring-extract-class/4639)
for this exercise to see what other folks have said.

## Next Steps

When you've finished the exercise, head on back to the
[Refactoring](https://thoughtbot.com/upcase/refactoring) course to find the next exercise,
or explore any of the other great content on
[Upcase](https://thoughtbot.com/upcase).

## License

extract-class is Copyright © 2015-2018 thoughtbot, inc. It is free software,
and may be redistributed under the terms specified in the
[LICENSE](/LICENSE.md) file.

## Credits

![thoughtbot](https://presskit.thoughtbot.com/assets/images/logo.svg)

This exercise is maintained and funded by
[thoughtbot, inc](http://thoughtbot.com/community).

The names and logos for Upcase and thoughtbot are registered trademarks of
thoughtbot, inc.
