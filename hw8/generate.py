import sys;
import math;

def gcd(a, b):
    if (a > b):
        return gcd(b, a)
    else:
        if (a == 0):
            return b
        return gcd(b % a, a)

result = range(0,7)

def main():
    s = [0, 15, 20, 10, 13, 14, 11, 16]
    T = 2

    for x in range(0, 7):
        result[x] = range(0, 7)
    for t in range(0,7):
        for t2 in range(0,7):
            result[t][t2] = "0"

    for t in range(1, 8):
        count = 0
        for diff in range(-2, 3):
            if diff != 0:
                count += 1
        for diff in range(-2, 3):
            if diff != 0:
                nxt_ind = ((t + diff - 1) % 7) + 1
                if s[nxt_ind] - s[t] > 0:
                    gg = gcd(100*(s[nxt_ind] - s[t]), T)
                    ss = ""
                    if T/gg != 1:
                        ss = ("(-%d/%d)" % (100*(s[nxt_ind] - s[t])/gg, T/gg))
                    else:
                        ss = ("-%d" % (100*(s[nxt_ind]-s[t])/gg))
                    result[t-1][nxt_ind-1] = ("0.25*e^%s" % ss)

                    sys.stdout.write('S%d -> S%d [ label = "0.25*e^%s" ];\n' % (t, nxt_ind, ss))
                else:
                    result[t-1][nxt_ind-1] = "0.25" 
                    sys.stdout.write('S%d -> S%d [ label = "0.25" ];\n' % (t, nxt_ind))

    sys.stdout.write("MATRIX: \n")
    for t in range(0,7):
        for t2 in range(0,7):
            sys.stdout.write("%s " % result[t][t2])
        sys.stdout.write("\n")

main()
