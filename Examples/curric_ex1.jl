# Curric1: 8-vertex test curriculum - valid
#
#    A --------* C --------* E           G
#             */ |*
#             /  |
#    B-------/   D --------* F           H
#
#    (A,C) - pre;  (C,E) -  pre; (B,C) - pre; (D,C) - co; (C,E) - pre; (D,F) - pre
#
#

using CurricularAnalytics

a = Course("A", 3)
b = Course("B", 3)
c = Course("C", 3)
d = Course("D", 1)
e = Course("E", 3)
f = Course("F", 3)
g = Course("G", 3)
h = Course("H", 3)

add_requisite!(a,c,pre)
add_requisite!(b,c,pre)
add_requisite!(d,c,co)
add_requisite!(c,e,pre)
add_requisite!(d,f,pre)

curric = Curriculum("Underwater Basket Weaving", [a,b,c,d,e,f,g,h])

complexity(curric)
centrality(curric)
println("Analytics for $(curric.name):")
println("  blocking factor = $(curric.metrics["blocking factor"])")
println("  delay factor = $(curric.metrics["delay factor"])")
println("  curricular centrality = $(curric.metrics["centrality"])")
println("  curricular complexity = $(curric.metrics["complexity"])")

terms = Array{Term}(4)
terms[1] = Term([a,b])
terms[2] = Term([c,d])
terms[3] = Term([e,f])
terms[4] = Term([g,h])

dp = DegreePlan("MyPlan", curric, terms)

print_plan(dp)
