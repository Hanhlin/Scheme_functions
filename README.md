# Scheme_functions
Includes ten small Scheme functions. 

All code are purely functional and do not use of built in functions, such as set!, set-car!, and set-cdr!.

1) Define the function (byTwos n m) that returns the list of integers starting with n such that each successive element is two greater than the previous element and no element is greater than m.

2) Write the function (compress L) that returns a list of all the atoms (non-list values) contained in L or in any nested list within L.

3) Write a linear-time reverse function, (rev-all L) which reverses the elements of a list L and, if the L contains nested lists, reverses those nested lists as well. Note that it is linear time (in the total number of atoms in the list at any level of nesting)!

4) Write own equality function (not built-in function), (equalTo? x y), which works the same as (equal? x y). Can call eq?, but cannot use equal?.

5) Write a function (equalFns? fn1 fn2 domain), where the parameters fn1 and fn2 are functions and domain is a list of values, that returns true iff fn1 and fn2 always returns the same value when applied to the same element of domain. Don’t assume that fn1 and fn2 always return atomic values.

6) Write a function, (same-vals fn1 fn2 domain), that returns the list of all elements x of domain such that (fn1 x) and (fn2 x) return the same value.

7) Write a function (split x L), where x is a number and L is a list of numbers, that returns a list containing two lists: The first list contains the numbers in L less than or equal to x and the second list contains the numbers in L greater than x.

8) Write a function (psort L) that implements a partition sort (similar to Quicksort). Use the above split function. Given a list L, if L is non-empty, then split should be called using the first element of L to partition the rest of L. Then, psort should be called recursively to sort each of the two lists returned by split. Finally, the sorted result is constructed from the elements of the two sorted lists, as well as the first element of L.

9) Write a single function (applyToList f), where f is a parameter that is a function, that returns a function that takes a list L as a parameter and applies f to every element of L, returning the resulting list as the result. Note to use the built-in map function in the definition of applyToList.

10) Write a function (newApplyToList f) which behaves exactly like applyToList above. Cannot use the built-in map or any other built-in function except cons, car, and cdr. Also, cannot define any helper function outside of newApplyToList, but can define functions within it (Note: do not use (define ...) inside a procedure). 

