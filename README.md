Ruby Engineer Coding Challenge
=======================

Hello!

We've come up with this relatively open-ended programming/engineering challenge that will allow you to demonstrate your skills from the comfort of your own workspace. In addition, we know your time is valuable, so please feel free to use your completed work as a portfolio piece.

We wish you the best of luck and can't wait to see what you create!

## Overview

Your goal is to develop a system to calculate the shipping cost for products of an order, based on it's weight and distance from origin to destination. The distribution points will be supplied to this system throught an API and the shipping cost will be calculated in another API, always aiming at the lowest cost to the customer.

To populate the database, another system will call the API informing the distance (in kilometers) between *origin* and *destination* of two distribution points. For example:
```
POST /distance
A B 10
```
```
POST /distance
B C 15
```
```
POST /distance
A C 30
```

In a second moment, the shopping system will call the API informing the total weight of the order, the source and destination points. The system should return the lowest shipping cost, using the formula: `cost = distance * weight * 0.15`. For example:

```
GET /cost?origin=A&destination=C&weight=5
18.75
```

Explanation: the shortest path from A to C is A -> B -> C = 25km. `cost = 25 * 5 * 0.15 = 18.75`

## Considerations

* The input format of distance should have the format `A B X`, where *0 < X <= 100000*. Wrong format or data should return an error;
* If a distance point already exists, should be replaced with the new value;
* The cost API should validate the given points and weight, where *0 < wheight <= 50*. If no path was found between *origin*  and *destination*, and error should be returned;
* The solution should be implemented in Ruby. You could use the frameworks that you're most used to.
* Both APIs will receive a large amount of requests: choose the design and technology wisely;

## Submission

You can follow the GitHub Fork/Pull Request workflow by [forking this repository](https://github.com/RakutenBrasil/backend-code-challenge/fork), commiting your changes, and submiting a pull request to us, explaning your solution, technical decisions and how configure/use on the README file. For more information about that, you can see this [GitHub article](https://help.github.com/articles/fork-a-repo/#propose-changes-to-someone-elses-project).

## What we are looking for

We are looking for several things with this challenge. First, of course, we're looking for your answer to be technically correct. Beyond that, we're also looking for:

* Is your code easy to read and understand?
* Are you following the usual conventions for Ruby development?
* How good are you at writing tests? And how easy are they to read and understand?
* Did you follow these directions?

We will of course **examine your code to see its correctness, readability, general elegance, architectural decisions, and modularity**. If/when you meet with us, be prepared to talk about why and how you design your solution. We also test your system with a large amount of data to mesure the performance and to see if we can break stuff.

That's it. There aren't any hidden gotchas or trick questions. That's really what we're going to do.

## License

We have licensed this project under the MIT license so that you may use this for a portfolio piece (or anything else!).
