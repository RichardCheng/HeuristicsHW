function snew = neighbor2D(CurS)

	snew = [neighbor(CurS(1)), neighbor(CurS(2))];
    while ((snew(1) == CurS(1)) && (snew(2) == CurS(2)))
        snew = [neighbor(CurS(1)), neighbor(CurS(2))];
    end