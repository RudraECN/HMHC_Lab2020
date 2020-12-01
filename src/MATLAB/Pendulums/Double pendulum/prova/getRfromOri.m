function RotMat = getRfromOri(or)

ZRotMat(1,1) = cos(or(3));
ZRotMat(1,2) = -sin(or(3));
ZRotMat(1,3) = 0;
ZRotMat(2,1) = sin(or(3));
ZRotMat(2,2) = cos(or(3));
ZRotMat(2,3) = 0;
ZRotMat(3,1) = 0;
ZRotMat(3,2) = 0;
ZRotMat(3,3) = 1;

YRotMat(1,1) = cos(or(2));
YRotMat(1,2) = 0;
YRotMat(1,3) = sin(or(2));
YRotMat(2,1) = 0;
YRotMat(2,2) = 1;
YRotMat(2,3) = 0;
YRotMat(3,1) = -sin(or(2));
YRotMat(3,2) = 0;
YRotMat(3,3) = cos(or(2));

XRotMat(1,1) = 1;
XRotMat(1,2) = 0;
XRotMat(1,3) = 0;
XRotMat(2,1) = 0;
XRotMat(2,2) = cos(or(1));
XRotMat(2,3) = -sin(or(1));
XRotMat(3,1) = 0;
XRotMat(3,2) = sin(or(1));
XRotMat(3,3) = cos(or(1));

RotMat =  ZRotMat * YRotMat * XRotMat;
