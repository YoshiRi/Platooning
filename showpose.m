function showpose(X,color)
w=1;
l=2;

x = X(1);
y = X(2);

R=[-l -l l l -l;-w w w -w -w];
alpha=X(3);
XY=[cos(alpha) -sin(alpha);sin(alpha) cos(alpha)]*R;


%plot
hold on;plot(XY(1,:)+x,XY(2,:)+y,'Color',color);
end