data = load('final');
x = 0:0.025:1;

p= {1,1,1};

y = zeros(41,3);
for i=1:3
    close all
    hold on
    for j=1:3
        y = data(1+int32(round(40*i*x)),j);
        y = y';
        p{j} =spcrv([[x(1) x x(end)];[y(1) y y(end)]],5);
    end
    plot(p{1}(1,:),p{1}(2,:),'r');
    plot(x,data(1+int32(round(40*i*x)),1),'or');
    plot(p{2}(1,:),p{2}(2,:),'b');
    plot(x,data(1+int32(round(40*i*x)),2),'*b');
    plot(p{3}(1,:),p{3}(2,:),'y');
    plot(x,data(1+int32(round(40*i*x)),3),'.y');
    
    pause;
    close all
end