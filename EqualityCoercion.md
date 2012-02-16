Equality and Coercion could be harmful
======================================

The goal of this page is to gather all problems due to equality accepting coercion in borderline cases

{{{
sage: bool(pi == 3.14159265358979323)
True
sage: hash(pi)
2943215493
sage: hash(3.14159265358979323)
1826823505
sage: dd
{3.1415926535897932: 'approx', pi: 'exact'}
sage: {0:"exact", 0.0000000000000000000:"approx"}
{0: 'approx'}
}}} 
as a consequence
{{{
sage: pii = 3.14159265358979323
sage: bool(pii == pi)
True
sage: dd = {pi: "exact"}
sage: pi in dd
True
sage: pii in dd
False
sage: pii in dd.keys()
True
}}}
