%% a1
t1=tic;
n=5;
k=0;
while toc(t1)<2
    k=k+1;
    n=n*2
    A=zeros(n);
    b=zeros(n,1);
    for i=1:2*n
        for j=1:n
            if i==j
                A(i,j)=1/5;
            else
                A(i,j)=2*(i-j)+1;
            end
        end
        b(i)=1+0.4*i;
    end
    ata=A'*A;
    atb=A'*b;
    a=ata\atb;
    res(k)=norm(atb-ata*a);
    ns(k)=n;
end
plot(ns(1:k),res(1:k));

%% a2
t1=tic;
n=5;
k=0;
while toc(t1)<2
    k=k+1;
    n=n*2
    A=zeros(n);
    b=zeros(n,1);
    for i=1:2*n
        for j=1:n
            A(i,j)=7/(9*(i+j+1));
        end
        if mod(i,2)==0
            b(i)=7/(5*i);
        else
            b(i)=0;
        end
    end
    ata=A'*A;
    atb=A'*b;
    a=ata\atb;
    res(k)=norm(atb-ata*a);
    ns(k)=n;
end
plot(ns(1:k),res(1:k));

%% b1
t1=tic;
n=5;
k=0;
while toc(t1)<2
    k=k+1;
    n=n*2
    A=zeros(n);
    b=zeros(n,1);
    for i=1:2*n
        for j=1:n
            if i==j
                A(i,j)=1/5;
            else
                A(i,j)=2*(i-j)+1;
            end
        end
        b(i)=1+0.4*i;
    end
    [Q,R]=qr(A);
    a=R\Q'*b;
    res(k)=norm(R*a-Q'*b);
    ns(k)=n;
end
plot(ns(1:k),res(1:k));

%% b2
t1=tic;
n=5;
k=0;
while toc(t1)<2
    k=k+1;
    n=n*2
    A=zeros(n);
    b=zeros(n,1);
    for i=1:2*n
        for j=1:n
            A(i,j)=7/(9*(i+j+1));
        end
        if mod(i,2)==0
            b(i)=7/(5*i);
        else
            b(i)=0;
        end
    end
    [Q,R]=qr(A);
    a=R\Q'*b;
    res(k)=norm(R*a-Q'*b);
    ns(k)=n;
end
plot(ns(1:k),res(1:k));