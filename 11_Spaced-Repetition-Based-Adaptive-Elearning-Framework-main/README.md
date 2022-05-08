# Title of the Project: Spaced Repetition Based Adaptive Elearning Framework
# Group Members:
1) Neelay Umrotkar
2) Varun Godambe
3) Amit Kharwal

# Description
In our enhanced Spaced Repetition based Adaptive Learning Framework, we start of with
the user being showed a flashcard. The user has been assigned default values of SDS and
Interval. And the questions have the value of DL. Once shown the flashcard, the user has 3
options:<br/><br/>
Retry: If the user selects this option, first, his SDS is reduced by 1. Next it is checked if the 
SDS is equal to Zero. If it is, it means that the user hasn’t been able to answer 5 questions
of the same difficulty. In short, the questions are too difficult for him. In this case, the DL
is reduced by one to ease the user and the SDS returns to 1. Now, new cards of the reduced
difficulty are produced.<br/><br/>
Difficult: Here, if the user selects this option, the interval is calculated using our half-life
calculations based on Ebbinghaus’ Forgetting Curve equations and the SDS is increased by 0.5.<br/><br/>
Easy: Here, if the user selects this option, the Interval is again calculated using the halflife formula and the SDS is increased by 1.
In both Difficult and Easy options, if the SDS is equal to 5, the DL is increased by 1 thus
producing new questions that are more challenging in nature to keep the user challenged.<br/><br/> In
our implementation, we use the half-life calculations to adjust the time intervals according
to the needs of every individual.<br/><br/>
Another objective we want to achieve is a design that keeps the user engaged. For this
we decided to add game-like elements to our interface. Surface level designs that help us
retain users, for this we used the cross platform app development software flutter.


