"Extract Class" Exercise
========================

In this exercise, you'll be breaking up a class called `SurveyInviter`. This
class contains two responsibilities: logic for sending invitations to each
recipient, and logic for parsing a list of email addresses. Let's split the
class into two in order to separate these responsibilities.

Exercise!
---------

Extract a new class from `SurveyInviter` (located at `lib/survey_inviter.rb`) to
split the `recipients` string into multiple email addresses. Make sure to write
tests for the new class as you go.

Use the new class from `SurveyInviter`.

Make sure all tests are passing by running:

    rake

## Working/Submitting

1. To work on this exercise, fork the repo and begin implementing your solution.
2. Create a pull request so your code can be reviewed.
3. Perform a code review on at least one other person's solution. Your comments
   should follow our [code review guidelines]. Most important: be friendly. Make
   suggestions, not demands.
4. Improve your solution based on the comments you've received and approaches
   you've learned from reviewing others' attempts.

[code review guidelines]: https://github.com/thoughtbot/guides/tree/master/code-review
