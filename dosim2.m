%%
dt = 0.5
initL = [0 0 0]'
initF = [-8 0 -0.1]'
sim('platooning');

%%
f1=figure(1);
plot(poseL);
grid on;
xlabel('Time[s]');
ylabel('Robot pose[m,rad]');
leg=legend('x','y','\omega','Location','Best');
leg.Interpreter = 'tex';
ylim([-150 250])
title('Leader');
pfig = pubfig(f1);
pfig.LegendLoc = 'best';
pfig.Interpreter = 'tex'
pfig.FigDim = [15 11];
expfig('leader2','-pdf');
%%

f2=figure(2);
plot(poseF);
grid on;
xlabel('Time[s]');
ylabel('Robot pose[m,rad]');
legend('x','y','\omega','Location','Best')
title('Follower');
pfig = pubfig(f2);
pfig.LegendLoc = 'best';
pfig.Interpreter = 'tex'
pfig.FigDim = [15 11];
expfig('follower2','-pdf');

f3=figure(3);
plot(poseL.Data(:,1),poseL.Data(:,2),'r--',poseF.Data(:,1),poseF.Data(:,2),'b')
grid on;
axis equal;
xlabel('x[m]');
ylabel('y[m]');
legend('Leader','Follower','Location','Best')
title('Trajectory');
pfig = pubfig(f3);
pfig.LegendLoc = 'best';
pfig.Interpreter = 'tex'
pfig.FigDim = [15 11];
expfig('trajectory2','-pdf');


%%
f4=figure(4);
plot(poseL.time,poseL.Data(:,1),'r--',poseF.time,poseF.Data(:,1),'b')
grid on;
xlabel('Time[s]');
ylabel('Robot pose[m]');
legend('Leader x','Follower x','Location','Best')
pfig = pubfig(f4);
pfig.LegendLoc = 'best';
pfig.Interpreter = 'tex'
pfig.FigDim = [15 11];
expfig('x_hikaku2','-pdf');


f5=figure(5);
plot(poseL.time,poseL.Data(:,3),'r--',poseF.time,poseF.Data(:,3),'b')
grid on;
xlabel('Time[s]');
ylabel('Robot pose[rad]');
legend('Leader \omega','Follower \omega','Location','Best')
pfig = pubfig(f5);
pfig.LegendLoc = 'best';
pfig.Interpreter = 'tex'
pfig.FigDim = [15 11];
expfig('omega_hikaku2','-pdf');

%%
f6=figure(6);
plot(inputL.time,inputL.Data(:,1),'r--',inputF.time,inputF.Data(:,1),'b-');
grid on;
xlabel('Time[s]');
ylabel('Robot velocity[m/s]');
legend('Leader input v','Follower input v','Location','Best')
pfig = pubfig(f6);
pfig.LegendLoc = 'best';
pfig.Interpreter = 'tex'
pfig.FigDim = [15 11];
expfig('inputv_hikaku2','-pdf');

f7 = figure(7);
plot(inputL.time,inputL.Data(:,2),'r--',inputF.time,inputF.Data(:,2),'b-');
grid on;
xlabel('Time[s]');
ylabel('Robot velocity[rad/s]');
legend('Leader input \omega','Follower input \omega','Location','Best')
pfig = pubfig(f7);
pfig.LegendLoc = 'best';
pfig.Interpreter = 'tex'
pfig.FigDim = [15 11];
expfig('inputw_hikaku2','-pdf');

%%
close 8;
f8 = figure(8);
max = 1000;
for i = 1:100:max
    cr = [1 0 0]*(max-i)/max + [1 1 0]*i/ max;
    showpose(poseL.Data(i,:),cr);
    cr = [0 0 1]*(max-i)/max + [0 1 1]*i/ max;
    showpose(poseF.Data(i,:),cr);
end
axis equal;
hold off;
grid on;
xlabel('x[m]');
ylabel('y[m]');
expfig('Moving2','-pdf');


f9 = figure(9);
max = 1000;
i=1
    cr = [1 0 0]*(max-i)/max + [1 1 0]*i/ max;
    showpose(poseL.Data(i,:),cr);
    cr = [0 0 1]*(max-i)/max + [0 1 1]*i/ max;
    showpose(poseF.Data(i,:),cr);
axis equal;
hold off;
grid on;
xlabel('x[m]');
ylabel('y[m]');
legend('Leader','Follower');
expfig('init_pose2','-pdf');

