% s(CASP) Programming
:- use_module(library(scasp)).
% Uncomment to suppress warnings
%:- style_check(-discontiguous).
%:- style_check(-singleton).
%:- set_prolog_flag(scasp_unknown, fail).

/**
 * Date: 01/14/2022 - 01/15/2022
 * HACKREASON ~ 2022
 * Project Name: Buck-buddy
 * Author(s): Erika M, Shanmuka J, Bhuvan B, Jonathan K
**/

/**
 * Buck-buddy is an Artificially Intelligent simulated system that runs on human style reasoning to
 * develop a personalized cost-efficient partner that incorporates a wide range of subscriptions and budget spending
 * based on the year, the month, and the day. This logic program was built using the s(CASP) automated reasoning system.
**/

/* facts */
% Cost
% Place
% Category
% Budget

/*** SUBSCRIPTIONS ***/
% recreation <20 | M or Y
subscribed(recreation, texasff, 19). 
subscribed(recreation, soccer, 21).  
subscribed(recreation, topgolf, 22).

% entertainment <5 | M or Y
subscribed(entertainment, hbo, 9).
subscribed(entertainment, netflix, 3).
subscribed(entertainment, peacock, 0).
subscribed(entertainment, hulu, 16).

% food <2 | D
subscribed(food, subway, 4).
subscribed(food, panera, 1).
subscribed(food, starbucks, 10).

% insurance <500 | M
subscribed(insurance, medicare, 150).
subscribed(insurance, car, 140).
subscribed(insurace, house, 700).
subscribed(insurance, technology, 100).

% subscriptions RULES
subscribed(Category, Place, Usage) :- ((Usage < 2, (Category = food)) ->  write("usage is low on food category. Consider ending subscription.")).
subscribed(Category, Place, Usage) :- ((Usage >= 2, (Category = food)) ->  write("usage is good for food category.")).

subscribed(Category, Place, Usage) :- ((Usage < 20, Category = recreation) -> write("usage is low on recreation category. Consider ending subscription.")).
subscribed(Category, Place, Usage) :- ((Usage >= 20, Category = recreation) -> write("usage is good for recreation category")).

subscribed(Category, Place, Usage) :- ((Usage < 5, Category = entertainment) ->   write("usage is low on entertainment category. Consider ending subscription.")).
subscribed(Category, Place, Usage) :- ((Usage >= 5, Category = entertainment) ->   write("usage is good for entertainment category")).

subscribed(Category, Place, Usage) :- ((Usage < 100, Category = insurance) ->   write("usage is low on insurance category. Consider ending subscription.")).
subscribed(Category, Place, Usage) :- ((Usage >= 100, Category = insurance) ->   write("usage is good for insurance category")).

% D|M|Place budget RULES
daily_budget(Category, Cost, Budget).
daily_budget(food, 20, 30).
daily_budget(Category, Cost, Budget) :- ((Cost =< Budget, Category = food) ->  write("Cost is inside of daily budget!"); write("Cost is out of daily budget! Consider something less expensive.")).

monthly_budget(Category, Cost, Budget).

monthly_budget(entertainment, 40, 50).
monthly_budget(recreation, 150, 175).
monthly_budget(insurance, 450, 500).

monthly_budget(Category, Cost, Budget) :- ((Cost =< Budget, Category = recreation) ->  write("Cost is inside of monthly budget!")).
monthly_budget(Category, Cost, Budget) :- ((Cost > Budget, Category = recreation) ->  write("Cost is out of monthly budget! Consider something less expensive.")).
monthly_budget(Category, Cost, Budget) :- ((Cost =< Budget, Category = entertainment) ->  write("Cost is inside of monthly budget!")).
monthly_budget(Category, Cost, Budget) :- ((Cost > Budget, Category = entertainment) ->  write("Cost is out of monthly budget! Consider something less expensive.")).
monthly_budget(Category, Cost, Budget) :- ((Cost =< Budget, Category = insurance) ->  write("Cost is inside of yearly budget!")).
monthly_budget(Category, Cost, Budget) :- ((Cost > Budget, Category = insurance) ->  write("Cost is out of yearly budget! Consider something less expensive.")).

monthly_reminder("Don't forget to save for your personal and emergency funds!").

yearly_budget(Category, Cost, Budget) :- ((Cost =< Budget, Category = recreation) ->  write("Cost is inside of yearly budget!")).
yearly_budget(Category, Cost, Budget) :- ((Cost > Budget, Category = recreation) ->  write("Cost is out of yearly budget! Consider something less expensive.")).
yearly_budget(Category, Cost, Budget) :- ((Cost =< Budget, Category = entertainment) ->  write("Cost is inside of yearly budget!")).
yearly_budget(Category, Cost, Budget) :- ((Cost > Budget, Category = entertainment) ->  write("Cost is out of yearly budget! Consider something less expensive.")).
yearly_budget(Category, Cost, Budget) :- ((Cost =< Budget, Category = insurance) ->  write("Cost is inside of yearly budget!")).
yearly_budget(Category, Cost, Budget) :- ((Cost > Budget, Category = insurance) ->  write("Cost is out of yearly budget! Consider something less expensive.")).

/*
	% Queries
	?- subscribed(Category, Place, Cost).
    ?- subscribed(recreation, texasff, 19).
    ?- subscribed(recreation, soccer, 21).
    ?- subscribed(entertainment, peacock, 0).
    ?- subscribed(entertainment, hulu, 16).
    ?- subscribed(food, subway, 4).
    ?- subscribed(food, panera, 1).
    ?- subscribed(insurance, car, 140).
    ?- subscribed(insurace, house, 700).
    ?- daily_budget(food, 20, 30).
    ?- monthly_budget(insurance, 450, 500).
    ?- yearly_budget(entertainment, 900, 1000).
    ?- yearly_budget(entertainment, 500, 250).
*/
%%s(CASP): s(CASP) is a system for automating commonsense reasoning.
%%developed by UT Dallas in conjunction with IMDEA
